#include "functions\script_component.hpp"

class RscControlsGroupNoScrollbars;
class RscText;
class RscStructuredText;

class RscMapControlBFTTooltip : RscControlsGroupNoScrollbars {
	idc = IDC_TOOLTIP;
	x = safezoneW;
	y = safezoneH;
	w = TT_W;
	h = TT_TEXT_H * 6 + W_TO_H(TT_MARGIN);
	class controls {
		class tooltipGroup : RscControlsGroupNoScrollbars {
			idc = IDC_TOOLTIP_MAIN;
			x = 0;
			y = 0;
			w = TT_W;
			h = TT_TEXT_H * 6 + (0.75 * TT_MARGIN);
			class controls {
				class titleText : RscStructuredText {
					idc = IDC_TOOLTIP_TITLE_TEXT;
					x = 0;
					y = 0;
					w = TT_W;
					h = TT_TEXT_H;
					size = TT_TEXT_H;
					colorBackground[] = {COLOR_DARKGREY};
					style = 0;
					class attributes {
						align = "left";
					};
				};
				class subtitleText : RscStructuredText {
					idc = IDC_TOOLTIP_SUBTITLE_TEXT;
					x = 0;
					y = TT_TEXT_H;
					w = TT_W;
					h = TT_TEXT_H;
					size = TT_TEXT_H;
					colorBackground[] = {COLOR_BLACK};
					style = 0;
					class attributes {
						align = "left";
					};
				};
				class leftGroup : RscControlsGroupNoScrollbars {
					idc = IDC_TOOLTIP_LEFT_GRP;
					x = 0;
					y = 2 * TT_TEXT_H + W_TO_H(TT_MARGIN);
					w = ( TT_W - TT_MARGIN ) / 2;
					h = 4 * TT_TEXT_H;
					class controls {
						class leftBackground : RscText {
							idc = IDC_TOOLTIP_LEFT_BACK;
							x = 0;
							y = 0;
							w = ( TT_W - TT_MARGIN ) / 2;
							h = 4 * TT_TEXT_H;
							colorBackground[] = {COLOR_BLACK};
						};
						class leftText : RscStructuredText {
							idc = IDC_TOOLTIP_LEFT_TEXT;
							x = 0;
							y = 0;
							w = ( TT_W - TT_MARGIN ) / 2;
							h = 4 * TT_TEXT_H;
							size = TT_TEXT_H;
							style = 2;
							class attributes {
								align = "center";
							};
						};
						class leftHover : RscText {
							idc = IDC_TOOLTIP_LEFT_HOVER;
							x = 0;
							y = 0;
							w = ( TT_W - TT_MARGIN ) / 2;
							h = 4 * TT_TEXT_H;
							colorBackground[] = {COLOR_INVISIBLE};
						};
					};
				};
				class rightGroup : RscControlsGroupNoScrollbars {
					idc = IDC_TOOLTIP_RIGHT_GRP;
					x = ( TT_W - TT_MARGIN ) / 2 + TT_MARGIN;
					y = 2 * TT_TEXT_H + W_TO_H(TT_MARGIN);
					w = ( TT_W - TT_MARGIN ) / 2;
					h = 4 * TT_TEXT_H;
					class controls {
						class rightBackground : RscText {
							idc = IDC_TOOLTIP_RIGHT_BACK;
							x = 0;
							y = 0;
							w = ( TT_W - TT_MARGIN ) / 2;
							h = 4 * TT_TEXT_H;
							colorBackground[] = {COLOR_BLACK};
						};
						class rightText : RscStructuredText {
							idc = IDC_TOOLTIP_RIGHT_TEXT;
							x = 0;
							y = 0;
							w = ( TT_W - TT_MARGIN ) / 2;
							h = TT_TEXT_H;
							style = 2;
							sizeEx = TT_TEXT_H;
							class attributes {
								align = "center";
							};
						};
						class rightHover : RscText {
							idc = IDC_TOOLTIP_RIGHT_HOVER;
							x = 0;
							y = 0;
							w = ( TT_W - TT_MARGIN ) / 2;
							h = TT_BOX_H;
							colorBackground[] = {COLOR_INVISIBLE};
						};
					};
				};
			};
		};
	};
};

