function[pred_gpr sigma_gpr]=gpr_Theta_Pc(new_X)

%% Conversion proposed by Haselton et al. (2016) 
new_X(:,2)=log(new_X(:,2)+0.1);         
new_X(:,9)=log(40*new_X(:,9)+0.02);
new_X(:,10)=log(40*new_X(:,10)+0.02);


%% Mena and Standard deviation of each predictor variables
mean_X=[3.86718750000000,-0.961461109643237,71.4894687500000,449.015625000000,0.0298281250000000,16.9949218750000,9.55312500000000,207.852268750000,0.00902343750000000,0.981157559539007,596.344618558290,0.750000000000000,532.642889431193,96999.7162500000];
std_X=[1.40340342404988,0.409723080055857,27.3712587760069,47.4985353784223,0.0133577807864811,6.77242011397320,5.28330610628406,175.524839603778,0.00517106547577595,0.534844081155142,297.719665959396,0.436435780471985,408.483496865455,70626.9121957226];

%% The most influential predictors on which the GPR model is fitted. 
ind2=[1,2,4,10];
X_pred=new_X(:,ind2);
mean_X=mean_X(ind2); % Required Means 
std_X=std_X(ind2);   % Required Standard Deviations

%% Centering and Scaling
[mnew,nnew]=size(X_pred);
X_new=zeros(mnew,nnew);

for nn=1:(length(mean_X))
X_new(:,nn)=(X_pred(:,nn)-ones(mnew,1)*mean_X(nn))./std_X(nn);
end

%% GPR Prediction
load('gp_model_Theta_Pc.mat')
[pred_gpr sigma_gpr]=predict(gp_model_Theta_Pc,X_new);
end