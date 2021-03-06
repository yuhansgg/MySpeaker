function r = vqlbg(c,k) %\\\\\\\\\\\\\\\\\\\\\我把所有的d都改成了c；

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: vqlbg() 矢量量化
% input :   c：待训练的向量
%           k：要求的质心数
% output:   r：矢量量化后的码书，k列，每个质点一列
% rewriter: yuhansgg（Shi Gaige）
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 用LBG算法进行矢量量化

e = 0.01;%分解系数，即分裂参数；
r = mean(c,2); % 返回c中每一行的平均值,构成一个列向量\\形成第一个码字，即所有帧的特征矢量的形心；
dpr = 10000;   % dpr是平均初始失真D0；

for i = 1:log2(k)%log2(k)表示当要求质心数为K时，所需分裂的次数；
    
    r = [r*(1+e), r*(1-e)];%分解成两倍列数，即将当前的码书R按括号内的规则分裂，形成2M个码字；
    while (1 == 1)
        z = disteu(c, r);%d与r的欧氏距离，即待训练的矢量与矢量量化后的码书之间的距离；
        [m,ind] = min(z, [], 2);
        % 找出z中每一行中最小的数返回到m，并把每个数的列号返回到ind
        % 行数即为d中的行数（列数），列数为r中的列数
        t = 0; % t表示平均失真D；
        for j = 1:2^i
            r(:, j) = mean(c(:, find(ind == j)), 2);%
            % 找出当ind==j时，数j在z中的所有列数
            % 即z中第j列至少有一个元素在它所在的行是最小的
            % 求这些列的行平均
            % 有可能ind!=j,则r(:,j)会是一个空向量
            x = disteu(c(:, find(ind == j)), r(:, j));%x
            for q = 1:length(x)
                t = t + x(q); % x(q)
            end
        end
        %若相对失真小于某一数值，则停止计算；
        if (((dpr - t)/t) < e)
    break;
        else
            dpr = t;
        end
    end
end

