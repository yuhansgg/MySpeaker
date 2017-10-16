function result=test(testdir, n, code, dkmax ,dkmin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: test() 测试
% input :   testdir : 测试声音文件名
%           n       : testdir中测试文件数中第N个
%           code    : 所有说话人已训练好的码书
% output:   测试结果
% author:   yuhansgg（Shi Gaige）
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 注意:
%       testdir中声音文件名的格式如下: 
%               1.wav, 2.wav, ..., n.wav

    % 读取每个说话人的声音文件read test sound file of each speaker
    file = sprintf('%s%d.wav', testdir, n);   
    cut(file);
    
    [s, fs] = audioread(file);      
        
    v = mfcc(s,fs);            % 计算MFCC
   
    distmin = inf;              %无穷
    k1 = 0;
   
  for i = 1:length(code)      % code的最大长度，对于每个训练码书，计算失真each trained codebook, compute distortion（畸变，失真）
        d = disteu(v, code{i}); %码书 
                dist = sum(min(d,[],2)) / size(d,1) %size(d,1): 列的长度即行数
          % min(A,[],dim),dim取1或2，取1时，与min(A)完全相同，取2时，该函数返回一个列向量，其第i个元素是A矩阵的第i行上的最小值     
        if dist < distmin
            distmin = dist;
           k1 = i;
        end      
  end
  
  if distmin < 4.2
      result = ['密码正确 ', num2str(distmin)];
  elseif distmin > 4.6
      result = ['密码错误 ' , num2str(distmin)];
  else result =[ '再测一次 ' , num2str(distmin)];
  end
%   result = sprintf('与第 %d 个说话人匹配', k1);
%     disp(msg);

