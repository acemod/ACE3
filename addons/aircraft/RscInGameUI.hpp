class RscControlsGroup;
class RscText;
class RangeText: RscText{};
class RscPicture;
class RscOpticsText;
class RscIGProgress;
class RscOpticsValue;
class VScrollbar;
class HScrollbar;
class RscLadderPicture;
class RscControlsGroupNoScrollbars;

class RscInGameUI {
    class RscUnitInfo;
    class Rsc_ACE_Helo_UI_Turret: RscUnitInfo {
        idd = 300;
        controls[] = {"CA_IGUI_elements_group", "CA_VehicleToggles"};

        class VScrollbar;
        class HScrollbar;
        class CA_IGUI_elements_group: RscControlsGroup {
            idc = 170;

            class VScrollbar: VScrollbar {
                width = 0;
            };

            class HScrollbar: HScrollbar {
                height = 0;
            };

            x = "0 * (0.01875 * SafezoneH) + (SafezoneX + ((SafezoneW - SafezoneH) / 2))";
            y = "0 * (0.025 * SafezoneH) + (SafezoneY)";
            w = "53.5 * (0.01875 * SafezoneH)";
            h = "40 * (0.025 * SafezoneH)";

            class controls {
                class CA_Distance: RscText {
                    idc = 151;
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    x = "24.78 * (0.01875 * SafezoneH)";
                    y = "30.88 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class CA_Speed: RangeText {
                    idc = 188;
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "120";
                    x = "14.78 * (0.01875 * SafezoneH)";
                    y = "30.88 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class CA_Alt: RangeText {
                    idc = 189;
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "3825";
                    x = "34.78 * (0.01875 * SafezoneH)";
                    y = "30.88 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class CA_VisionMode: RscText {
                    idc = 152;
                    style = 0;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "VIS";
                    x = "12.58 * (0.01875 * SafezoneH)";
                    y = "8 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class CA_FlirMode: RscText {
                    idc = 153;
                    style = 0;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "BHOT";
                    x = "15.78 * (0.01875 * SafezoneH)";
                    y = "8 * (0.025 * SafezoneH)";
                    w = "4.5 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class ValueGrid: RangeText {
                    idc = 172;
                    font = "EtelkaMonospacePro";
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    x = "12.20 * (0.01875 * SafezoneH)";
                    y = "3.5 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class TextTADS: RangeText {
                    idc = 1010;
                    text = "TADS";
                    font = "EtelkaMonospacePro";
                    style = 2;
                    shadow = 0;
                    x = "12.30 * (0.01875 * SafezoneH)";
                    y = "5 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class ValueTime: RangeText {
                    idc = 190;
                    text = "20:28:35";
                    font = "EtelkaMonospacePro";
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    x = "12.1 * (0.01875 * SafezoneH)";
                    y = "6.5 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class CA_Laser: RscText {
                    idc = 158;
                    style = "0x30 + 0x800";
                    sizeEx = "0.038 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = QPATHTOF(data\Helo_LaserON.paa);
                    x = "20.45 * (0.01875 * SafezoneH)";
                    y = "14.1 * (0.025 * SafezoneH)";
                    w = "12.5 * (0.01875 * SafezoneH)";
                    h = "12 * (0.025 * SafezoneH)";
                };

                class CA_Heading: RscText {
                    idc = 156;
                    style = 0;
                    sizeEx = "0.038 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "023";
                    x = "24.83 * (0.01875 * SafezoneH)";
                    y = "6 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };
            };
        };
    };

    class Rsc_ACE_Helo_UI_01: RscUnitInfo {
        controls[] = {"WeaponInfoControlsGroupRight", "CA_TextFlaresMode", "CA_TextFlares", "CA_VehicleToggles", "CA_Radar"};
    };

    class Rsc_ACE_Helo_UI_02: RscUnitInfo {
        controls[] = {"CA_TextFlaresMode", "CA_TextFlares", "CA_VehicleToggles", "CA_Radar"};
    };

    class Rsc_ACE_Drones_UI_Turret: RscUnitInfo {
        idd = 300;
        controls[] = {"CA_Zeroing", "CA_IGUI_elements_group", "CA_VehicleToggles"};

        class CA_IGUI_elements_group: RscControlsGroup {
            idc = 170;

            class VScrollbar: VScrollbar {
                width = 0;
            };

            class HScrollbar: HScrollbar {
                height = 0;
            };

            x = "0 * (0.01875 * SafezoneH) + (SafezoneX + ((SafezoneW - SafezoneH) / 2))";
            y = "0 * (0.025 * SafezoneH) + (SafezoneY)";
            w = "53.5 * (0.01875 * SafezoneH)";
            h = "40 * (0.025 * SafezoneH)";

