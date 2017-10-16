function [code,dkmax,dkmin ]= train(traindir, n)  %���ģ�n Ϊ������ѵ���ڼ���

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: train() ѵ��
% input :   testdir : ���������ļ���
%           n       : testdir�в����ļ����е�N��
% output:   codeΪ��ѵ���õ����飻ѵ��ʱͬʱ�õ���mfcc.m��vqlb.m;
%           dkmax  ѵ������������֮���������
%           dkmin  ѵ������������֮�����С����
% rewriter: yuhansgg��Shi Gaige��
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Note:
%       Sound files in traindir is supposed to be: 
%                       s1.wav, s2.wav, ..., sn.wav
% Example:
%       >> code = train('C:\data\train\', 8);

k = 16;                         % number of centroids required

 for i = 1:n                      % train a VQ codebook for each speaker
         
    file=sprintf('%s%d.wav', traindir, i);   %%
    disp(file);
    % �����洢·����ʾ
    cut(file);  
    
    [s, fs] = audioread(file);
    
    v = mfcc(s, fs);            % Compute MFCC's
   
    code{i} = vqlbg(v, k);      % Train VQ codebook�������飻
 end
 
if n ==3       
  d1 = disteu(code{1}, code{2});
  d2 = disteu(code{2}, code{3});
  d3 = disteu(code{1}, code{3});
  
  dk(1) = sum(min(d1,[],2)) / size(d1,1);
  dk(2) = sum(min(d2,[],2)) / size(d2,1);
  dk(3) = sum(min(d2,[],2)) / size(d2,1);
  
  dkmax = max(dk)
  dkmin = min(dk)
  
else
    dkmax=0;
    dkmin=0;   
end
