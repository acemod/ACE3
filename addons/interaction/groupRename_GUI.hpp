#define FONT_H (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)
#define FONT_W (FONT_H / pixelH * pixelW)
#define GAP_W (pixelW * 2)
#define GAP_H (pixelH * 2)
#define ELEMENT_HEIGHT FONT_H + FONT_W
#define TOTAL_W FONT_W * 25
#define TOTAL_H FONT_H * 3 + GAP_H

class ctrlStatic;
class ctrlButton;
class ctrlEdit;
class ctrlStaticTitle;

class GVAR(groupNameDisplay) {
    idd = -1;
    enableSimulation = 1;
    
    class ControlsBackground {
        class Title: ctrlStaticTitle {
            x = QUOTE(safeZoneX + (safeZoneW / 2) - TOTAL_W/2);
            y = QUOTE(safeZoneY + (safeZoneH / 2) - (FONT_H * 1.2) - GAP_H);
            w = QUOTE(TOTAL_W);
            h = QUOTE(FONT_H * 1.2);
            sizeEx = QUOTE(FONT_H * 1.2);
            text = CSTRING(renameGroupInput);
        };
        class Background: ctrlStatic {
            colorBackground[] = {0, 0, 0, 0.8};
            x = QUOTE(safeZoneX + (safeZoneW / 2) - TOTAL_W/2);
            y = QUOTE(safeZoneY + (safeZoneH / 2));
            w = QUOTE(TOTAL_W);
            h = QUOTE(ELEMENT_HEIGHT);
        };
    };

    class controls {
        class Input: ctrlEdit {
            idc = 451;
            x = QUOTE(safeZoneX + (safeZoneW / 2) - TOTAL_W/2 + FONT_W/2);
            y = QUOTE(safeZoneY + (safeZoneH / 2) + FONT_W/2);
            w = QUOTE(TOTAL_W - FONT_W);
            h = QUOTE(ELEMENT_HEIGHT - FONT_W);
            sizeEx = QUOTE(FONT_H);
        };

        class OkButton: ctrlButton {
            idc = 1;
            x = QUOTE(safeZoneX + (safeZoneW / 2) + TOTAL_W/2 - FONT_W * 15);
            y = QUOTE(safeZoneY + (safeZoneH / 2) + ELEMENT_HEIGHT + GAP_H);
            w = QUOTE(FONT_W * 15);
            h = QUOTE(ELEMENT_HEIGHT - FONT_W);
            sizeEx = QUOTE(FONT_H);
            text = CSTRING(RenameGroup);
        };

        class CancelButton: ctrlButton {
            idc = 2;
            x = QUOTE(safeZoneX + (safeZoneW / 2) - TOTAL_W/2);
            y = QUOTE(safeZoneY + (safeZoneH / 2) + ELEMENT_HEIGHT + GAP_H);
            w = QUOTE(FONT_W * 6);
            h = QUOTE(ELEMENT_HEIGHT - FONT_W);
            sizeEx = QUOTE(FONT_H);
            text = CSTRING(CancelSelection);
        };
    };
};
