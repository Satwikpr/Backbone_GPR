function[pred_gpr sigma_gpr]=gpr_Lamda(new_X)
% 
% new_X.v=log(new_X.v+0.1);
% new_X.rosheff=log(40*new_X.rosheff+0.02);
% new_X.rosh=log(40*new_X.rosh+0.02);
new_X(:,2)=log(new_X(:,2)+0.1);
new_X(:,9)=log(40*new_X(:,9)+0.02);
new_X(:,10)=log(40*new_X(:,10)+0.02);
mean_X=[3.88830409356725,-1.08195179370592,59.5871169590643,447.216374269006,0.0275087719298245,17.6242982456140,9.06432748538012,205.944686549708,-1.07191864237505,1.12718073462811,544.828627966881,0.707602339181287,531.861985522883,107516.842105263];
std_X=[1.44164246237966,0.499248337838405,30.0515909896593,54.5025090707945,0.0114451985417223,5.27677381148606,3.88852943446629,149.723329311285,0.528309821941286,0.523103258240329,268.356119637188,0.456199884977320,374.805982044097,72261.6715450446];

ind2=[1,2,4,5,6,7,9,10,13,14];
X_pred=new_X(:,ind2);
mean_X=mean_X(ind2);std_X=std_X(ind2);


% X_pred=table2array(X_pred);

[mnew,nnew]=size(X_pred);
X_new=zeros(mnew,nnew);
for nn=1:(length(mean_X))
X_new(:,nn)=(X_pred(:,nn)-ones(mnew,1)*mean_X(nn))./std_X(nn);
end

 load('gp_model_Lamda.mat')
[pred_gpr sigma_gpr]=predict(gp_model_Lamda,X_new);
end