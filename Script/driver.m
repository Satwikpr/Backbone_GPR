%%%%%% Prediction of Beam Column Model Parameters %%%%%%%%
%%%%%% Satwik Rayjada, Jayadipta Ghosh , Meera Raghunandan %%%%%%
%%%%%% Last Updated : 10-01-2022 %%%%%%

%% Loading Input variables
% Input Order - [LsbyH v fc fy ro db sn Ash rosh rosheff fysh asl Vn A]
% 1.LsbyH -  Shear span to effective depth ratio (Ls/H)
% 2.v -  Axial load ratio  (v) 
% 3.fc -  Concrete compressive strength -MPa (fc)
% 4.fy -  Longitudinal reinforcement yield strength - MPa (fy)
% 5.ro -  Longitudinal reinforcement ratio (ρ) 
% 6.db -  Diameter of bar - mm (db)
% 7.Sn -  Rebar buckling coefficient (Sn)
% 8.Ash-  Transverse reinforcement area - sq. mm (Ash)
% 9.rosh - Transverse reinforcement ratio (ρsh) 
% 10.rosheff - Effective transverse reinforcement ratio (ρsh) 
% 11.fysh -  Transverse reinforcement yield stress - MPa (fy,sh) 	   
% 12.asl - Indicator variable for the possibility of rebar slip (αsl)
% 13.Vn - Nominal Shear Capacity (Vn)-kN (As per ACI 316 - 016)
% 14.A - Cross Sectional area - sq. mm (A)

new_pred=table2array(readtable('new_data_pred_14_var.xlsx'));

% for My
% Input Order -[ky fi_y	delta_Dash fc fy ro_comb ro	A v]
% 1. fi_y - Yield Curvature (ϕy) (as per Panagiotakos and Fardis (2001))
% 2. ky -Compression zone depth (ky)(as per Panagiotakos and Fardis (2001))
% 3. delta_dash- Distance of the center of the rebar from the extreme fiber and effective depth (d'/d)-δ'
% 4. fc -  Concrete compressive strength -MPa (fc)
% 5. fy -  Longitudinal reinforcement yield strength - MPa (fy)
% 6. ro_comb - ρcomb as mentioned in paper
% 7. ro -  Longitudinal reinforcement ratio (ρ) 
% 8. A - Cross Sectional area - sq. mm (A)
% 9. v -  Axial load ratio  (v) 
new_pred_My=table2array(readtable('new_data_pred_My.xlsx')); 

%% Prediction
cd Pre_Processing_Files
[Pred_EIybyEIg,Sigma_EIybyEIg]=gpr_EIybyEIg(new_pred);
[Pred_EI40byEIg,Sigma_EI40byEIg]=gpr_EI40byEIg(new_pred);
[Pred_McbyMy,Sigma_McbyMy]=gpr_McbyMy(new_pred);
[Pred_Theta_cap_pl,Sigma_Theta_cap_pl]=gpr_Theta_cap_pl(new_pred);
[Pred_Theta_Pc,Sigma_Theta_Pc]=gpr_Theta_Pc(new_pred);
[Pred_Lamda,Sigma_Lamda]=gpr_Lamda(new_pred);

% for My - (log(My/bd^3))
[Pred_Mybd3,Sigma_Mybd3]=gpr_My(new_pred_My(1:32,:));

%% Output
Backbone_output=exp([ Pred_EIybyEIg Pred_EI40byEIg Pred_McbyMy Pred_Theta_cap_pl Pred_Theta_Pc Pred_Lamda]);
Sigma=[Sigma_Mybd3 Sigma_EIybyEIg Sigma_EI40byEIg Sigma_McbyMy Sigma_Theta_cap_pl Sigma_Theta_Pc Sigma_Lamda];

