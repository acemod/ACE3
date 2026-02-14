#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

class RscListNBox;

class RangeCard_RscText {
    idc = -1;
    type = 0;
    style = ST_CENTER;
    colorDisabled[] = {0, 0, 0, 0.0};
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {0, 0, 0, 1};
    text = "";
    x = 0;
    y = 0;
    h = 0.028;
    w = 0.06;
    font = "TahomaB";
    SizeEx = 0.025;
    shadow = 0;
};

class RangeCard_RscListNBox: RscListNBox {
    idc = -1;
    type = 102;
    style = 0;
    font = "TahomaB";
    sizeEx = 0.026;
    rowHeight = 0.027;
    colorDisabled[] = {0, 0, 0, 0.0};
    colorBackground[] = {1, 1, 1, 1};
    colorText[] = {0, 0, 0, 1};
    colorScrollbar[] = {0.95, 0.95, 0.95, 1};
    colorSelect[] = {0, 0, 0, 1};
    colorSelect2[] = {0, 0, 0, 1};
    colorSelectBackground[] = {1, 1, 1, 0};
    colorSelectBackground2[] = {1, 1, 1, 0};
    period = 0;
    LineSpacing = 0;
    maxHistoryDelay = 1.0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    soundSelect[] = {"", 0.09, 1};
    drawSideArrows = 0;
    idcLeft = -1;
    idcRight = -1;

    class ScrollBar {
        color[] = {1, 1, 1, 0.6};
        colorActive[] = {1, 1, 1, 1};
        colorDisabled[] = {1, 1, 1, 0.3};
    };

    class ListScrollBar: ScrollBar {};
};

