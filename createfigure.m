function createfigure(cdata1)
%CREATEFIGURE(CDATA1)
%  CDATA1:  image cdata
 
%  由 MATLAB 于 05-Nov-2017 19:56:32 自动生成
 
% 创建 figure
figure1 = figure;
 
% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
 
% 创建 image
image(u05,'Parent',axes1,'CDataMapping','scaled');
 
% 创建 title
title({'精确解'});
 
% 取消以下行的注释以保留坐标轴的 X 范围
% xlim(axes1,[0.5 161.5]);
% 取消以下行的注释以保留坐标轴的 Y 范围
% ylim(axes1,[0.5 161.5]);
view(axes1,[4.52970994047064e-14 -90]);
box(axes1,'on');
axis(axes1,'ij');
% 设置其余坐标轴属性
set(axes1,'Layer','top','XTick',[0 20 40 60 80 100 120 140 160],...
'XTickLabel',{'0','0.125','0.25','0.375','0.5','0.625','0.75','0.875','1'},...
'YTick',[0 20 40 60 80 100 120 140 160],'YTickLabel',...
{'0','0.125','0.25','0.375','0.5','0.625','0.75','0.8175','1'});
