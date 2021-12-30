function[pred_gpr sigma_gpr]=gpr_My(new_X)

new_X(:,9)=log(new_X(:,9)+0.1);

mean_X=[0.324377000492110,2.29644265549445e-05,0.130560175368525,39.4334657398213,465.763356504468,0.00833573423887213,0.0172445183714002,102792.632492552,-1.65794007214812];
std_X=[0.0974983539696791,2.61213406863524e-05,0.0527722362155348,22.6219320867283,145.033685940577,0.00420928335292089,0.00899454444443037,108776.153726080,0.607189541570501];
ind2=[1:9];
X_pred=new_X(:,ind2);
mean_X=mean_X(ind2);std_X=std_X(ind2);


% X_pred=table2array(X_pred);

[mnew,nnew]=size(X_pred);
X_new=zeros(mnew,nnew);
for nn=1:(length(mean_X))
X_new(:,nn)=(X_pred(:,nn)-ones(mnew,1)*mean_X(nn))./std_X(nn);
end

 load('gp_model_My.mat')
[pred_gpr sigma_gpr]=predict(gp_model_My,X_new);
end