class ACE_RangeCard_Dialog {
    idd = -1;
    movingEnable = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(display),_this select 0)]; GVAR(rangeCardOpened) = true);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(display),nil)]; GVAR(rangeCardOpened) = false);
    objects[] = {};

    class controls {
        class BACKGROUND {
            moving = 1;
            type = 0;
            font = "TahomaB";
            SizeEX = 0.025;
            idc = -1;
            style = 48;
            x = "safeZoneX";
            y = "safeZoneY+0.181889";
            w = 1.62727*3/4;
            h = 1.62727;
            colorBackground[] = {1, 1, 1, 1};
            colorText[] = {1, 1, 1, 1};
            text = QPATHTOF(UI\RangeCard.paa);
        };
        class CAPTION_TEXT_1: RangeCard_RscText {
            idc = IDC_CAPTION_TEXT_1;
            style = ST_LEFT;
            x = "safeZoneX+0.18";
            y = "safeZoneY+0.181889+0.0";
            w = 0.56*1.62727*3/4;
            text = ".408 CheyTac - 410 gr Predator Projectiles";
        };
        class CAPTION_TEXT_2: CAPTION_TEXT_1 {
            idc = IDC_CAPTION_TEXT_2;
            SizeEx = 0.022;
            y = "safeZoneY+0.181889+0.03";
            text = "Drop Tables for B.P.: 1013.25mb; Corrected for MVV at Air/Ammo Temperatures -15-35 °C";
        };
        class CAPTION_TEXT_3: CAPTION_TEXT_2 {
            idc = IDC_CAPTION_TEXT_3;
            y = "safeZoneY+0.181889+0.06";
            text = "CheyTac Intervention - 29'' 1:13'' twist (M-200)";
        };
        class ZERO_RANGE_TEXT: RangeCard_RscText {
            idc = IDC_ZERO_RANGE_TEXT;
            style = ST_LEFT;
            SizeEx = 0.028;
            x = "safeZoneX+0.885";
            y = "safeZoneY+0.181889+0.01";
            w = 0.125*1.62727*3/4;
            text = "100m ZERO";
        };
        class BAROMETRIC_PRESSURE_TEXT: ZERO_RANGE_TEXT {
            idc = IDC_BAROMETRIC_PRESSURE_TEXT;
            colorText[] = {1, 0, 0, 0.8};
            y = "safeZoneY+0.181889+0.05";
            text = "B.P.: 1013.25mb";
        };
        class TARGET_RANGE_TEXT_1: RangeCard_RscText {
            idc = IDC_TARGET_RANGE_TEXT_1;
            colorText[] = {1, 1, 1, 1};
            x = "safeZoneX+0.185";
            y = "safeZoneY+0.181889+0.098";
            text = "Target";
        };
        class TARGET_RANGE_TEXT_2: TARGET_RANGE_TEXT_1 {
            idc = IDC_TARGET_RANGE_TEXT_2;
            SizeEx = 0.03;
            y = "safeZoneY+0.181889+0.125";
            text = "Range";
        };
        class TARGET_RANGE_TEXT_3: TARGET_RANGE_TEXT_1 {
            idc = IDC_TARGET_RANGE_TEXT_3;
            y = "safeZoneY+0.181889+0.152";
            text = "(m)";
        };
        class BULLET_DROP_TEXT_1: RangeCard_RscText {
            idc = IDC_BULLET_DROP_TEXT_1;
            x = "safeZoneX+0.25";
            y = "safeZoneY+0.181889+0.095";
            w = 0.405*1.62727*3/4;
            text = "Bullet Drop (MRADs)";
        };
        class WIND_LEAD_CAPTION_LIST: RangeCard_RscListNBox {
            idc = IDC_WIND_LEAD_CAPTION_LIST;
            sizeEx = 0.021;
            x = "safeZoneX+0.728";
            y = "safeZoneY+0.181889+0.091";
            w = 0.25*1.62727*3/4;
            h = 0.0909445;
            columns[] = {0.03/2, 0.985/2};
            idcLeft = IDC_WIND_LEAD_CAPTION_LIST_LEFT;
            idcRight = IDC_WIND_LEAD_CAPTION_LIST_RIGHT;
        };
        class TEMPERATURE_CAPTION_LIST_1: RangeCard_RscListNBox {
            idc = IDC_TEMPERATURE_CAPTION_LIST_1;
            x = "safeZoneX+0.24";
            y = "safeZoneY+0.181889+0.125";
            w = 0.405*1.62727*3/4;
            h = 0.0909445;
            columns[] = {0/9, 1/9, 2/9, 3/9, 4/9, 5/9, 5.9/9, 6.9/9, 7.8/9};
            idcLeft = IDC_TEMPERATURE_CAPTION_LIST_1_LEFT;
            idcRight = IDC_TEMPERATURE_CAPTION_LIST_1_RIGHT;
        };
        class TEMPERATURE_CAPTION_LIST_2: RangeCard_RscListNBox {
            idc = IDC_TEMPERATURE_CAPTION_LIST_2;
            x = "safeZoneX+0.728";
            y = "safeZoneY+0.181889+0.15";
            w = 0.25*1.62727*3/4;
            h = 0.0909445;
            columns[] = {0/6, 0.9/6, 1.8/6, 2.9/6, 3.8/6, 4.8/6};
            idcLeft = IDC_TEMPERATURE_CAPTION_LIST_2_LEFT;
            idcRight = IDC_TEMPERATURE_CAPTION_LIST_2_RIGHT;
        };
        class RANGE_CARD_DATA: RangeCard_RscListNBox {
            idc = IDC_RANGE_CARD_DATA;
            x = "safeZoneX+0.182";
            y = "safeZoneY+0.181889+0.194";
            w = 0.72*1.62727*3/4;
            h = 1.62727;
            columns[] = {0/16, 1.2/16, 2.2/16, 3.2/16, 4.2/16, 5.1/16, 6.1/16, 7.1/16, 8.1/16,
                        9/16, 10.2/16, 11/16, 11.9/16, 12.8/16, 13.7/16, 14.6/16};
            idcLeft = IDC_RANGE_CARD_DATA_LEFT;
            idcRight = IDC_RANGE_CARD_DATA_RIGHT;
        };
        class FOOTNOTE_TEXT_1: CAPTION_TEXT_1 {
            idc = IDC_FOOTNOTE_TEXT_1;
            SizeEx = 0.022;
            y = "safeZoneY+1.72431";
            w = 0.705*1.62727*3/4;
            text = "For best results keep ammunition at ambient air temperature. Tables calculated for the above listed barrel";
        };
        class FOOTNOTE_TEXT_2: FOOTNOTE_TEXT_1 {
            idc = IDC_FOOTNOTE_TEXT_2;
            y = "safeZoneY+1.72431+0.024";
            text = "and load with optic mounted 1.5'' above line of bore.";
        };
    };
};
