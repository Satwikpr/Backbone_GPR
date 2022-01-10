function[pred_gpr,sigma_gpr]=gpr_Lamda(new_X)
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
mean_X=[3.88830409356725,-1.08195179370592,59.5871169590643,447.216374269006,0.0275087719298245,17.6242982456140,9.06432748538012,205.944686549708,-1.07191864237505,1.12718073462811,544.828627966881,0.707602339181287,531.861985522883,107516.842105263];
std_X=[1.44164246237966,0.499248337838405,30.0515909896593,54.5025090707945,0.0114451985417223,5.27677381148606,3.88852943446629,149.723329311285,0.528309821941286,0.523103258240329,268.356119637188,0.456199884977320,374.805982044097,72261.6715450446];

%% The most influential predictors on which the GPR model is fitted. 
ind2=[1,2,4,5,6,7,9,10,13,14];
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
load('gp_model_Lamda.mat')
[pred_gpr,sigma_gpr]=predict(gp_model_Lamda,X_new);

cd ..
end