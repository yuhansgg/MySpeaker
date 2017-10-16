function M3 = blockFrames(s, fs, m, n)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: blockFrames() Puts the signal into frames ��֡�Ӵ�
% input :   s:��������������ź�   fs������Ƶ��  m��֡��  n������
% output:   M3:��֡���źŽ��мӴ������Ƶ�ʵľ���
% author:   Christian Cornaz
% rewriter: yuhansgg��Shi Gaige��
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%��֡������ʼ��
l = length(s);  %l�ź�s�ĳ���
nbFrame = floor((l - n) / m) + 1;
%����֡��floor������ȡ�ӽ�A�����������ֲ����������룻
for i = 1:n
 %i��ʾÿ֡�ĵ�
for j = 1:nbFrame
 %j��ʾ֡��
M(i, j) = s(((j - 1) * m) + i);
%M�洢��֡����źţ���һ�б�ʾ��һ֡���ڶ��б�ʾ�ڶ�֡
end
end
%%��֡������

h = hamming(n);
M2 = diag(h) * M;
%��ÿ֡�źżӴ�������������ɶԽ����ٳ��Է�֡�źž���
for i = 1:nbFrame
M3(:, i) = fft(M2(:, i));
end
%��ÿ֡���и���Ҷ�仯�����Ƶ��ֵ
