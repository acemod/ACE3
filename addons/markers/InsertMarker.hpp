
class RscPicture;
class RscText;
class RscStructuredText;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscButtonMenu;
class RscCheckBox;
class RscEdit;
class RscCombo;
class RscSlider;
class RscXSliderH;

class RscDisplayInsertMarker {
    onLoad = QUOTE(_this call DFUNC(initInsertMarker););
    onUnload = QUOTE(_this call DFUNC(placeMarker););
    movingEnable = 1;

    class controls {
        class TimeStamp: RscCheckBox {
            idc = IDC_ACE_INSERT_MARKER_TIMESTAMP;
            tooltip = CSTRING(TimestampTooltip);
        };
        class MarkerShape: RscCombo {
            idc = IDC_ACE_INSERT_MARKER_SHAPE;
        };
        class MarkerColor: RscCombo {
            idc = IDC_ACE_INSERT_MARKER_COLOR;
        };
        class MarkerAngle: RscXSliderH {
            idc = IDC_ACE_INSERT_MARKER_ANGLE;
        };
        class MarkerAngleText: RscText {
            idc = IDC_ACE_INSERT_MARKER_ANGLE_TEXT;
        };
    };
};
