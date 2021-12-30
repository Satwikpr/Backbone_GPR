new_pred=readtable('new_data_pred_14_var.xlsx');%readtable('new_data_pred_sensitivity');%
 new_pred_My=readtable('new_data_pred_My.xlsx');
[a1 b1]=gpr_EIybyEIg(new_pred);
[a2 b2]=gpr_EI40byEIg(new_pred);
[a3 b3]=gpr_McbyMy(new_pred);
[a4 b4]=gpr_Theta_cap_pl(new_pred);
[a5 b5]=gpr_Theta_Pc(new_pred);
[a6 b6]=gpr_Lamda(new_pred);
[a7 b7]=gpr_My(new_pred_My(1:32,:));
a=[a1 a2 a3 a4 a5 a6];
b=[b1 b2 b3 b4 b5 b6];

