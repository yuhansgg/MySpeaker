
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% function: test_record() ¼�������м�⣬��gui���ã������ؽ����gui
% author:   yuhansgg��Shi Gaige��
% time:     2017.4.9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs=16000;

fprintf('testing...\n');

delete('test/*.wav');  %ɾ���ɵĲ�����Ƶ
mm=1;%��ͷ��ʼ

y=audiorecorder(fs, 16, 1);
recordblocking(y,3);%¼��3��

name=strcat('test\',...
            num2str(mm),'.wav');
        
y1 = getaudiodata(y,'int16');
audiowrite(name,y1,fs);
cut(name);

result=test('test\',mm,code, dkmax, dkmin);
disp(result);

set(con_text,'string',result);
