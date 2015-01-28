class cse_ab_ATragMX_RscText
{
	idc=-1;
	type=0;
	style=256;
	colorDisabled[]={0,0,0,0.0};
	colorBackground[]={0,0,0,0};
	colorText[]={0,0,0,1};
	text="";
	x=0;
	y=0;
	h=0.037;
	w=0.30;
	font="TahomaB";
	SizeEx=0.03;
	shadow=0;
};
class cse_ab_ATragMX_RscButton
{
	text="";
	colorText[]={0,0,0,1};
	colorDisabled[]={0,0,0,0.0};
	colorBackground[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	colorBackgroundActive[]={0,0,0,0};
	colorFocused[]={0,0,0,0};
	colorShadow[]={0,0,0,0};
	colorBorder[]={0,0,0,1};
	soundEnter[]={"",0,1};
	soundPush[]={"",0,1};
	soundClick[]={"",0,1};
	soundEscape[]={"",0,1};
	type=1;
	style="0x02+0x100";
	x=0;
	y=0;
	w=0.03;
	h=0.03;
	font="TahomaB";
	SizeEx=0.025;
	offsetX=0.003;
	offsetY=0.003;
	offsetPressedX=0.0020;
	offsetPressedY=0.0020;
	borderSize=0;
	shadow=0;
};
class cse_ab_ATragMX_RscEdit
{
	access=0;
	type=2;
	style=ST_RIGHT;
	x=0;
	y=0;
	w=0.05;
	h=0.03;
	colorDisabled[]={0,0,0,0.0};
	colorBackground[]={0,0,0,0};
	colorText[]={0,0,0,1};
	colorSelection[]={0,0,0,0.25};
	font="TahomaB";
	sizeEx=0.025;
	text="";
	size=0.2;
	autocomplete="";
	shadow=0;
};
class cse_ab_ATragMX_RscToolbox
{
	type=6;
	style=ST_LEFT;
	x=0;
	y=0;
	w=0.2;
	h=0.03;
	colorDisabled[]={0,0,0,0.0};
	colorBackground[]={1,1,1,1};
	colorText[]={0,0,0,1};
	color[]={0,0,0,0};
	colorTextSelect[]={0.8,0.8,0.8,1};
	colorSelect[]={0,0,0,1};
	colorSelectedBg[]={0,0,0,1};
	colorTextDisable[]={0.4,0.4,0.4,1};
	colorDisable[]={0.4,0.4,0.4,1};			
	font="TahomaB";
	sizeEx=0.027;
	rows=1;
	columns=2;
	strings[]={"Entry 1","Entry 2"};
	values[]={1,0};
	onToolBoxSelChanged="";
};
class cse_ab_ATragMX_RscListBox
{
	idc=-1;
	type=5;
	style=0;
	font="TahomaB";
	sizeEx=0.028;
    rowHeight=0.03;
	colorDisabled[]={0,0,0,0.0};
	colorBackground[]={1,1,1,1};
	colorText[]={0,0,0,1};
	colorScrollbar[]={0.95,0.95,0.95,1};
	colorSelect[]={0,0,0,1};
	colorSelect2[]={0,0,0,1};
	colorSelectBackground[]={0.925,0.925,0.925,1};
	colorSelectBackground2[]={0.925,0.925,0.925,1};
	period=0;
	maxHistoryDelay=1.0;
	autoScrollSpeed=-1;
	autoScrollDelay=5;
	autoScrollRewind=0;
	soundSelect[]={"",0.09,1};
	
	class ScrollBar {
		color[]={1,1,1,0.6};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.3};
		thumb="\ca\ui\data\igui_scrollbar_thumb_ca.paa";
		arrowFull="\ca\ui\data\igui_arrow_top_active_ca.paa";
		arrowEmpty="\ca\ui\data\igui_arrow_top_ca.paa";
		border="\ca\ui\data\igui_border_scroll_ca.paa";
	};
	
	class ListScrollBar : ScrollBar {
	};
};
class cse_ab_ATragMX_RscListNBox: cse_ab_ATragMX_RscListBox
{
	idc=-1;
	type=102;
	columns[]={0.0, 0.225, 0.475, 0.725};
	drawSideArrows=0;
	idcLeft=-1;
	idcRight=-1;
};
class cse_ab_ATragMX_RscControlsGroup
{
	type=15;
	idc=-1;
	style=16;
	x=0;
	y=0;
	w=1;
	h=1;
	shadow=0;
	class VScrollbar
	{
		color[]={1,1,1,0.6};
		width=0.021;
		autoScrollSpeed=-1;
		autoScrollDelay=5;
		autoScrollRewind=0;
		shadow=0;
	};
	class HScrollbar
	{
		color[]={1,1,1,0.6};
		height=0.028;
		shadow=0;
	};
	class ScrollBar
	{
		color[]={1,1,1,0.6};
		colorActive[]={1,1,1,1};
		colorDisabled[]={1,1,1,0.3};
		thumb="#(argb,8,8,3)color(1,1,1,1)";
		arrowEmpty="#(argb,8,8,3)color(1,1,1,1)";
		arrowFull="#(argb,8,8,3)color(1,1,1,1)";
		border="#(argb,8,8,3)color(1,1,1,1)";
	};
	class Controls
	{
	};
};
class cse_ab_ATragMX_RscLineBreak
{
	idc=-1;
	type=98;
	shadow=0;
};