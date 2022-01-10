function[pred_gpr,sigma_gpr]=gpr_EI40byEIg(new_X)
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
%% Conversion proposed by Haselton et al. (2016) 
new_X(:,2)=log(new_X(:,2)+0.1);
new_X(:,9)=log(40*new_X(:,9)+0.02);
new_X(:,10)=log(40*new_X(:,10)+0.02);

%% Mean and Standard deviation of each predictor variable

mean_X=[3.82514619883041,-1.06568100441061,57.9181111111111,446.783625730994,0.0278947368421053,18.0809649122807,9.16374269005848,207.647648654971,0.00922748538011695,0.0889824561403508,534.817954174793,0.707602339181287,547.675059564787,109777.926549708];
std_X=[1.45550046243456,0.476024250836222,30.1061721894257,55.7884129943109,0.0114501747387534,5.47396080161203,3.95879898950231,139.571186653672,0.00488432114538506,0.0449089894949920,265.582006317536,0.456199884977320,395.151374914362,72987.9936806893];

%% %% The most influential predictors on which the GPR model is fitted.  
ind2=[1:5,6,14];
X_pred=new_X(:,ind2);
mean_X=mean_X(ind2);std_X=std_X(ind2);

%% Centering and Scaling
[mnew,nnew]=size(X_pred);
X_new=zeros(mnew,nnew);
for nn=1:(length(mean_X))
X_new(:,nn)=(X_pred(:,nn)-ones(mnew,1)*mean_X(nn))./std_X(nn);
end
%% GPR Prediction
cd .. 
cd Fitted_Models
 load('gp_model_EI40byEIg.mat')
[pred_gpr,sigma_gpr]=predict(gp_model_EI40byEIg,X_new);

cd ..
end