%% Generate test vectors


input_sample_rate = 31.56e6; % Hz 
x=2;

t = [0:63]'/input_sample_rate;
xt.time = 0;
xt.signals.values = x;
xt.signals.dimensions = 1;

%% Configure Simulink models
% %List all the % parameters of a block
% load_system('CEN598_HW2/From Workspace');
% list = get_param('CEN598_HW2/From Workspace','ObjectParameters');

% Set the value of a parameter in a block
BlockName = 'HW3';  %% Give your blockname. It should match with the name of your model

set_param([BlockName '/To Workspace'],'VariableName','yt1')
set_param([BlockName '/To Workspace'],'SaveFormat',['Structure With Time'])

set_param([BlockName '/From Workspace'],'VariableName','xt')

%% Verify the results 

