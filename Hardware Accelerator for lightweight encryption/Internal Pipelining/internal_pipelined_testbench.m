clear;
input_sample_rate = 31.56e06; % Hz 
t = [0:10000]'/input_sample_rate;

x_i1(1:10001)=uint16(25957);
x_i(1:10001)=uint16(26743);
k_i(1:10001)=uint16(256);
k_i1(1:10001)=uint16(2312);
k_i2(1:10001)=uint16(4368);
k_i3(1:10001)=uint16(6424);
x_i11 = x_i1';
x_i1 = x_i';
k_i01 = k_i';
k_i11 = k_i1';
k_i21 = k_i2';
k_i31 = k_i3';
x_i1t.time = t;
x_i1t.signals.values = x_i11;
x_it.time = t;
x_it.signals.values = x_i1;
k_it.time = t;
k_it.signals.values = k_i01;
k_i1t.time = t;
k_i1t.signals.values = k_i11;
k_i2t.time = t;
k_i2t.signals.values = k_i21;
k_i3t.time = t;
k_i3t.signals.values = k_i31;

BlockName = 'simon_internal_pipelined_interleaved';
set_param([BlockName '/From Workspace'],'VariableName','x_i1t')
set_param([BlockName '/To Workspace'],'VariableName','X_i1')
set_param([BlockName '/To Workspace'],'SaveFormat',['Structure With Time'])
set_param([BlockName '/From Workspace1'],'VariableName','x_it')
set_param([BlockName '/To Workspace1'],'VariableName','X_i')
set_param([BlockName '/To Workspace1'],'SaveFormat',['Structure With Time'])
set_param([BlockName '/From Workspace2'],'VariableName','k_it')
set_param([BlockName '/To Workspace2'],'VariableName','K_i')
set_param([BlockName '/To Workspace2'],'SaveFormat',['Structure With Time'])
set_param([BlockName '/From Workspace3'],'VariableName','k_i1t')
set_param([BlockName '/To Workspace3'],'VariableName','K_i1')
set_param([BlockName '/To Workspace3'],'SaveFormat',['Structure With Time'])
set_param([BlockName '/From Workspace4'],'VariableName','k_i2t')
set_param([BlockName '/To Workspace4'],'VariableName','K_i2')
set_param([BlockName '/To Workspace4'],'SaveFormat',['Structure With Time'])
set_param([BlockName '/From Workspace5'],'VariableName','k_i3t')
set_param([BlockName '/To Workspace5'],'VariableName','K_i3')
set_param([BlockName '/To Workspace5'],'SaveFormat',['Structure With Time'])