            class controls {
                class CA_Distance: RscText {
                    idc = 151;
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    x = "24.78 * (0.01875 * SafezoneH)";
                    y = "30.88 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class CA_Speed: RangeText {
                    idc = 188;
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "120";
                    x = "14.78 * (0.01875 * SafezoneH)";
                    y = "30.88 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class CA_Alt: RangeText {
                    idc = 189;
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "3825";
                    x = "34.78 * (0.01875 * SafezoneH)";
                    y = "30.88 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class ValueTime: RangeText {
                    idc = 190;
                    text = "20:28:35";
                    font = "EtelkaMonospacePro";
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    x = "1.75 * (0.01875 * SafezoneH)";
                    y = "10.5 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class CA_VisionMode: RscText {
                    idc = 152;
                    style = 0;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "VIS";
                    align = "right";
                    x = "2.6 * (0.01875 * SafezoneH)";
                    y = "12.0 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.0 * (0.025 * SafezoneH)";
                };

                class CA_FlirMode: RscText {
                    idc = 153;
                    style = 0;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "BHOT";
                    align = "right";
                    x = "6.18 * (0.01875 * SafezoneH)";
                    y = "12.0 * (0.025 * SafezoneH)";
                    w = "4.5 * (0.01875 * SafezoneH)";
                    h = "1.0 * (0.025 * SafezoneH)";
                };

                class TgT_Grid_text: RangeText {
                    idc = 1005;
                    text = "TGT:";
                    font = "EtelkaMonospacePro";
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    x = "1.20 * (0.01875 * SafezoneH)";
                    y = "13.5 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class TGT_ValueGrid: RangeText {
                    idc = 172;
                    font = "EtelkaMonospacePro";
                    colorText[] = {0.706, 0.0745, 0.0196, 0.8};
                    style = 2;
                    sizeEx = "0.0295*SafezoneH";
                    shadow = 0;
                    x = "5.20 * (0.01875 * SafezoneH)";
                    y = "13.5 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class OWN_Grid_text: RangeText {
                    idc = 1005;
                    text = "OWN:";
                    font = "EtelkaMonospacePro";
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    x = "1.20 * (0.01875 * SafezoneH)";
                    y = "15 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class OWN_ValueGrid: RangeText {
                    idc = 171;
                    font = "EtelkaMonospacePro";
                    colorText[] = {0.15, 1, 0.15, 0.8};
                    style = 2;
                    sizeEx = "0.0295 * SafezoneH";
                    shadow = 0;
                    x = "5.20 * (0.01875 * SafezoneH)";
                    y = "15 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class CA_Laser: RscText {
                    idc = 158;
                    style = "0x30 + 0x800";
                    sizeEx = "0.038 * SafezoneH";
                    shadow = 0;
                    align = "right";
                    font = "EtelkaMonospacePro";
                    text = QPATHTOF(data\Helo_LaserON.paa);
                    x = "20.45 * (0.01875 * SafezoneH)";
                    y = "14.1 * (0.025 * SafezoneH)";
                    w = "12.5 * (0.01875 * SafezoneH)";
                    h = "12 * (0.025 * SafezoneH)";
                };

                class CA_Heading: RscText {
                    idc = 156;
                    style = 0;
                    sizeEx = "0.038 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    text = "023";
                    align = "right";
                    x = "25 * (0.01875 * SafezoneH)";
                    y = "5 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };
            };
        };
    };

    class Rsc_ACE_Drones_UI_Pilots: RscUnitInfo {
        idd = 300;
        controls[] = {"WeaponInfoControlsGroupRight", "CA_BackgroundVehicle", "CA_BackgroundVehicleTitle", "CA_BackgroundVehicleTitleDark", "CA_BackgroundFuel", "CA_Vehicle", "CA_VehicleRole", "CA_HitZones", "CA_SpeedBackground", "CA_SpeedUnits", "CA_Speed", "CA_ValueFuel", "CA_AltBackground", "CA_AltUnits", "CA_Alt", "CA_VehicleToggles", "CA_Radar", "DriverOpticsGroup"};

        class DriverOpticsGroup: RscControlsGroup {
            idc = 392;

            class VScrollbar: VScrollbar {
                width = 0;
            };

            class HScrollbar: HScrollbar {
                height = 0;
            };
            x = "0 * (0.01875 * SafezoneH) + (SafezoneX + ((SafezoneW - SafezoneH) / 2))";
            y = "0 * (0.025 * SafezoneH) + (SafezoneY)";
            w = "53.5 * (0.01875 * SafezoneH)";
            h = "40 * (0.025 * SafezoneH)";

