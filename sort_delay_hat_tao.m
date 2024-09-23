function [b] = sort_delay_hat_tao(lsw,delay_hat_tao)
sort_delay_hat_tao=zeros(2,lsw);
for j=1:lsw
    sort_delay_hat_tao(1,j)=delay_hat_tao(1,j);
    sort_delay_hat_tao(2,j)=j;
end
a=sortrows(sort_delay_hat_tao');
b=a(:,2)';
end

