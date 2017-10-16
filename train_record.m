% function y=record()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: train_record() 录音并进行训练，供gui调用，并返回结果给gui
% author:   yuhansgg（Shi Gaige）
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rbd=get(con_rbd,'value')
if (rbd)
    delete('train/*.wav');
    n=1;%从头开始
end
fs=16000;           %取样频率

% fprintf('Press any key to start %g seconds of recording...\n',duration);
% 
% pause;

fprintf('training...\n');
y=audiorecorder(fs,16,1);         % 16bit 单通道
recordblocking(y,3); %录制3秒

% fprintf('Finished training.\n');
% str=num2str(file,n);
y1 = getaudiodata(y,'int16');
name=strcat('train\',...
            num2str(n),'.wav'); % n为全局变量,组合成字符串
audiowrite(name,y1,fs);
% fprintf('Press any key to play the recording...\n');
% 
% pause;
[code, dkmax, dkmin]=train('train\',n);

set(con_text,'string',['第' num2str(n) '次' ]);
% audioplayer(y,fs);
n=n+1;  %指向下一次训练

