#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

class ACE_Yardage450_RscText {
    type = 0;
    idc = -1;
    style = ST_CENTER;
    font = "EtelkaMonospacePro";
    sizeEx = "0.027 * SafeZoneH";
    colorText[] = {0, 0, 0, 1};
    colorBackground[] = {0, 0, 0, 0};
};

class RscTitles {
    class ACE_RscYardage450 {
        idd = -1;
        movingEnable = 0;
        duration = 100000;
        fadein = 0;
        fadeout = 0;
        name = "ACE_RscYardage450";
        onLoad = "with uiNameSpace do { ACE_RscYardage450 = _this select 0; };";
        onUnload = "with uiNameSpace do { ACE_RscYardage450 = displayNull; };";

        class Controls {
            class ACE_Yardage450_RscTarget : ACE_Yardage450_RscText {
                idc = 720041;
                style = ST_CENTER;
                x = "0.5 - (0.18 * SafeZoneH)";
                y = "0.5 - (0.25 * SafeZoneH)";
                w = "0.4 * SafeZoneH";
                h = "0.05 * SafeZoneH";
                sizeEx = "0.05 * SafeZoneH";
                text = "TARGET ACQUIRED";
            };
            class ACE_Yardage450_RscLaser : ACE_Yardage450_RscTarget {
                idc = 720042;
                x = "0.5 - (0.14 * SafeZoneH)";
                y = "0.5 - (0.18 * SafeZoneH)";
                w = "0.045 * SafeZoneH";
                h = "0.02 * SafeZoneH";
                sizeEx = "0.02 * SafeZoneH";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 1};
                text = "LASER";
            };
            class ACE_Yardage450_RscRange : ACE_Yardage450_RscTarget {
                idc = 720043;
                style = ST_RIGHT;
                x = "0.5 - (0.02 * SafeZoneH)";
                y = "0.5 + (0.18 * SafeZoneH)";
                w = "0.08 * SafeZoneH";
                h = "0.06 * SafeZoneH";
                sizeEx = "0.06 * SafeZoneH";
                text = "---";
            };
            class ACE_Yardage450_RscMeters : ACE_Yardage450_RscLaser {
                idc = 720044;
                x = "0.5 + (0.06 * SafeZoneH)";
                y = "0.5 + (0.19 * SafeZoneH)";
                w = "0.05 * SafeZoneH";
                h = "0.018 * SafeZoneH";
                sizeEx = "0.018 * SafeZoneH";
                text = "METERS";
            };
            class ACE_Yardage450_RscYards : ACE_Yardage450_RscMeters {
                idc = 720045;
                y = "0.5 + (0.21 * SafeZoneH)";
                w = "0.0417 * SafeZoneH";
                text = "YARDS";
            };
        };
    };
};
