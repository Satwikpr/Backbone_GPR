function[pred_gpr sigma_gpr]=gpr_EIybyEIg(new_X)

% new_X.v=log(new_X.v+0.1);
% new_X.rosheff=log(40*new_X.rosheff+0.02);
% new_X.rosh=log(40*new_X.rosh+0.02);
new_X(:,2)=log(new_X(:,2)+0.1);
new_X(:,9)=log(40*new_X(:,9)+0.02);
new_X(:,10)=log(40*new_X(:,10)+0.02);
mean_X=[3.65357142857143,-1.05305068218743,55.1789132653062,442.040816326531,0.0277806122448980,17.9774132653061,9.95612244897959,194.958943673469,-1.14943443747942,1.08871543989779,520.902081860893,0.719387755102041,500.500859517401,106868.316734694];
std_X=[1.46011502883708,0.486049760186077,29.9284212068734,59.4268209096932,0.0107683216144608,5.80782516403759,5.26623626270916,136.753011618651,0.578758980157872,0.596328411849493,253.712598041947,0.450448930089221,390.520954662953,73999.0742069460];

ind2=[1:5,6,7,14];
X_pred=new_X(:,ind2);
mean_X=mean_X(ind2);std_X=std_X(ind2);


% X_pred=table2array(X_pred);

[mnew,nnew]=size(X_pred);
X_new=zeros(mnew,nnew);
for nn=1:(length(mean_X))
X_new(:,nn)=(X_pred(:,nn)-ones(mnew,1)*mean_X(nn))./std_X(nn);
end

 load('gp_model_EIybyEIg.mat')
[pred_gpr sigma_gpr]=predict(gp_model_EIybyEIg,X_new);
end