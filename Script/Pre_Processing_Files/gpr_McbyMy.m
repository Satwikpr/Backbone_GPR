function[pred_gpr,sigma_gpr]=gpr_McbyMy(new_X)
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
mean_X=[3.91764705882353,-1.06567358075725,59.6390213903743,447.122994652406,0.0278288770053476,17.8450000000000,9.11871657754011,212.382975401069,-1.05723489986302,1.14562407480125,546.795779520205,0.732620320855615,544.109126965193,106821.283422460];
std_X=[1.46090957950655,0.486270926941487,30.0036999702164,54.4438238212028,0.0110074569211916,5.47210266048451,3.82819512484193,152.673012733812,0.527863703769223,0.519671059209339,272.734277766872,0.443780290759473,396.563034802933,71701.0964606069];

%% The most influential predictors on which the GPR model is fitted. 
ind2=[1:2,4:11,14];
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
load('gp_model_McbyMy.mat')
[pred_gpr,sigma_gpr]=predict(gp_model_McbyMy,X_new);

cd ..
end