#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

#ifndef CSE_KESTREL_DEFINES_H_
#define CSE_KESTREL_DEFINES_H_

class Kestrel4500_RscText
{
	idc=-1;
	type=0;
	style=ST_CENTER;
	colorDisabled[]={0,0,0,0};
	colorBackground[]={0,0,0,0};
	colorText[]={0,0,0,1};
	text="";
	x=0;
	y=0;
	w=0.1;
	h=0.03;
	font="TahomaB";
	sizeEx=0.04;
	shadow=0;
};
class Kestrel4500_RscButton
{
	text="";
	colorText[]={0,0,0,1};
	colorDisabled[]={0,0,0,0};
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
	w=0.10;
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

#endif