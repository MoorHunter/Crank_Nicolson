function createfigure(cdata1)
%CREATEFIGURE(CDATA1)
%  CDATA1:  image cdata
 
%  �� MATLAB �� 05-Nov-2017 19:56:32 �Զ�����
 
% ���� figure
figure1 = figure;
 
% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
 
% ���� image
image(u05,'Parent',axes1,'CDataMapping','scaled');
 
% ���� title
title({'��ȷ��'});
 
% ȡ�������е�ע���Ա���������� X ��Χ
% xlim(axes1,[0.5 161.5]);
% ȡ�������е�ע���Ա���������� Y ��Χ
% ylim(axes1,[0.5 161.5]);
view(axes1,[4.52970994047064e-14 -90]);
box(axes1,'on');
axis(axes1,'ij');
% ������������������
set(axes1,'Layer','top','XTick',[0 20 40 60 80 100 120 140 160],...
'XTickLabel',{'0','0.125','0.25','0.375','0.5','0.625','0.75','0.875','1'},...
'YTick',[0 20 40 60 80 100 120 140 160],'YTickLabel',...
{'0','0.125','0.25','0.375','0.5','0.625','0.75','0.8175','1'});
