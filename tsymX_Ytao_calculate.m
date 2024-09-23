function [tsymX_Ytao] = tsymX_Ytao_calculate(Nsw,t,tao,s,sort_hat_tao,M,X,Y)

n=t;
n_tao=t+tao;
pyyxz_data=[sort_hat_tao(1+tao:Nsw,:,Y),sort_hat_tao(1:Nsw-tao,:,Y),sort_hat_tao(1:Nsw-tao,:,X)];
pyxz_data=[sort_hat_tao(:,:,Y),sort_hat_tao(:,:,X)];
pyyz_data=[sort_hat_tao(1+tao:Nsw,:,Y),sort_hat_tao(1:Nsw-tao,:,Y)];
pyz_data=[sort_hat_tao(:,:,Y)];

pyyxz_goal=[sort_hat_tao(n_tao,:,Y),sort_hat_tao(n,:,Y),sort_hat_tao(n,:,X)];
pyxz_goal=[sort_hat_tao(n,:,Y),sort_hat_tao(n,:,X)];
pyyz_goal=[sort_hat_tao(n_tao,:,Y),sort_hat_tao(n,:,Y)];
pyz_goal=[sort_hat_tao(n,:,Y)];

for v=1:M
    if(v~=Y && v~=X)
            pyyxz_data=[pyyxz_data,sort_hat_tao(1:Nsw-tao,:,v)];
            pyyxz_goal=[pyyxz_goal,sort_hat_tao(n,:,v)];

            pyxz_data=[pyxz_data,sort_hat_tao(:,:,v)];
            pyxz_goal=[pyxz_goal,sort_hat_tao(n,:,v)];

            pyyz_data=[pyyz_data,sort_hat_tao(1:Nsw-tao,:,v)];
            pyyz_goal=[pyyz_goal,sort_hat_tao(n,:,v)];

            pyz_data=[pyz_data,sort_hat_tao(:,:,v)];
            pyz_goal=[pyz_goal,sort_hat_tao(n,:,v)];
    end
end

compare_pyyxz=pyyxz_data;
for i=1:100
    compare_pyyxz=[compare_pyyxz;pyyxz_goal];
end

pyyxz = p_caculate(pyyxz_data,pyyxz_goal);
pyxz = p_caculate(pyxz_data,pyxz_goal);
pyyz = p_caculate(pyyz_data,pyyz_goal);
pyz = p_caculate(pyz_data,pyz_goal);


tsymX_Ytao = pyyxz*(log((pyyxz/pyxz)/(pyyz/pyz)));

% if pyyxz==0 || pyxz==0 || pyyz==0 || pyz==0
%     tsymX_Ytao=0;
% end

end

