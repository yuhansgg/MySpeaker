
function d = disteu(x, y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: disteu()��������ж�Ӧ����֮���ŷ����¾���
% input :   x��y :ÿ��Ϊһ֡���ݵ���������
% output:   d: Ԫ��d(i,j)������x(:,i)��y(:,j)��ŷ����¾���
% author:   yuhansgg��Shi Gaige��
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��������x��y��ŷ�Ͼ���ΪD=sum((x-y).^2).^0.5

[M, N] = size(x); %
[M2, P] = size(y); 

if (M ~= M2)%���������������������
    error('����ά����ƥ��')
end

d = zeros(N, P);%ŷ�Ͼ���Ľ��ΪN��Pά����

if (N < P)
    copies = zeros(1,P);
    for n = 1:N
        d(n,:) = sum((x(:, n+copies) - y) .^2);
        % N<P,����x��������ʹ����y������ͬ��x(:,n+copies):x��ÿһ�ж��õ�n���滻
        % �൱��x�ĵ�n�м�ȥy��ÿһ����ƽ����Ȼ����зֱ����
    end
else
    copies = zeros(1,N);
    for p = 1:P
        d(:,p) = sum((x - y(:, p+copies)) .^2)';
    end
end

d = d.^0.5;
