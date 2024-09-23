function [p] = p_caculate(data,goal)
p=0;
for i=1:size(data,1)
    p=p+isequal(data(i,:),goal);
end

% if p==0
%     p=1;
% end

p=p/size(data,1);
end

