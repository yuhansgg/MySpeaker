% function y=record()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: train_record() ¼��������ѵ������gui���ã������ؽ����gui
% author:   yuhansgg��Shi Gaige��
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rbd=get(con_rbd,'value')
if (rbd)
    delete('train/*.wav');
    n=1;%��ͷ��ʼ
end
fs=16000;           %ȡ��Ƶ��

% fprintf('Press any key to start %g seconds of recording...\n',duration);
% 
% pause;

fprintf('training...\n');
y=audiorecorder(fs,16,1);         % 16bit ��ͨ��
recordblocking(y,3); %¼��3��

% fprintf('Finished training.\n');
% str=num2str(file,n);
y1 = getaudiodata(y,'int16');
name=strcat('train\',...
            num2str(n),'.wav'); % nΪȫ�ֱ���,��ϳ��ַ���
audiowrite(name,y1,fs);
% fprintf('Press any key to play the recording...\n');
% 
% pause;
[code, dkmax, dkmin]=train('train\',n);

set(con_text,'string',['��' num2str(n) '��' ]);
% audioplayer(y,fs);
n=n+1;  %ָ����һ��ѵ��

