
class RscText;
class RscStructuredText;
class RscCheckBox;
class RscCombo;
class RscXSliderH;

class RscDisplayInsertMarker {
    onLoad = QUOTE(call DFUNC(initInsertMarker));
    onUnload = QUOTE(call DFUNC(placeMarker));
    movingEnable = 1;

    class controls {
        class TimeStampText: RscStructuredText {
            idc = IDC_ACE_INSERT_MARKER_TIMESTAMP_TEXT;
        };
        class TimeStamp: RscCheckBox {
            idc = IDC_ACE_INSERT_MARKER_TIMESTAMP;
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
        class MarkerScale: RscXSliderH {
            idc = IDC_ACE_INSERT_MARKER_SCALE;
        };
        class MarkerScaleText: RscText {
            idc = IDC_ACE_INSERT_MARKER_SCALE_TEXT;
        };
    };
};
