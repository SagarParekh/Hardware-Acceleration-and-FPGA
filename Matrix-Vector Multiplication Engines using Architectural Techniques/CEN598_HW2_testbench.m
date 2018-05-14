%% Generate test vectors
clear;
input_sample_rate = 31.56e6; % Hz 
A = double(rand(64,64));
x = double(rand(64,1));

t = [0:63]'/input_sample_rate;
xt.time = t;
xt.signals.values = x;
xt.signals.dimensions = 1;
for i = 1:64 
   At(i).time = t;
   At(i).signals.values = A(i,:)';
   At(i).signals.dimensions = 1;
end

y_matlab = A*x;

%% Configure Simulink models
% %List all the % parameters of a block
% load_system('CEN598_HW2/From Workspace');
% list = get_param('CEN598_HW2/From Workspace','ObjectParameters');

% Set the value of a parameter in a block
BlockName = 'Base'; %Enter your model name here
set_param([BlockName '/From Workspace'],'VariableName','At(1)')
set_param([BlockName '/To Workspace'],'VariableName','yt1')
set_param([BlockName '/To Workspace'],'SaveFormat',['Structure With Time'])
for i=1:63
    set_param([BlockName '/From Workspace' num2str(i)],'VariableName',['At(' num2str(i+1) ')'])
    set_param([BlockName '/To Workspace' num2str(i)],'VariableName',['yt' num2str(i+1)])
    set_param([BlockName '/To Workspace' num2str(i)],'SaveFormat',['Structure With Time'])
end
set_param([BlockName '/From Workspace64'],'VariableName','xt')

%% Verify the results 

