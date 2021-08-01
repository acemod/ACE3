#define FONT_H (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)
#define FONT_W (FONT_H / pixelH * pixelW)
#define GAP_W (pixelW * 2)
#define GAP_H (pixelH * 2)
#define TOTAL_W FONT_W * 50
#define TOTAL_H FONT_H * 3 + GAP_H

class ctrlStatic;
class ctrlButton;
class ctrlEdit;

class GVAR(groupNameDisplay) 
{
	idd = -1;
	enableSimulation = 1;
	
	class ControlsBackground
	{
		class Background: ctrlStatic 
		{
			colorBackground[] = {0, 0, 0, 0.8};
			x = QUOTE(safeZoneX + (safeZoneW / 2) - TOTAL_W);
			y = QUOTE(safeZoneY + (safeZoneH / 2) - TOTAL_H);
			w = QUOTE(FONT_W * 50);
			h = QUOTE(FONT_H * 2 + GAP_H);
		};
	};

	class controls
	{
		class Input: ctrlEdit
		{
			x = QUOTE(safeZoneX + (safeZoneW / 2) - TOTAL_W + FONT_W / 2);
			y = QUOTE(safeZoneY + (safeZoneH / 2) - TOTAL_H + FONT_H / 2);
			w = QUOTE(FONT_W * 49);
			h = QUOTE(FONT_H);
			sizeEx = QUOTE(FONT_H);
		};

		class OkButton: ctrlButton
		{
			x = QUOTE(safeZoneX + (safeZoneW / 2) + TOTAL_W - FONT_W * 5);
			y = QUOTE(safeZoneY + (safeZoneH / 2) + TOTAL_H - FONT_H);
			w = QUOTE(FONT_W * 5);
			h = QUOTE(FONT_H);
			sizeEx = QUOTE(FONT_H);
		};
	};
};