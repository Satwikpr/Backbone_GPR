function[pred_gpr sigma_gpr]=gpr_McbyMy(new_X)

% new_X.v=log(new_X.v+0.1);
% new_X.rosheff=log(40*new_X.rosheff+0.02);
% new_X.rosh=log(40*new_X.rosh+0.02);
new_X(:,2)=log(new_X(:,2)+0.1);
new_X(:,9)=log(40*new_X(:,9)+0.02);
new_X(:,10)=log(40*new_X(:,10)+0.02);
mean_X=[3.91764705882353,-1.06567358075725,59.6390213903743,447.122994652406,0.0278288770053476,17.8450000000000,9.11871657754011,212.382975401069,-1.05723489986302,1.14562407480125,546.795779520205,0.732620320855615,544.109126965193,106821.283422460];
std_X=[1.46090957950655,0.486270926941487,30.0036999702164,54.4438238212028,0.0110074569211916,5.47210266048451,3.82819512484193,152.673012733812,0.527863703769223,0.519671059209339,272.734277766872,0.443780290759473,396.563034802933,71701.0964606069];
ind2=[1:2,4:11,14];
X_pred=new_X(:,ind2);
mean_X=mean_X(ind2);std_X=std_X(ind2);


% X_pred=table2array(X_pred);

[mnew,nnew]=size(X_pred);
X_new=zeros(mnew,nnew);
for nn=1:(length(mean_X))
X_new(:,nn)=(X_pred(:,nn)-ones(mnew,1)*mean_X(nn))./std_X(nn);
end

 load('gp_model_McbyMy.mat')
[pred_gpr sigma_gpr]=predict(gp_model_McbyMy,X_new);
end