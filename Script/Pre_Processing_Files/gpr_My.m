function[pred_gpr, sigma_gpr]=gpr_My(new_X)
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
%% Conversion proposed by Haselton et al. (2016) 
new_X(:,9)=log(new_X(:,9)+0.1);

%% Mean and Standard deviation of each predictor variable
mean_X=[0.324377000492110,2.29644265549445e-05,0.130560175368525,39.4334657398213,465.763356504468,0.00833573423887213,0.0172445183714002,102792.632492552,-1.65794007214812];
std_X=[0.0974983539696791,2.61213406863524e-05,0.0527722362155348,22.6219320867283,145.033685940577,0.00420928335292089,0.00899454444443037,108776.153726080,0.607189541570501];
%% The most influential predictors on which the GPR model is fitted. 
ind2=[1:9];
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
load('gp_model_My.mat')
[pred_gpr,sigma_gpr]=predict(gp_model_My,X_new);

cd ..
end