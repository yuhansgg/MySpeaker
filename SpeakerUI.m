clear;clc;close all;
global n;%��¼�ĵڼ�����˵��
n=1;

%��һ��ͼ�ν���
con_car=figure('position',[400 200 680 380],...
                'numbertitle','off',...
                'name','voic controll airless car');
set(con_car,'defaultuicontrolunits','normalized');

rbd=0;
con_rbd=uicontrol('Style','radiobutton',...
              'Position',[0.05  0.62  0.15  0.05],...
              'Value',rbd,...   rbd��ֵΪ0��1��ѡ��Ϊ1��δѡ��Ϊ0
              'String','����ѵ��(3��)','backgroundcolor',get(gcf,'color'));

% �رհ�ť
con_close=uicontrol('style','pushbutton','position',[0.8 0.6 0.1 0.1],...
        'string','�ر�','callback','close');
    
% ѵ����ť 
con_train=uicontrol('style','pushbutton','position',[0.2 0.6 0.1 0.1],...
       'string','ѵ��');

% ���԰�ť
con_test=uicontrol('style','pushbutton','position',[0.5 0.6 0.1 0.1],...
        'string','����');                 % [left bottom width height]

% ��ʾ�ַ�������˵һ������Ͳ��Խ��
con_text=uicontrol('style','text','position',[0.15 0.1 0.8 0.4],...
         'FontSize',30,'string','��˵һ������','backgroundcolor',get(gcf,'color'));

set(con_train,'callback','train_record');
set(con_test,'callback','test_record');


