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
       
                // Distance 1
                // Header
                class DigitD1Header1: Center {
                    idc = IDC_DIGIT_D1_HEADER1;
                    x = "(0.58 + 1 * 0.01 + 0.033) * safezoneW";
                    y = "0.09 * safezoneH";
                    w = "0.5 / 16 / 2 * safezoneW";
                    h = "0.5 / 9 / 2 * safezoneH";
                };
                class DigitD1Header2: DigitD1Header1 {
                    idc = IDC_DIGIT_D1_HEADER2;
                    x = "(0.58 + 2 * 0.01 + 0.035) * safezoneW";
                };
                class DigitD1Header3: DigitD1Header1 {
                    idc = IDC_DIGIT_D1_HEADER3;
                    x = "(0.58 + 3 * 0.01 + 0.037) * safezoneW";
                };
                // Number
                class Digit0: Center {
                    idc = IDC_DIGIT_0;
                    x = "(0.58 + 0 * 0.01 + 0.03) * safezoneW";
                    y = "0.13 * safezoneH";
                    w = "0.5 / 16 / 2 * safezoneW";
                    h = "0.5 / 9 / 2 * safezoneH";
                };   
                class Digit1: Digit0 {
                    idc = IDC_DIGIT_1;
                    x = "(0.58 + 1 * 0.01 + 0.03) * safezoneW";
                };
                class Digit2: Digit0 {
                    idc = IDC_DIGIT_2;
                    x = "(0.58 + 2 * 0.01 + 0.03) * safezoneW";
                };
                class Digit3: Digit0 {
                    idc = IDC_DIGIT_3;
                    x = "(0.58 + 3 * 0.01 + 0.03) * safezoneW";
                };
                class Digit4: Digit0 {
                    idc = IDC_DIGIT_4;
                    x = "(0.58 + 4 * 0.01 + 0.03) * safezoneW";
                };

                // Distance 2
                // Header
                class DigitD2Header1: Digit0 {
                    idc = IDC_DIGIT_D2_HEADER1;
                    x = "(0.58 + 1 * 0.01 + 0.073) * safezoneW";
                    y = "0.2 * safezoneH";
                };
                class DigitD2Header2: DigitD2Header1 {
                    idc = IDC_DIGIT_D2_HEADER2;
                    x = "(0.58 + 2 * 0.01 + 0.075) * safezoneW";
                };
                class DigitD2Header3: DigitD2Header1 {
                    idc = IDC_DIGIT_D2_HEADER3;
                    x = "(0.58 + 3 * 0.01 + 0.077) * safezoneW";
                };
                // Number
                class Digit10: Digit0 {
                    idc = IDC_DIGIT_D2_0;
                    x = "(0.58 + 0 * 0.01 + 0.07) * safezoneW";
                    y = "0.24 * safezoneH";
                };
                class Digit11: Digit10 {
                    idc = IDC_DIGIT_D2_1;
                    x = "(0.58 + 1 * 0.01 + 0.07) * safezoneW";
                };
                class Digit12: Digit10 {
                    idc = IDC_DIGIT_D2_2;
                    x = "(0.58 + 2 * 0.01 + 0.07) * safezoneW";
                };
                class Digit13: Digit10 {
                    idc = IDC_DIGIT_D2_3;
                    x = "(0.58 + 3 * 0.01 + 0.07) * safezoneW";
                };
                class Digit14: Digit10 {
                    idc = IDC_DIGIT_D2_4;
                    x = "(0.58 + 4 * 0.01 + 0.07) * safezoneW";
                };

                // Strobe
                // Header
                class DigitSTRHeader1: Center {
                    idc = IDC_DIGIT_STR_HEADER;
                    x = "0.67 * safezoneW";
                    y = "0.27 * safezoneH";
                    w = "0.5 / 16 * 2 * safezoneW";
                    h = "0.5 / 9 * 2 * safezoneH";
                };
                // Number
                class DigitSTR1: Digit0 {
                    idc = IDC_DIGIT_STR1;
                    x = "(0.58 + 0.108) * safezoneW";
                    y = "0.35 * safezoneH";
                };
                class DigitSTR2: DigitSTR1 {
                    idc = IDC_DIGIT_STR2;
                    x = "(0.58 + 0.118) * safezoneW";
                };

                // Azimuth
                // Header
                class DigitAZHeader1: Digit0 {
                    idc = IDC_DIGIT_AZ_HEADER1;
                    x = "(0.58 + 0 * 0.01 + 0.113) * safezoneW";
                    y = "0.5 * safezoneH";
                };
                class DigitAZHeader2: DigitAZHeader1 {
                    idc = IDC_DIGIT_AZ_HEADER2;
                    x = "(0.58 + 1 * 0.01 + 0.115) * safezoneW";
                };
                class DigitAZHeader3: DigitAZHeader1 {
                    idc = IDC_DIGIT_AZ_HEADER3;
                    x = "(0.58 + 2 * 0.01 + 0.118) * safezoneW";
                };
                // Number
                class Digit5: Digit0 {
                    idc = IDC_DIGIT_5;
                    x = "(0.58 + 0 * 0.01 + 0.11) * safezoneW";
                    y = "0.54 * safezoneH";
                };
                class Digit6: Digit5 {
                    idc = IDC_DIGIT_6;
                    x = "(0.58 + 1 * 0.01 + 0.11) * safezoneW";
                };
                class Digit7: Digit5 {
                    idc = IDC_DIGIT_7;
                    x = "(0.58 + 2 * 0.01 + 0.11) * safezoneW";
                };
                class Digit8: Digit5 {
                    idc = IDC_DIGIT_8;
                    x = "(0.58 + 3 * 0.01 + 0.11) * safezoneW";
                };
                class Digit9: Digit5 {
                    idc = IDC_DIGIT_9;
                    x = "(0.58 + 4 * 0.01 + 0.11) * safezoneW";
                };

                // Target Elevation Angle
                // Header
                class DigitTGAHeader1: Digit0 {
                    idc = IDC_DIGIT_TGA_HEADER1;
                    x = "(0.58 + 0 * 0.01 + 0.108) * safezoneW";
                    y = "0.61 * safezoneH";
                };
                class DigitTGAHeader2: DigitTGAHeader1 {
                    idc = IDC_DIGIT_TGA_HEADER2;
                    x = "(0.58 + 1 * 0.01 + 0.112) * safezoneW";
                };
                // Number
                class DigitTGA1: Digit0 {
                    idc = IDC_DIGIT_TGA1;
                    x = "(0.58 + 0 * 0.01 + 0.097) * safezoneW";
                    y = "0.65 * safezoneH";
                };
                class DigitTGA2: DigitTGA1 {
                    idc = IDC_DIGIT_TGA2;
                    x = "(0.58 + 1 * 0.01 + 0.097) * safezoneW";
                };
                class DigitTGA3: DigitTGA1 {
                    idc = IDC_DIGIT_TGA3;
                    x = "(0.58 + 2 * 0.01 + 0.097) * safezoneW";
                };
                class DigitTGA4: DigitTGA1 {
                    idc = IDC_DIGIT_TGA4;
                    x = "(0.58 + 3 * 0.01 + 0.097) * safezoneW";
                };

                // Game time digits
                class DigitTime: Digit0 {
                    y = "0.93 * safezoneH";
                    w = "0.56 / 48 * safezoneW";
                    h = "0.56 / 27 * safezoneH";
                };
                class DigitTH1: DigitTime {
                    idc = IDC_DIGIT_TH1;
                    x = "(0.58 + 0 * 0.008) * safezoneW";
                };
                class DigitTH2: DigitTime {
                    idc = IDC_DIGIT_TH2;
                    x = "(0.58 + 1 * 0.008) * safezoneW";
                };
                class DigitTD1: DigitTime {
                    idc = IDC_DIGIT_TD1;
                    x = "(0.58 + 1 * 0.008 + 0.004) * safezoneW";
                };
                class DigitTM1: DigitTime {
                    idc = IDC_DIGIT_TM1;
                    x = "(0.58 + 2 * 0.008) * safezoneW";
                };
                class DigitTM2: DigitTime {
                    idc = IDC_DIGIT_TM2;
                    x = "(0.58 + 3 * 0.008) * safezoneW";
                };
                class DigitTD2: DigitTime {
                    idc = IDC_DIGIT_TD2;
                    x = "(0.58 + 3 * 0.008 + 0.004) * safezoneW";
                };
                class DigitTS1: DigitTime {
                    idc = IDC_DIGIT_TS1;
                    x = "(0.58 + 4 * 0.008) * safezoneW";
                };
                class DigitTS2: DigitTime {
                    idc = IDC_DIGIT_TS2;
                    x = "(0.58 + 5 * 0.008) * safezoneW";
                };

                class DigitE1: Digit0 {
                    idc = IDC_DIGIT_E1;
                    x = "(0.39 + 0 * 0.01) * safezoneW";
                    y = "0.42 * safezoneH";
                };
                class DigitE2: DigitE1 {
                    idc = IDC_DIGIT_E2;
                    x = "(0.39 + 1 * 0.01) * safezoneW";
                };
                class DigitE3: DigitE1 {
                    idc = IDC_DIGIT_E3;
                    x = "(0.39 + 2 * 0.01) * safezoneW";
                };
                class DigitE4: DigitE1 {
                    idc = IDC_DIGIT_E4;
                    x = "(0.39 + 3 * 0.01) * safezoneW";
                };
            };
        };
    };
};
