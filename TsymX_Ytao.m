function [TsymX_Ytao] = TsymX_Ytao(tao,X,Y,data,lsw,s)
N=size(data,2);
M=size(data,1);
sum=zeros(M,N-tao+1);
for i=1:N-tao+1
    for j=0:tao-1
        sum(:,i)=sum(:,i)+data(:,i+j);
    end
end
sum=sum/tao;

Nsw=N-tao+1-(lsw-1)*s;
delay_hat_tao=zeros(Nsw,lsw);
for v=1:M
    for i=1:Nsw
        for j=1:lsw
            delay_hat_tao(i,j,v)=sum(v,i+(j-1)*s);
        end
    end
end

for v=1:M
    for i=1:Nsw
        sort_hat_tao(i,:,v)=sort_delay_hat_tao(lsw,delay_hat_tao(i,:,v));
    end
end

TsymX_Ytao=0;
for t=1:Nsw-tao
    TsymX_Ytao=TsymX_Ytao+tsymX_Ytao_calculate(Nsw,t,tao,s,sort_hat_tao,M,X,Y);
end
end

