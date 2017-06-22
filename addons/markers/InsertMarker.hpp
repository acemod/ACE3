
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
    movingEnable = 1;

    class controls {
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
    };
};
