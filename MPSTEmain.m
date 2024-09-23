clc
clear
load('C:\Users\whk13\Desktop\SRTP\SRTP\DATA\Case_16_data.mat')
load('C:\Users\whk13\Desktop\SRTP\SRTP\DATA\Case_36_data.mat')
load('C:\Users\whk13\Desktop\SRTP\SRTP\CODE\AGRU\test1.mat')
load('C:\Users\whk13\Desktop\SRTP\SRTP\CODE\AGRU\train1.mat')
data = [Var_16_21,Var_16_32,Var_16_98,Var_16_99,Var_16_3536,Var_16_3740,Var_16_96,Var_16_100,Var_16_101,Var_16_102,Var_16_139,Var_16_140,Var_16_254,Var_16_2,Var_16_108,Var_16_52,Var_16_119,Var_16_123,Var_16_238,Var_16_242];
 
% data = [datatrain' datatest'];
data=data(3000:5500,:)';

% for t=1:501
%     data(2,t)=data(1,t)+0.1*t;
% end
%data=data(1:2,:);

 lsw=2;
 s=1;
%  X=5;
%  Y=11;
 taomax=20;
 X_Y_Y_X=zeros(taomax,500);
 colnum=1;
 for i=1:20
     for j=i+1:20
         tempX_Y=find_TsymX_Y_max(i,j,taomax,data,lsw,s);
         tempY_X=find_TsymX_Y_max(j,i,taomax,data,lsw,s);
         X_Y_Y_X(:,colnum)=tempX_Y(:,1);
         X_Y_Y_X(:,colnum+1)=tempY_X(:,1);
         colnum=colnum+2;
     end
 end

% plot(X_Y(:,2), X_Y(:,1), 'b-');  % 蓝色线条
% hold on;  % 保持图形，以便在同一个图中绘制另一条线
% plot(Y_X(:,2), Y_X(:,1), 'r--');  % 红色虚线条

%  TsymX_Y=zeros(taomax,2);
%  for tao=1:taomax
%      TsymX_Y(tao,1) = TsymX_Ytao(tao,X,Y,data,lsw,s);
%      TsymX_Y(tao,2) = tao;
%  end