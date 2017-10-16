function result=test(testdir, n, code, dkmax ,dkmin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: test() ����
% input :   testdir : ���������ļ���
%           n       : testdir�в����ļ����е�N��
%           code    : ����˵������ѵ���õ�����
% output:   ���Խ��
% author:   yuhansgg��Shi Gaige��
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ע��:
%       testdir�������ļ����ĸ�ʽ����: 
%               1.wav, 2.wav, ..., n.wav

    % ��ȡÿ��˵���˵������ļ�read test sound file of each speaker
    file = sprintf('%s%d.wav', testdir, n);   
    cut(file);
    
    [s, fs] = audioread(file);      
        
    v = mfcc(s,fs);            % ����MFCC
   
    distmin = inf;              %����
    k1 = 0;
   
  for i = 1:length(code)      % code����󳤶ȣ�����ÿ��ѵ�����飬����ʧ��each trained codebook, compute distortion�����䣬ʧ�棩
        d = disteu(v, code{i}); %���� 
                dist = sum(min(d,[],2)) / size(d,1) %size(d,1): �еĳ��ȼ�����
          % min(A,[],dim),dimȡ1��2��ȡ1ʱ����min(A)��ȫ��ͬ��ȡ2ʱ���ú�������һ�������������i��Ԫ����A����ĵ�i���ϵ���Сֵ     
        if dist < distmin
            distmin = dist;
           k1 = i;
        end      
  end
  
  if distmin < 4.2
      result = ['������ȷ ', num2str(distmin)];
  elseif distmin > 4.6
      result = ['������� ' , num2str(distmin)];
  else result =[ '�ٲ�һ�� ' , num2str(distmin)];
  end
%   result = sprintf('��� %d ��˵����ƥ��', k1);
%     disp(msg);