/*

#define		TT_X_BUTTON						0.080375
#define		TT_W_MARGIN						0.355
#define		TT_W_MARGIN_BUTTON				0.435375
#define		TT_H							0.241
#define		TT_H_ICON						0.286
#define		TT_TITLE_W_1					0
#define		TT_TITLE_W_2					0.35
#define		TT_BOX_X						0.1775
#define		TT_BOX_Y						0.085
#define		TT_BOX_H						0.156
#define 	TT_STRUCTUREDTEXT_H				0.032
#define		TT_NAME_Y						0.03
#define		TT_NAME_H 						0.096
#define		TT_PIC_H						0.201
#define 	TT_PIC_W						0.15075
#define		TT_BUTTON_Y						0.0294358
#define		TT_BUTTON_W						0.075375
#define		TT_BUTTON_W_MARGIN				0.080375
#define		TT_BUTTON_H						0.142128
#define 	TT_W_1_BUTTON					0.430375
#define		TT_W_2_BUTTON					0.51075

#define		TT_EDIT_W						0.3
#define		TT_EDIT_H						10
#define		TT_EDIT_BACK_H					0.12
#define		TT_EDIT_MARGIN					0.005
#define		TT_EDIT_CTRL_Y					0.08
#define		TT_EDIT_CTRL_W					0.29
#define		TT_EDIT_CTRL_X					0.2
#define		TT_EDIT_BUTTON_X				0.2
#define		TT_EDIT_BUTTON_Y				0.165
#define		TT_EDIT_BUTTON_W				0.1

class buttonEditGroup : RscControlsGroupNoScrollbars
{
	idc = X;
	x = TT_W_MARGIN;
	y = TT_TEXT_H;
	w = TT_BUTTON_W;
	h = TT_PIC_H;
	class controls
	{
		class menuPicture : RscPicture
		{
			idc = X;
			text = "\FatTrack\data\r_semicircle_ca.paa";
			x = 0;
			y = 0;
			w = TT_PIC_W;
			h = TT_PIC_H;
			colorText[] = CFG_ARR(COLOR_BLACK);
		};
		class menuText : RscText
		{
			idc = X;
			style = 2;
			text = $STR_FT_EDIT;
			sizeEx = TT_TEXT_H;
			x = 0;
			y = TT_BUTTON_Y;
			w = TT_BUTTON_W;
			h = TT_BUTTON_H;
			colorBackground[] = CFG_ARR(COLOR_INVISIBLE);
			onMouseEnter = #DOCTRLSETTEXTCOLOR(X,COLOR_DARKGREY);
			onMouseExit = #DOCTRLSETTEXTCOLOR(X,COLOR_BLACK);
			onMouseButtonDown = "[_this,'edit'] call FETT_fnc_ft_mbDown;";
			onMouseButtonUp = "_this call FETT_fnc_ft_mbUp;";
		};
	};
};
class buttonCancelGroup : RscControlsGroupNoScrollbars
{
	idc = X;
	x = -TT_BUTTON_W_MARGIN;
	y = TT_TEXT_H;
	w = TT_BUTTON_W;
	h = TT_PIC_H;
	class controls
	{
		class menuPicture : RscPicture
		{
			idc = X;
			text = "\FatTrack\data\l_semicircle_ca.paa";
			x = -TT_BUTTON_W;
			y = 0;
			w = TT_PIC_W;
			h = TT_PIC_H;
			colorText[] = CFG_ARR(COLOR_BLACK);
		};
		class menuText : RscText
		{
			idc = X;
			style = 2;
			text = $STR_FT_BACK;
			sizeEx = TT_TEXT_H;
			x = 0;
			y = TT_BUTTON_Y;
			w = TT_BUTTON_W;
			h = TT_BUTTON_H;
			colorBackground[] = {0,0,0,0};
			onMouseEnter = #DOCTRLSETTEXTCOLOR(X,COLOR_DARKGREY);
			onMouseExit = #DOCTRLSETTEXTCOLOR(X,COLOR_BLACK);
			onMouseButtonDown = "[_this,'cancel'] call FETT_fnc_ft_mbDown;";
			onMouseButtonUp = "_this call FETT_fnc_ft_mbUp;";
		};
	};
};

*/