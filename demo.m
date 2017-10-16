% �������������е�ͼ�β�֤�������                 ��˸������Ӧword�еİ˸����⣻
clear;clc;close all
[s1 fs1] = audioread('train_long\1.wav'); %wavread�����ǰ�һ��ָ����wave�ļ�������Ȼ�󸳸�s1����������fs1;
[s2 fs2] = audioread('train\6.wav'); 

set(0,'defaultfigurecolor','w');
%Question 1�� Q1�����ã���¼�����������ת���ɲ��Σ�     
disp('> Question 1��ʱ����');          %disp����������ʾ����ַ�����
t = 0:1/fs1:(length(s1) - 1)/fs1;%¼�������ʱ���ᶼ����fs�Ի�ԭʱ���ڵ���ʵʱ��
figure(1),plot(t, s1), axis([0, (length(s1) - 1)/fs1 -1.0 1.0]);
title('Plot of signal 1.wav');
xlabel('Time [s]');
ylabel('Amplitude (normalized)')
pause
%close all 

%Question 2 (linear)%��ɵĹ����Ǽӿ�
disp('> Question 2��������');
M = 160;
N = 320;
frames = blockFrames(s1, fs1, M, N);       %����blockFrames�������Ӵ�
t = N / 2;
tm = length(s1) / fs1;     %�����ڶ���ͼ��
figure(2),subplot(1,2,1);    %figure��������������ԭ���ڲ��رյĻ����ϲ����µ�ͼ�δ��ڣ�subplot��������������ͬһ��ͼ�δ����в���M*N��ͼ����ʹ���еĵ�K��ͼ��Ϊ��ǰͼ��
imagesc([0 tm], [0 fs1/2], abs(frames(1:t, :)).^2), axis xy;     %imagesc������ͼ��
title('Power Spectrum (M = 160, N = 320)');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar;

%Question 3 (logarithmic)                     %���������׻�����
disp('> Question 3: ����������');
figure(2),subplot(1,2,2);
imagesc([0 tm], [0 fs1/2], 20 * log10(abs(frames(1:t, :)).^2)), axis xy;   %imagesc(x,y,C)������XΪ������ķ�Χ��YΪ������ķ�Χ��c������ͼ�ε�������������ɫ����ǳ��
title('Logarithmic Power Spectrum (M = 160, N = 320)');
xlabel('Time [s]');   
ylabel('Frequency [Hz]');
colorbar     %�Բ�ͬ��ɫ��������ĸ߶ȣ���ʾһ��ˮƽ��ֱ����ɫ���;
%����������ʲô��Ŀ����ʲô
D=get(gcf,'Position');   %��ȡ�������ָ��λ�õ�����ֵ��gcf��ȡ��ǰͼ�δ��ھ����
set(gcf,'Position',round([D(1)*.5 D(2)*.5 D(3)*2 D(4)*1.3]))   %���þ������ָ��λ�õ�����ֵ��
pause
%close all

%Question 4    %��ɵĹ�����MELƵ������
disp('> Question 4: Plots for different values for N');
lN = [160 320 480];
u=220;    %u��ʲô
for i = 1:length(lN)
    N = lN(i);
    M = round(N / 2);
    frames = blockFrames(s1, fs1, M, N);
    t = N / 2;
    temp = size(frames);
    nbframes = temp(2);
    u=u+1;
    subplot(u)
    imagesc([0 tm], [0 fs1/2], 20 * log10(abs(frames(1:t, :)).^2)), axis xy;    %imagesc�����������������ף�
%Mini-Project: An automatic speaker recognition system
%Christian Cornaz, Urs Hunkeler 03.02.2003
    title(sprintf('Power Spectrum (M = %i, N = %i, frames = %i)', M, N, nbframes));
    xlabel('Time [s]');
    ylabel('Frequency [Hz]');
    colorbar
end
D=get(gcf,'Position');
set(gcf,'Position',round([D(1)*.5 D(2)*.5 D(3)*1.5 D(4)*1.5]))
pause
close all
   
%Question 5  ����mel�ռ��˲����飬Ϊʲô������������������������������������������������
disp('> Question 5: Mel Space');
plot(linspace(0, (fs1/2), 129), (melfb(20, 256, fs1))');
title('Mel-Spaced Filterbank');
xlabel('Frequency [Hz]');
pause
close all

%Question 6    %mel���ף�������melƵ�ʱ任ǰ�������ļ���Ƶ��
disp('> Question 6: Modified spectrum');
M = 100;
N = 256;
frames = blockFrames(s1, fs1, M, N);    %�ٴε����������
n2 = 1 + floor(N / 2);
m = melfb(20, N, fs1);
z = m * abs(frames(1:n2, :)).^2;
t = N / 2;
tm = length(s1) / fs1;
subplot(121)
imagesc([0 tm], [0 fs1/2], abs(frames(1:n2, :)).^2), axis xy;
title('Power Spectrum unmodified');
xlabel('Time [s]');
ylabel('Frequency [Hz]');
colorbar;
subplot(122)
imagesc([0 tm], [0 20], z), axis xy;
title('Power Spectrum modified through Mel Cepstrum filter');
xlabel('Time [s]');
ylabel('Number of Filter in Filter Bank');
colorbar;
D=get(gcf,'Position');
set(gcf,'Position',[0 D(2) D(3)*2 D(4)])
pause
close all

%Question 7  ����Ӧ�����ǿ�ʼ��vqlbg���򣻲���2άƽ���л������ݵ�
disp('> Question 7: 2D plot of accoustic vectors');
c1 = mfcc(s1, fs1);     %����mfcc������
c2 = mfcc(s2, fs2);
plot(c1(5, :), c1(6, :), 'or');%ԲȦ��ǣ���ɫ��
hold on;
plot(c2(5, :), c2(6, :), 'xb');  %��ű�ǣ���ɫ��
xlabel('5th Dimension');
ylabel('6th Dimension');
legend('Signal 1', 'Signal 2');%legend��������������ָ��λ�ý���ͼ����Signal 1,Signal 2��ͼ���е�����ע��
title('2D plot of accoustic vectors');
pause
close all

%Question 8
disp('> Question 8: Plot of the 2D trained VQ codewords')  %���ƶ�ά��ѵ��ʸ�����֣��������ɵ�VQ����
d1 = vqlbg(c1,16);
d2 = vqlbg(c2,16);
% plot(c1(5, :), c1(6, :), 'xr')
hold on
% plot(d1(5, :), d1(6, :), 'vk')
 plot(d1(5, :), d1(6, :), 'or')
% plot(c2(5, :), c2(6, :), 'xb')
% plot(d2(5, :), d2(6, :), '+k')
plot(d2(5, :), d2(6, :), 'xb')
xlabel('5th Dimension');
ylabel('6th Dimension');
% legend('Speaker 1', 'Codebook 1', 'Speaker 2', 'Codebook 2');
legend('Codebook 1',  'Codebook 2');
title('2D plot of accoustic vectors');
pause
close all