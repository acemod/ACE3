class RscPicture;
class RscText;
class RscStructuredText;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenu;
class RscEdit;
class RscCombo;
class RscSlider;
class RscXSliderH;

class RscDisplayInsertMarker {
    onLoad = QUOTE(_this call DFUNC(initInsertMarker););
    onUnload = QUOTE(_this call DFUNC(placeMarker););
    // idd = 54;
    movingEnable = 1;
    class controlsBackground {
        // class RscText_1000: RscText {idc = 1000;};
    };
    class controls {
        // class ButtonMenuOK: RscButtonMenuOK {idc = 1;};
        // class ButtonMenuCancel: RscButtonMenuCancel {idc = 2;};
        // class Title: RscText {idc = 1001;};
        // class Description: RscStructuredText {idc = 1100;};
        // class DescriptionChannel: RscStructuredText {idc = 1101;};
        // class MarkerPicture: RscPicture {idc = 102;};
        // class MarkerText: RscEdit {idc = 101;};
        // class MarkerChannel: RscCombo {idc = 103;};

        class MarkerShape: RscCombo {
            idc = 1210;
        };
        class MarkerColor: RscCombo {
            idc = 1211;
        };
        class MarkerAngle: RscXSliderH {
            idc = 1220;
        };
        class MarkerAngleText: RscText {
            idc = 1221;
        };

        /*class SizeX: RscEdit {
            idc = 1200;
            text = "10";
            x = "14 *           (           ((safezoneW / safezoneH) min 1.2) / 40) +           (safezoneX)";
            y = "12.5 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +            (safezoneY + safezoneH -            (           ((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "5 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class SizeY: RscEdit {
            idc = 1201;
            text = "10";
            x = "19 *           (           ((safezoneW / safezoneH) min 1.2) / 40) +           (safezoneX)";
            y = "12.5 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +            (safezoneY + safezoneH -            (           ((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "5 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };*/
    };
};
