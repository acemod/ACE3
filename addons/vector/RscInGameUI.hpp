class RscText;
class RscPicture;
class RscControlsGroupNoScrollbars;

class RscInGameUI {
    class RscWeaponZeroing;
    class CBA_ScriptedOptic: RscWeaponZeroing {
        class CA_Zeroing;
    };

    class ACE_RscOptics_vector: CBA_ScriptedOptic {
        controls[] = {
            "CA_FOVMode","ScopeBlack","Reticle","BodyNight","BodyDay","TrippleHeadLeft","TrippleHeadRight","CA_Zeroing","Magnification","ActiveDisplayHelper",
            "CA_Distance","CA_Heading","CA_OpticsPitch","CA_Elev","CA_OpticsZoom","CA_VisionMode","ACE_ScriptedDisplayControlsGroup"
        };

        class CA_Distance: RscText {
            idc = 151; // distance
            w = 0;
            h = 0;
        };
        class CA_Heading: RscText {
            idc = 156; // azimuth
            w = 0;
            h = 0;
        };
        class CA_OpticsPitch: RscText {
            idc = 182; // inclination
            w = 0;
            h = 0;
        };
        class CA_Elev: RscText {
            idc = 175; // inclination, more accurate
            w = 0;
            h = 0;
        };
        class CA_OpticsZoom: RscText {
            idc = 180; // some kind of zoom
            w = 0;
            h = 0;
        };
        class CA_VisionMode: RscText {
            idc = 179; // ???
            w = 0;
            h = 0;
        };
        class CA_Zeroing: CA_Zeroing {
            onLoad = "(_this select 0) ctrlShow false";
        };

        class ACE_ScriptedDisplayControlsGroup: RscControlsGroupNoScrollbars {
            onLoad = "uiNamespace setVariable ['ACE_dlgVector', ctrlParent (_this select 0)];";
            idc = 170;
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";

            class controls {
                class Center: RscPicture {
                    idc = IDC_CENTER;
                    colorText[] = {1,0,0,0.5};
                    x = "0.5 - (0.8 / 16 * safezoneW)/2 - safezoneX";
                    y = "0.5 - (0.8 / 9 * safezoneH)/2 - safezoneY";
                    w = "0.8 / 16 * safezoneW";
                    h = "0.8 / 9 * safezoneH";
                };
                class Crosshair: Center {
                    idc = IDC_CROSSHAIR;
                    x = "0.5 - (0.7 / 16 * safezoneW)/2 - safezoneX";
                    y = "0.5 - (0.7 / 9 * safezoneH)/2 - safezoneY";
                    w = "0.7 / 16 * safezoneW";
                    h = "0.7 / 9 * safezoneH";
                };

                class Digit0: Center {
                    idc = IDC_DIGIT_0;
                    x = "(0.54 + 0 * 0.02) * safezoneW";
                    y = "0.54 * safezoneH";
                    w = "0.5 / 16 * safezoneW";
                    h = "0.5 / 9 * safezoneH";
                };
                class Digit1: Digit0 {
                    idc = IDC_DIGIT_1;
                    x = "(0.54 + 1 * 0.02) * safezoneW";
                };
                class Digit2: Digit0 {
                    idc = IDC_DIGIT_2;
                    x = "(0.54 + 2 * 0.02) * safezoneW";
                };
                class Digit3: Digit0 {
                    idc = IDC_DIGIT_3;
                    x = "(0.54 + 3 * 0.02) * safezoneW";
                };
                class Digit4: Digit0 {
                    idc = IDC_DIGIT_4;
                    x = "(0.54 + 4 * 0.02) * safezoneW";
                };
                class Digit5: Digit0 {
                    idc = IDC_DIGIT_5;
                    x = "(0.35 + 0 * 0.02) * safezoneW";
                };
                class Digit6: Digit0 {
                    idc = IDC_DIGIT_6;
                    x = "(0.35 + 1 * 0.02) * safezoneW";
                };
                class Digit7: Digit0 {
                    idc = IDC_DIGIT_7;
                    x = "(0.35 + 2 * 0.02) * safezoneW";
                };
                class Digit8: Digit0 {
                    idc = IDC_DIGIT_8;
                    x = "(0.35 + 3 * 0.02) * safezoneW";
                };
                class Digit9: Digit0 {
                    idc = IDC_DIGIT_9;
                    x = "(0.35 + 4 * 0.02) * safezoneW";
                };

                class DigitE1: Digit0 {
                    idc = IDC_DIGIT_E1;
                    x = "(0.39 + 0 * 0.02) * safezoneW";
                    y = "0.42 * safezoneH";
                };
                class DigitE2: DigitE1 {
                    idc = IDC_DIGIT_E2;
                    x = "(0.39 + 1 * 0.02) * safezoneW";
                };
                class DigitE3: DigitE1 {
                    idc = IDC_DIGIT_E3;
                    x = "(0.39 + 2 * 0.02) * safezoneW";
                };
                class DigitE4: DigitE1 {
                    idc = IDC_DIGIT_E4;
                    x = "(0.39 + 3 * 0.02) * safezoneW";
                };
            };
        };
    };
};
