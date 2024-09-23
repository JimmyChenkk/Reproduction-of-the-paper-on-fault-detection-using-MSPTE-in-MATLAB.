function [TsymX_Y_max] = find_TsymX_Y_max(X,Y,taomax,data,lsw,s)
TsymX_Y_max=zeros(taomax,2);
 for tao=1:taomax
     TsymX_Y_max(tao,1) = TsymX_Ytao(tao,X,Y,data,lsw,s);
     TsymX_Y_max(tao,2) = tao;
 end
end

