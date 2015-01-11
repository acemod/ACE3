//acre_controls.hpp
#define RGB_GREEN 0, 0.5, 0, 1
#define RGB_BLUE 0, 0, 1, 1
#define RGB_ORANGE 0.5, 0.5, 0, 1
#define RGB_RED 1, 0, 0, 1
#define RGB_YELLOW 1, 1, 0, 1
#define RGB_WHITE 1, 1, 1, 1
#define RGB_GRAY 0.5, 0.5, 0.5, 1
#define RGB_BLACK 0, 0, 0, 1
#define RGB_MAROON 0.5, 0, 0, 1
#define RGB_OLIVE 0.5, 0.5, 0, 1
#define RGB_NAVY 0, 0, 0.5, 1
#define RGB_PURPLE 0.5, 0, 0.5, 1
#define RGB_FUCHSIA 1, 0, 1, 1
#define RGB_AQUA 0, 1, 1, 1
#define RGB_TEAL 0, 0.5, 0.5, 1
#define RGB_LIME 0, 1, 0, 1
#define RGB_SILVER 0.75, 0.75, 0.75, 1

class ace_arty_bcs_acre_controls:ace_arty_bcs_ControlGroup {
    idc = ACRE_CONTROLS;
	__SX(0.815);
	__SY(0.3);
	h = ROWPOS(10.1);
	w = COLPOS(5.1);
    class controls {
        class GVAR(CycleDialogBackgroundYellow) {
			idc = -1;
			type = CT_STATIC;  // defined constant
			style = ST_CENTER;  // defined constant
			colorText[] = { 0, 0, 0, 1 };
			colorBackground[] = { RGB_YELLOW };
			font = FontM;  // defined constant
			sizeEx = 0.023;
			x = 0;
			y = 0;
			h = ROWPOS(10.07);
			w = COLPOS(5.12);
			text = "";
		};
		class GVAR(CycleDialogBackgroundBlack) {
			idc = -1;
			type = CT_STATIC;  // defined constant
			style = ST_CENTER;  // defined constant
			colorText[] = { 0, 0, 0, 1 };
			colorBackground[] = { RGB_BLACK };
			font = FontM;  // defined constant
			sizeEx = 0.023;
			x = COLPOS(0.05);
			y = ROWPOS(0.05);
			h = ROWPOS(10);
			w = COLPOS(5);
			text = "";
		};
		class GVAR(acreControls):ace_arty_bcs_RscText {
            text = "ACRE CONTROLS";
			colorText[] = { RGB_YELLOW };
            x = COLPOS(0.05);
            y = ROWPOS(0.05);
        };
		class GVAR(acreRadio):ace_arty_bcs_RscText {
			idc = IDC_ACRE_RadioName;
            text = "";
			colorText[] = { RGB_YELLOW };
            x = COLPOS(0.05);
            y = ROWPOS(1.05);
        };
		class GVAR(acreRadioNet):ace_arty_bcs_RscText {
			idc = IDC_ACRE_RadioNet;
            text = "";
			colorText[] = { RGB_YELLOW };
            x = COLPOS(0.05);
            y = ROWPOS(2.05);
        };
		class GVAR(acreCycle):ace_arty_bcs_RscButton {
			text = "Cycle";
			x = COLPOS(0.05);
            y = ROWPOS(4.05);
			w = COLPOS(5);
			h = ROWPOS(2);
			colorText[] = { RGB_YELLOW };
			action = QUOTE([] call FUNC(cycleRadio));
		};
		class GVAR(acreOpen):ace_arty_bcs_RscButton {
			text = "Open";
			x = COLPOS(0.05);
            y = ROWPOS(7.05);
			w = COLPOS(5);
			h = ROWPOS(2);
			colorText[] = { RGB_YELLOW };
			action = QUOTE([] call FUNC(openRadio));
		};
    };
};