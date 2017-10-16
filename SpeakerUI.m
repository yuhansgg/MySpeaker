clear;clc;close all;
global n;%记录的第几个话说人
n=1;

%归一化图形界面
con_car=figure('position',[400 200 680 380],...
                'numbertitle','off',...
                'name','voic controll airless car');
set(con_car,'defaultuicontrolunits','normalized');

rbd=0;
con_rbd=uicontrol('Style','radiobutton',...
              'Position',[0.05  0.62  0.15  0.05],...
              'Value',rbd,...   rbd的值为0或1，选中为1，未选中为0
              'String','重新训练(3次)','backgroundcolor',get(gcf,'color'));

% 关闭按钮
con_close=uicontrol('style','pushbutton','position',[0.8 0.6 0.1 0.1],...
        'string','关闭','callback','close');
    
% 训练按钮 
con_train=uicontrol('style','pushbutton','position',[0.2 0.6 0.1 0.1],...
       'string','训练');

% 测试按钮
con_test=uicontrol('style','pushbutton','position',[0.5 0.6 0.1 0.1],...
        'string','测试');                 % [left bottom width height]

% 显示字符串‘请说一个词语’和测试结果
con_text=uicontrol('style','text','position',[0.15 0.1 0.8 0.4],...
         'FontSize',30,'string','请说一个词语','backgroundcolor',get(gcf,'color'));

set(con_train,'callback','train_record');
set(con_test,'callback','test_record');