            class controls {
                class TextGrid: RscText {
                    style = 0;
                    sizeEx = "0.02 * SafezoneH";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    idc = 1005;
                    text = "GRID:";
                    x = "5.8 * (0.01875 * SafezoneH)";
                    y = "31.8 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class ValueGrid: TextGrid {
                    idc = 189;
                    text = "382546";
                    x = "10.3 * (0.01875 * SafezoneH)";
                    y = "31.8 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class TextTime: TextGrid {
                    idc = 1010;
                    text = "TIME [UTC]:";
                    x = "5.8 * (0.01875 * SafezoneH)";
                    y = "32.6 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class ValueTime: TextGrid {
                    idc = 101;
                    text = "20:28:35";
                    x = "10 * (0.01875 * SafezoneH)";
                    y = "32.6 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class TextMag: TextGrid {
                    idc = 1011;
                    text = "CAM MAG:";
                    x = "5.8 * (0.01875 * SafezoneH)";
                    y = "7 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class OpticsZoom: TextGrid {
                    idc = 192;
                    text = "28x";
                    x = "10.3 * (0.01875 * SafezoneH)";
                    y = "7 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class BorderLineSpdTop: RscPicture {
                    idc = 1203;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa";
                    x = "3.343 * (0.01875 * SafezoneH)";
                    y = "12.4 * (0.025 * SafezoneH)";
                    w = "3 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class BorderLineSpdBottom: RscPicture {
                    idc = 1207;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa";
                    x = "3.343 * (0.01875 * SafezoneH)";
                    y = "26.5 * (0.025 * SafezoneH)";
                    w = "3 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class BorderLineAltTop: RscPicture {
                    idc = 1205;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa";
                    x = "47.16 * (0.01875 * SafezoneH)";
                    y = "12.4 * (0.025 * SafezoneH)";
                    w = "3 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class BorderLineAltBottom: RscPicture {
                    idc = 1206;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\border_line_ca.paa";
                    x = "47.16 * (0.01875 * SafezoneH)";
                    y = "26.5 * (0.025 * SafezoneH)";
                    w = "3 * (0.01875 * SafezoneH)";
                    h = "1 * (0.025 * SafezoneH)";
                };

                class TextSpd: TextGrid {
                    idc = 1004;
                    text = "SPD";
                    x = "4.8 * (0.01875 * SafezoneH)";
                    y = "11.8 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class SpeedValueBorder: RscPicture {
                    idc = 1200;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\altimeter_value_ca.paa";
                    x = "6.3 * (0.01875 * SafezoneH)";
                    y = "19 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "2 * (0.025 * SafezoneH)";
                };

                class CA_Speed: TextGrid {
                    idc = 190;
                    sizeEx = "0.03*SafezoneH";
                    text = "120";
                    x = "7.5 * (0.01875 * SafezoneH)";
                    y = "19.5 * (0.025 * SafezoneH)";
                    w = "6 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class AnalogueSpeed: RscLadderPicture {
                    idc = 384;
                    topValue = 1312;
                    bottomValue = -345;
                    visibleRange = -1;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\UAVspeedLadder_ca.paa";
                    x = "1.5 * (0.01875 * SafezoneH)";
                    y = "13 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "14 * (0.025 * SafezoneH)";
                };

                class TextAlt: TextGrid {
                    idc = 1006;
                    text = "ALT";
                    x = "46.9 * (0.01875 * SafezoneH)";
                    y = "11.8 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class AltValueBorder: RscPicture {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\airspeed_value_ca.paa";
                    x = "42.25 * (0.01875 * SafezoneH)";
                    y = "19 * (0.025 * SafezoneH)";
                    w = "5 * (0.01875 * SafezoneH)";
                    h = "2 * (0.025 * SafezoneH)";
                };

                class CA_Alt: TextGrid {
                    idc = 191;
                    sizeEx = "0.03 * SafezoneH";
                    style = 1;
                    text = "3825";
                    x = "43 * (0.01875 * SafezoneH)";
                    y = "19.5 * (0.025 * SafezoneH)";
                    w = "3.2 * (0.01875 * SafezoneH)";
                    h = "1.2 * (0.025 * SafezoneH)";
                };

                class AnalogueAlt: RscLadderPicture {
                    idc = 385;
                    topValue = 14430;
                    bottomValue = -2110;
                    visibleRange = -1;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\UAValtLadder_ca.paa";
                    x = "47 * (0.01875 * SafezoneH)";
                    y = "13 * (0.025 * SafezoneH)";
                    w = "2.5 * (0.01875 * SafezoneH)";
                    h = "14 * (0.025 * SafezoneH)";
                };

                class AnalogueHorizon: RscLadderPicture {
                    idc = 383;
                    topValue = 90;
                    bottomValue = -90;
                    visibleRange = -1;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\horizon_ladder_ca.paa";
                    x = "16.75 * (0.01875 * SafezoneH)";
                    y = "5 * (0.025 * SafezoneH)";
                    w = "20 * (0.01875 * SafezoneH)";
                    h = "30 * (0.025 * SafezoneH)";
                };

                class HorizonCenter: RscPicture {
                    idc = 1202;
                    text = "\A3\Ui_f\data\IGUI\Cfg\HelicopterHUD\horizon_aircraft_ca.paa";
                    x = "24.75 * (0.01875 * SafezoneH)";
                    y = "19 * (0.025 * SafezoneH)";
                    w = "4 * (0.01875 * SafezoneH)";
                    h = "2 * (0.025 * SafezoneH)";
                };
            };
        };
    };
};
