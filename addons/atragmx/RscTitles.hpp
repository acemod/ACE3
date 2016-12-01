#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

#define ST_WITH_RECT 160

#define LB_TEXTURES 0x10

class ATragMX_RscText {
    idc=-1;
    type=0;
    style=256;
    colorDisabled[]={0,0,0,0.0};
    colorBackground[]={0,0,0,0};
    colorText[]={0,0,0,1};
    text="";
    x=0;
    y=0;
    h=0.037;
    w=0.30;
    font="TahomaB";
    SizeEx=0.03;
    shadow=0;
};
class ATragMX_RscButton {
    text="";
    colorText[]={0,0,0,1};
    colorDisabled[]={0,0,0,0.0};
    colorBackground[]={0,0,0,0};
    colorBackgroundDisabled[]={0,0,0,0};
    colorBackgroundActive[]={0,0,0,0};
    colorFocused[]={0,0,0,0};
    colorShadow[]={0,0,0,0};
    colorBorder[]={0,0,0,1};
    soundEnter[]={"",0,1};
    soundPush[]={"",0,1};
    soundClick[]={"",0,1};
    soundEscape[]={"",0,1};
    type=1;
    style="0x02+0x100";
    x=0;
    y=0;
    w=0.03;
    h=0.03;
    font="TahomaB";
    SizeEx=0.025;
    offsetX=0.003;
    offsetY=0.003;
    offsetPressedX=0.0020;
    offsetPressedY=0.0020;
    borderSize=0;
    shadow=0;
};
class ATragMX_RscEdit {
    access=0;
    type=2;
    style=ST_RIGHT;
    x=0;
    y=0;
    w=0.05;
    h=0.03;
    colorDisabled[]={0,0,0,0.0};
    colorBackground[]={0,0,0,0};
    colorText[]={0,0,0,1};
    colorSelection[]={0,0,0,0.25};
    font="TahomaB";
    sizeEx=0.025;
    text="";
    size=0.2;
    autocomplete="";
    shadow=0;
};
class ATragMX_RscToolbox {
    type=6;
    style=ST_LEFT;
    x=0;
    y=0;
    w=0.2;
    h=0.03;
    colorDisabled[]={0,0,0,0.0};
    colorBackground[]={1,1,1,1};
    colorText[]={0,0,0,1};
    color[]={0,0,0,0};
    colorTextSelect[]={0.8,0.8,0.8,1};
    colorSelect[]={0,0,0,1};
    colorSelectedBg[]={0,0,0,1};
    colorTextDisable[]={0.4,0.4,0.4,1};
    colorDisable[]={0.4,0.4,0.4,1};
    font="TahomaB";
    sizeEx=0.027;
    rows=1;
    columns=2;
    strings[]={"Entry 1","Entry 2"};
    values[]={1,0};
    onToolBoxSelChanged="";
};
class ATragMX_RscListBox {
    idc=-1;
    type=5;
    style=LB_TEXTURES;
    font="TahomaB";
    sizeEx=0.028;
    rowHeight=0.03;
    colorDisabled[]={0,0,0,0.0};
    colorBackground[]={1,1,1,1};
    colorText[]={0,0,0,1};
    colorScrollbar[]={0.95,0.95,0.95,1};
    colorSelect[]={0,0,0,1};
    colorSelect2[]={0,0,0,1};
    colorSelectBackground[]={0.925,0.925,0.925,1};
    colorSelectBackground2[]={0.925,0.925,0.925,1};
    period=0;
    maxHistoryDelay=1.0;
    autoScrollSpeed=-1;
    autoScrollDelay=5;
    autoScrollRewind=0;
    soundSelect[]={"",0.09,1};

    class ScrollBar {
        width=0.05;
        color[]={0.15,0.21,0.23,0.3};
        colorActive[]={0.15,0.21,0.23,0.3};
        colorDisabled[]={0.15,0.21,0.23,0.3};
        arrowEmpty="\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull="\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        border="\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        thumb="\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    };

    class ListScrollBar : ScrollBar {
    };
};
class ATragMX_RscListNBox: ATragMX_RscListBox {
    idc=-1;
    type=102;
    drawSideArrows=0;
    idcLeft=-1;
    idcRight=-1;
};
class ATragMX_RscLineBreak {
    idc=-1;
    type=98;
    shadow=0;
};
class ATragMX_Display {
    name="ATragMX_Display";
    idd=-1;
    onLoad="uiNamespace setVariable ['ATragMX_Display', (_this select 0)]";
    onUnload=QUOTE(_this call FUNC(on_close_dialog));
    movingEnable=1;
    controlsBackground[]={};
    objects[]={};
    class controls {
        class BACKGROUND {
            moving=1;
            type=0;
            font="TahomaB";
            SizeEX=0.025;
            idc=720000;
            style=48;
            x=0.55*safezoneW+safezoneX-0.256;
            y=0.265*safezoneH+safezoneY-0.1;
            w=1.024;
            h=1.024*4/3;
            colorBackground[]={1,1,1,1};
            colorText[]={1,1,1,1};
            text=PATHTOF(UI\atrag_d.paa);
        };
        class POWER: ATragMX_RscButton {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.145;
            y=0.265*safezoneH+safezoneY+0.94;
            w=0.045;
            h=0.045*4/3;
            colorBackground[]={0,0,0,0.0};
            action="closeDialog 0";
        };
        class BACK: POWER {
            idc=-1;
            w=0.06;
            x=0.55*safezoneW+safezoneX+0.3122;
            action=QUOTE(call FUNC(init); call FUNC(update_target_selection));
        };
        class WINDOWS: ATragMX_RscButton {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.130;
            y=0.265*safezoneH+safezoneY+0.88;
            w=0.035;
            h=0.035*4/3;
            colorBackground[]={0,0,0,0.0};
        };
        class OK: WINDOWS {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.347;
            y=0.265*safezoneH+safezoneY+0.878;
        };
        class TOP: ATragMX_RscButton {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.242;
            y=0.265*safezoneH+safezoneY+0.85;
            w=0.03;
            h=0.03;
            colorBackground[]={0,0,0,0.0};
            action=QUOTE(-1 call FUNC(cycle_gun_list));
        };
        class BOTTOM: TOP {
            idc=-1;
            y=0.265*safezoneH+safezoneY+0.955;
            action=QUOTE(+1 call FUNC(cycle_gun_list));
        };
        class LEFT: ATragMX_RscButton {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.1925;
            y=0.265*safezoneH+safezoneY+0.9;
            w=0.05;
            h=0.03;
            colorBackground[]={0,0,0,0};
            action=QUOTE(((4 + GVAR(currentTarget) - 1) % 4) call FUNC(change_target_slot));
        };
        class RIGHT: LEFT {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.2725;
            action=QUOTE(((4 + GVAR(currentTarget) + 1) % 4) call FUNC(change_target_slot));
        };
        class TOP_LEFT: ATragMX_RscButton {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.162;
            y=0.265*safezoneH+safezoneY+0.82;
            w=0.031;
            h=0.031*4/3;
            colorBackground[]={0,0,0,0.0};
        };
        class TOP_RIGHT: TOP_LEFT {
            idc=-1;
            x=0.55*safezoneW+safezoneX+0.315;
        };

        class TEXT_GUN_FRAME: ATragMX_RscText {
            idc=1001;
            style=64;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.25;
            w=0.0925;
            h=0.205;
            text="";
        };
        class TEXT_ATMOSPHERE_FRAME: TEXT_GUN_FRAME {
            idc=1002;
            x=0.550*safezoneW+safezoneX+0.205;
        };
        class TEXT_TARGET_FRAME: TEXT_GUN_FRAME {
            idc=1003;
            x=0.550*safezoneW+safezoneX+0.3;
        };
        class TEXT_RESULT_FRAME: TEXT_GUN_FRAME {
            idc=1004;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.46;
            w=0.2825;
            h=0.15;
        };
        class TEXT_GUN_PROFILE: ATragMX_RscText {
            idc=1000;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.20;
            w=0.18;
            h=0.03;
            style=ST_LEFT;
            sizeEx=0.025;
            text="";
        };
        class TEXT_D: ATragMX_RscButton {
            idc=600;
            w=0.0231;
            x=0.550*safezoneW+safezoneX+0.29;
            y=0.265*safezoneH+safezoneY+0.20;
            colorText[]={0,0,0,1};
            colorDisabled[]={0.8,0.8,0.8,1};
            colorBackgroundDisabled[]={0,0,0,1};
            colorBackgroundActive[]={0,0,0,0};
            text="D";
            action=QUOTE(GVAR(currentUnit)=0; call FUNC(update_unit_selection));
        };
        class TEXT_E: TEXT_D {
            idc=601;
            x=0.550*safezoneW+safezoneX+0.3131;
            text="E";
            action=QUOTE(GVAR(currentUnit)=1; call FUNC(update_unit_selection));
        };
        class TEXT_M: TEXT_E {
            idc=602;
            x=0.550*safezoneW+safezoneX+0.3362;
            text="M";
            action=QUOTE(GVAR(currentUnit)=2; call FUNC(update_unit_selection));
        };
        class TEXT_RANGE_CARD: TEXT_D {
            idc=603;
            w=0.03;
            x=0.550*safezoneW+safezoneX+0.36;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="RC";
            action=QUOTE(call FUNC(toggle_range_card));
        };

        class TEXT_GUN: ATragMX_RscButton {
            idc=4000;
            w=0.0925;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.25;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="Gun";
            action=QUOTE(call FUNC(toggle_gun_ammo_data));
        };
        class TEXT_BORE_HEIGHT: TEXT_GUN_PROFILE {
            idc=10;
            style=ST_LEFT;
            y=0.265*safezoneH+safezoneY+0.285;
            text="BH";
        };
        class TEXT_BORE_HEIGHT_OUTPUT: TEXT_BORE_HEIGHT {
            idc=100;
            style=ST_RIGHT;
            w=0.058;
            x=0.550*safezoneW+safezoneX+0.145;
            y=0.265*safezoneH+safezoneY+0.285;
        };
        class TEXT_BULLET_MASS: TEXT_BORE_HEIGHT {
            idc=11;
            style=ST_LEFT;
            y=0.265*safezoneH+safezoneY+0.320;
            text="BW";
        };
        class TEXT_BULLET_MASS_OUTPUT: TEXT_BORE_HEIGHT_OUTPUT {
            idc=110;
            y=0.265*safezoneH+safezoneY+0.320;
        };
        class TEXT_AIR_FRICTION: TEXT_BORE_HEIGHT {
            idc=12;
            y=0.265*safezoneH+safezoneY+0.355;
            text="C1";
        };
        class TEXT_AIR_FRICTION_OUTPUT: TEXT_BORE_HEIGHT_OUTPUT {
            idc=120;
            y=0.265*safezoneH+safezoneY+0.355;
        };
        class TEXT_MUZZLE_VELOCITY: ATragMX_RscButton {
            idc=13;
            style=0;
            w=0.03;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.390;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="MV";
            action=QUOTE(0 call FUNC(toggle_muzzle_velocity_data));
        };
        class TEXT_MUZZLE_VELOCITY_OUTPUT: TEXT_BORE_HEIGHT_OUTPUT {
            idc=130;
            y=0.265*safezoneH+safezoneY+0.390;
        };
        class TEXT_ZERO_RANGE: TEXT_BORE_HEIGHT {
            idc=14;
            y=0.265*safezoneH+safezoneY+0.425;
            text="ZR";
        };
        class TEXT_ZERO_RANGE_OUTPUT: TEXT_BORE_HEIGHT_OUTPUT {
            idc=140;
            y=0.265*safezoneH+safezoneY+0.425;
        };
        class TEXT_ATMOSPHERE: TEXT_GUN {
            idc=4001;
            x=0.550*safezoneW+safezoneX+0.205;
            text="Atmsphr";
            action=QUOTE(0 call FUNC(toggle_atmo_env_data));
        };
        class TEXT_TEMPERATURE: TEXT_BULLET_MASS {
            idc=20;
            x=0.550*safezoneW+safezoneX+0.20;
            text="Tmp";
        };
        class TEXT_TEMPERATURE_OUTPUT: TEXT_TEMPERATURE {
            idc=200;
            style=ST_RIGHT;
            w=0.050;
            x=0.550*safezoneW+safezoneX+0.245;
            y=0.265*safezoneH+safezoneY+0.320;
            text="";
        };
        class TEXT_BAROMETRIC_PRESSURE: TEXT_TEMPERATURE {
            idc=21;
            x=0.550*safezoneW+safezoneX+0.20;
            y=0.265*safezoneH+safezoneY+0.355;
            text="BP";
        };
        class TEXT_BAROMETRIC_PRESSURE_OUTPUT: TEXT_TEMPERATURE_OUTPUT {
            idc=210;
            y=0.265*safezoneH+safezoneY+0.355;
        };
        class TEXT_RELATIVE_HUMIDITY: TEXT_BAROMETRIC_PRESSURE {
            idc=22;
            y=0.265*safezoneH+safezoneY+0.390;
            text="RH";
        };
        class TEXT_RELATIVE_HUMIDITY_OUTPUT: TEXT_TEMPERATURE_OUTPUT {
            idc=220;
            y=0.265*safezoneH+safezoneY+0.390;
        };
        class TEXT_ALTITUDE: TEXT_BORE_HEIGHT {
            idc=23;
            x=0.550*safezoneW+safezoneX+0.20;
            text="Alt";
        };
        class TEXT_ALTITUDE_OUTPUT: TEXT_TEMPERATURE_OUTPUT {
            idc=230;
            y=0.265*safezoneH+safezoneY+0.285;
        };
        class TEXT_TARGET_A: ATragMX_RscButton {
            idc=500;
            w=0.0231;
            x=0.550*safezoneW+safezoneX+0.205;
            y=0.265*safezoneH+safezoneY+0.425;
            colorText[]={0,0,0,1};
            colorDisabled[]={0.8,0.8,0.8,1};
            colorBackgroundDisabled[]={0,0,0,1};
            colorBackgroundActive[]={0,0,0,0};
            text="A";
            action=QUOTE(0 call FUNC(change_target_slot));
        };
        class TEXT_TARGET_B: TEXT_TARGET_A {
            idc=501;
            x=0.550*safezoneW+safezoneX+0.2281;
            text="B";
            action=QUOTE(1 call FUNC(change_target_slot));
        };
        class TEXT_TARGET_C: TEXT_TARGET_A {
            idc=502;
            x=0.550*safezoneW+safezoneX+0.2512;
            text="C";
            action=QUOTE(2 call FUNC(change_target_slot));
        };
        class TEXT_TARGET_D: TEXT_TARGET_A {
            idc=503;
            x=0.550*safezoneW+safezoneX+0.2743;
            text="D";
            action=QUOTE(3 call FUNC(change_target_slot));
        };

        class TEXT_TARGET: TEXT_GUN {
            idc=4002;
            x=0.550*safezoneW+safezoneX+0.3;
            text="Target";
            action=QUOTE(0 call FUNC(toggle_target_data));
        };
        class TEXT_WIND_SPEED: TEXT_BORE_HEIGHT {
            idc=30;
            x=0.550*safezoneW+safezoneX+0.3;
            text="WS";
        };
        class TEXT_WIND_SPEED_OUTPUT: TEXT_BORE_HEIGHT_OUTPUT {
            idc=300;
            w=0.058;
            x=0.550*safezoneW+safezoneX+0.335;
            y=0.265*safezoneH+safezoneY+0.285;
            text="0";
        };
        class TEXT_WIND_DIRECTION: TEXT_BULLET_MASS {
            idc=31;
            x=0.550*safezoneW+safezoneX+0.3;
            text="WD";
        };
        class TEXT_WIND_DIRECTION_OUTPUT: TEXT_WIND_SPEED_OUTPUT {
            idc=310;
            y=0.265*safezoneH+safezoneY+0.32;
        };
        class TEXT_INCLINATION_ANGLE: TEXT_AIR_FRICTION {
            idc=32;
            x=0.550*safezoneW+safezoneX+0.3;
            text="IA";
        };
        class TEXT_INCLINATION_ANGLE_OUTPUT: TEXT_WIND_SPEED_OUTPUT {
            idc=320;
            y=0.265*safezoneH+safezoneY+0.355;
        };
        class TEXT_TARGET_SPEED: TEXT_MUZZLE_VELOCITY {
            idc=33;
            x=0.550*safezoneW+safezoneX+0.3;
            text="TS";
            action=QUOTE(0 call FUNC(toggle_target_speed_assist));
        };
        class TEXT_TARGET_SPEED_OUTPUT: TEXT_WIND_SPEED_OUTPUT {
            idc=330;
            y=0.265*safezoneH+safezoneY+0.39;
        };
        class TEXT_TARGET_RANGE: TEXT_TARGET_SPEED {
            idc=34;
            y=0.265*safezoneH+safezoneY+0.425;
            text="TR";
            action=QUOTE(0 call FUNC(toggle_target_range_assist));
        };
        class TEXT_TARGET_RANGE_INPUT: TEXT_WIND_SPEED_OUTPUT {
            idc=340;
            y=0.265*safezoneH+safezoneY+0.425;
        };

        class TEXT_ELEVATION: TEXT_GUN_PROFILE {
            idc=40;
            w=0.05;
            x=0.550*safezoneW+safezoneX+0.115;
            y=0.265*safezoneH+safezoneY+0.50;
            text="Elev";
        };
        class TEXT_ABSOLUTE: TEXT_GUN_PROFILE {
            idc=4003;
            w=0.07;
            style=ST_CENTER;
            x=0.550*safezoneW+safezoneX+0.17;
            y=0.265*safezoneH+safezoneY+0.47;
            text="Abs";
        };
        class TEXT_RELATIVE: TEXT_ABSOLUTE {
            idc=4004;
            x=0.550*safezoneW+safezoneX+0.245;
            text="Rel";
        };
        class TEXT_CURRENT: TEXT_ABSOLUTE {
            idc=4005;
            x=0.550*safezoneW+safezoneX+0.32;
            text="Cur";
        };
        class TEXT_ELEVATION_OUTPUT_ABSOLUTE: ATragMX_RscText {
            idc=400;
            style=ST_WITH_RECT+ST_RIGHT;
            sizeEx=0.025;
            w=0.065;
            h=0.032;
            x=0.550*safezoneW+safezoneX+0.17;
            y=0.265*safezoneH+safezoneY+0.50;
            text="";
        };
        class TEXT_ELEVATION_OUTPUT_RELATIVE: TEXT_ELEVATION_OUTPUT_ABSOLUTE {
            idc=401;
            x=0.550*safezoneW+safezoneX+0.2465;
        };
        class TEXT_ELEVATION_INPUT_CURRENT: TEXT_ELEVATION_OUTPUT_ABSOLUTE {
            idc=402;
            x=0.550*safezoneW+safezoneX+0.323;
        };
        class TEXT_WINDAGE: TEXT_ELEVATION {
            idc=41;
            y=0.265*safezoneH+safezoneY+0.535;
            text="Wind";
        };
        class TEXT_WINDAGE_OUTPUT_ABSOLUTE: TEXT_ELEVATION_OUTPUT_ABSOLUTE {
            idc=410;
            y=0.265*safezoneH+safezoneY+0.535;
        };
        class TEXT_WINDAGE_OUTPUT_RELATIVE: TEXT_WINDAGE_OUTPUT_ABSOLUTE {
            idc=411;
            x=0.550*safezoneW+safezoneX+0.2465;
        };
        class TEXT_WINDAGE_INPUT_CURRENT: TEXT_WINDAGE_OUTPUT_ABSOLUTE {
            idc=412;
            x=0.550*safezoneW+safezoneX+0.323;
        };
        class TEXT_LEAD: TEXT_GUN {
            idc=42;
            w=0.05;
            x=0.550*safezoneW+safezoneX+0.115;
            y=0.265*safezoneH+safezoneY+0.57;
            text="Lead";
            action=QUOTE(GVAR(showWind2) = !GVAR(showWind2); call FUNC(update_result); call FUNC(update_target));
        };
        class TEXT_LEAD_OUTPUT: TEXT_ELEVATION_OUTPUT_ABSOLUTE {
            idc=420;
            y=0.265*safezoneH+safezoneY+0.57;
        };
        class TEXT_RESET_SCOPE_ZERO: TEXT_GUN {
            idc=4006;
            w=0.07;
            style=ST_CENTER;
            colorBackground[]={0,0,0,0};
            x=0.550*safezoneW+safezoneX+0.2465;
            y=0.265*safezoneH+safezoneY+0.57;
            text="Reset";
            action=QUOTE(call FUNC(reset_relative_click_memory));
        };
        class TEXT_UPDATE_SCOPE_ZERO: TEXT_RESET_SCOPE_ZERO {
            idc=4007;
            x=0.550*safezoneW+safezoneX+0.323;
            text="Update";
            action=QUOTE(call FUNC(update_relative_click_memory));
        };
        class TEXT_GUN_LIST: TEXT_GUN {
            idc=4008;
            style=ST_LEFT;
            y=0.265*safezoneH+safezoneY+0.65;
            text="GunList";
            action=QUOTE(call FUNC(toggle_gun_list));
        };
        class TEXT_SCOPE_UNIT: TEXT_GUN_LIST {
            idc=2000;
            style=ST_CENTER;
            w=0.06;
            x=0.550*safezoneW+safezoneX+0.205;
            colorBackground[]={0,0,0,0};
            text="TMOA";
            action=QUOTE(call FUNC(cycle_scope_unit));
        };
        class TEXT_SCOPE_CLICK_NUMBER: TEXT_GUN_LIST {
            idc=2001;
            style=ST_CENTER;
            w=0.025;
            x=0.550*safezoneW+safezoneX+0.27;
            text="4";
            action=QUOTE(call FUNC(toggle_solution_setup));
        };
        class TEXT_OPTIONS: TEXT_GUN_LIST {
            idc=3000;
            style=ST_RIGHT;
            x=0.550*safezoneW+safezoneX+0.3;
            text="Options";
            action=QUOTE(false call FUNC(toggle_option_menu));
        };
        class TEXT_OPTIONS_BACKGROUND: ATragMX_RscButton {
            idc=3001;
            colorBackground[]={0.15,0.21,0.23,0.2};
            colorBackgroundActive[]={0.15,0.21,0.23,0.2};
            colorFocused[]={0.15,0.21,0.23,0.2};
            x=0.550*safezoneW+safezoneX+0.105;
            y=0.265*safezoneH+safezoneY+0.17;
            w=0.3;
            h=0.535;
            offsetPressedX=0.0;
            offsetPressedY=0.0;
            action=QUOTE(false call FUNC(toggle_option_menu));
        };
        class TEXT_OPTIONS_LIST_OUTPUT: ATragMX_RscListBox {
            idc=3002;
            style=0;
            w=0.17;
            h=0.28;
            x=0.550*safezoneW+safezoneX+0.225;
            y=0.265*safezoneH+safezoneY+0.355;
            sizeEx=0.025;
            onMouseButtonClick=QUOTE(true call FUNC(toggle_option_menu));
        };

        class TEXT_RANGE_CARD_SCOPE_UNIT: TEXT_GUN_PROFILE {
            idc=5000;
            text="";
        };
        class TEXT_RANGE_CARD_SETUP: ATragMX_RscButton {
            idc=5001;
            w=0.055675;
            x=0.550*safezoneW+safezoneX+0.28;
            y=0.265*safezoneH+safezoneY+0.20;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="Setup";
            action=QUOTE(call FUNC(toggle_range_card_setup));
        };
        class TEXT_RANGE_CARD_DONE: TEXT_RANGE_CARD_SETUP {
            idc=5002;
            x=0.550*safezoneW+safezoneX+0.3362;
            text="Done";
            action=QUOTE(call FUNC(toggle_range_card));
        };
        class TEXT_RANGE_CARD_COLUMN_1_CAPTION: ATragMX_RscButton {
            idc=5003;
            style=ST_LEFT;
            w=0.07;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.24;
            colorBackground[]={0.15,0.21,0.23,0.3};
            text="Meters";
        };
        class TEXT_RANGE_CARD_COLUMN_2_CAPTION: TEXT_RANGE_CARD_COLUMN_1_CAPTION {
            idc=5004;
            x=0.550*safezoneW+safezoneX+0.180625;
            text="Elev";
        };
        class TEXT_RANGE_CARD_COLUMN_3_CAPTION: TEXT_RANGE_CARD_COLUMN_1_CAPTION {
            idc=5005;
            x=0.550*safezoneW+safezoneX+0.25125;
            text="Wind";
        };
        class TEXT_RANGE_CARD_COLUMN_4_CAPTION: TEXT_RANGE_CARD_COLUMN_1_CAPTION {
            idc=5006;
            x=0.550*safezoneW+safezoneX+0.321875;
            text="TmFlt";
            action=QUOTE(call FUNC(cycle_range_card_columns));
        };
        class TEXT_RANGE_CARD_OUTPUT: ATragMX_RscListNBox {
            idc=5007;
            columns[]={0.0, 0.225, 0.475, 0.7};
            idcLeft=50061;
            idcRight=50062;
            w=0.285;
            h=0.42;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.27;
        };

        class TEXT_GUN_LIST_OUTPUT: ATragMX_RscListNBox {
            idc=6000;
            columns[]={-0.05};
            w=0.16;
            h=0.45;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.24;
            sizeEx=0.018;
            colorSelectBackground[]={0.15,0.21,0.23,0.3};
            colorSelectBackground2[]={0.15,0.21,0.23,0.3};
            onLBDblClick=QUOTE(true call FUNC(toggle_gun_list));
        };
        class TEXT_GUN_LIST_COLUMN_CAPTION: TEXT_GUN_PROFILE {
            idc=6001;
            w=0.16;
            colorBackground[]={0.15,0.21,0.23,0.3};
            text="AtragGun.gun";
        };
        class TEXT_GUN_LIST_OPEN_GUN: ATragMX_RscButton {
            idc=6002;
            style=ST_RIGHT;
            w=0.115;
            x=0.550*safezoneW+safezoneX+0.28;
            y=0.265*safezoneH+safezoneY+0.20;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            sizeEx=0.024;
            text="Open Gun";
            action=QUOTE(true call FUNC(toggle_gun_list));
        };
        class TEXT_GUN_LIST_SAVE_GUN: TEXT_GUN_LIST_OPEN_GUN {
            idc=6003;
            y=0.265*safezoneH+safezoneY+0.24;
            text="Save Gun";
            action=QUOTE(call FUNC(save_gun));
        };
        class TEXT_GUN_LIST_ADD_NEW_GUN: TEXT_GUN_LIST_OPEN_GUN {
            idc=6004;
            y=0.265*safezoneH+safezoneY+0.28;
            text="Add New Gun";
            action=QUOTE(false call FUNC(show_gun_list); true call FUNC(show_add_new_gun));
        };
        class TEXT_GUN_LIST_DELETE_GUN: TEXT_GUN_LIST_OPEN_GUN {
            idc=6005;
            y=0.265*safezoneH+safezoneY+0.34;
            text="Delete Gun";
            action=QUOTE(call FUNC(delete_gun));
        };
        class TEXT_GUN_LIST_NOTE: TEXT_GUN_LIST_OPEN_GUN {
            idc=6006;
            y=0.265*safezoneH+safezoneY+0.40;
            text="Note";
        };
        class TEXT_GUN_LIST_DONE: TEXT_GUN_LIST_OPEN_GUN {
            idc=6007;
            y=0.265*safezoneH+safezoneY+0.65;
            text="Done";
            action=QUOTE(false call FUNC(toggle_gun_list));
        };

        class TEXT_TARGET_RANGE_ASSIST_CAPTION: ATragMX_RscText {
            idc=7000;
            style=16+0x200;
            lineSpacing=1.0;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.24;
            w=0.29;
            h=0.10;
            sizeEx=0.022;
            text="When using WIDTH to size a target, UP/Down Angle does not effect range calculation but will effect bullet drop.";
        };
        class TEXT_TARGET_RANGE_ASSIST_MEASUREMENT_METHOD: TEXT_TARGET_RANGE_ASSIST_CAPTION {
            idc=7001;
            style=ST_LEFT;
            x=0.550*safezoneW+safezoneX+0.115;
            y=0.265*safezoneH+safezoneY+0.35;
            w=0.12;
            h=0.03;
            sizeEx=0.027;
            text="Using Target:";
        };
        class TEXT_TARGET_RANGE_ASSIST_WIDTH_HEIGHT: ATragMX_RscToolbox {
            idc=7002;
            w=0.14;
            x=0.550*safezoneW+safezoneX+0.24;
            y=0.265*safezoneH+safezoneY+0.35;
            strings[]={"Height","Width"};
            values[]={1,0};
            onToolBoxSelChanged=QUOTE(GVAR(rangeAssistUseTargetHeight) = ((_this select 1) == 0));
        };
        class TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE: TEXT_TARGET_RANGE_ASSIST_MEASUREMENT_METHOD {
            idc=7003;
            style=ST_RIGHT;
            x=0.550*safezoneW+safezoneX+0.092;
            y=0.265*safezoneH+safezoneY+0.4;
            w=0.128;
            text="Target Size";
        };
        class TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE {
            idc=7004;
            y=0.265*safezoneH+safezoneY+0.45;
            text="Image Size";
        };
        class TEXT_TARGET_RANGE_ASSIST_ANGLE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE {
            idc=7005;
            y=0.265*safezoneH+safezoneY+0.5;
            text="Angle";
        };
        class TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE {
            idc=7006;
            y=0.265*safezoneH+safezoneY+0.55;
            text="Est Range";
        };
        class TEXT_TARGET_RANGE_ASSIST_CALC_1: TEXT_MUZZLE_VELOCITY {
            idc=7007;
            w=0.0231;
            x=0.550*safezoneW+safezoneX+0.22;
            y=0.265*safezoneH+safezoneY+0.4;
            sizeEx=0.03;
            text="!";
            action=QUOTE(0 call FUNC(calculate_target_range_assist));
        };
        class TEXT_TARGET_RANGE_ASSIST_CALC_2: TEXT_TARGET_RANGE_ASSIST_CALC_1 {
            idc=7008;
            y=0.265*safezoneH+safezoneY+0.45;
            action=QUOTE(1 call FUNC(calculate_target_range_assist));
        };
        class TEXT_TARGET_RANGE_ASSIST_CALC_3: TEXT_TARGET_RANGE_ASSIST_CALC_1 {
            idc=7009;
            y=0.265*safezoneH+safezoneY+0.55;
            action=QUOTE(2 call FUNC(calculate_target_range_assist));
        };
        class TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT: ATragMX_RscEdit {
            idc=7010;
            w=0.065;
            x=0.550*safezoneW+safezoneX+0.2475;
            y=0.265*safezoneH+safezoneY+0.4;
        };
        class TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT {
            idc=7011;
            y=0.265*safezoneH+safezoneY+0.45;
        };
        class TEXT_TARGET_RANGE_ASSIST_ANGLE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT {
            idc=7012;
            y=0.265*safezoneH+safezoneY+0.5;
        };
        class TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT {
            idc=7013;
            y=0.265*safezoneH+safezoneY+0.55;
        };
        class TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_UNIT: TEXT_TARGET_RANGE_ASSIST_CALC_1 {
            idc=7014;
            w=0.07;
            x=0.550*safezoneW+safezoneX+0.32;
            text="cm";
            action=QUOTE(call FUNC(cycle_target_size_units));
        };
        class TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_UNIT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_UNIT {
            idc=7015;
            y=0.265*safezoneH+safezoneY+0.45;
            text="MIL";
            action=QUOTE(call FUNC(cycle_image_size_units));
        };
        class TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_UNIT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE {
            idc=7016;
            style=ST_LEFT;
            w=0.07;
            x=0.550*safezoneW+safezoneX+0.32;
            text="Meters";
        };
        class TEXT_TARGET_RANGE_ASSIST_DONE: ATragMX_RscButton {
            idc=7017;
            style=ST_CENTER;
            w=0.07;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.60;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="Done";
            action=QUOTE(1 call FUNC(toggle_target_range_assist));
        };
        class TEXT_TARGET_RANGE_ASSIST_CANCEL: TEXT_TARGET_RANGE_ASSIST_DONE {
            idc=7018;
            x=0.550*safezoneW+safezoneX+0.180625;
            text="Cancel";
            action=QUOTE(0 call FUNC(toggle_target_range_assist));
        };
        class TEXT_TARGET_RANGE_ASSIST_PREV: TEXT_TARGET_RANGE_ASSIST_DONE {
            idc=7019;
            x=0.550*safezoneW+safezoneX+0.25125;
            text="Prev";
            action="";
        };
        class TEXT_TARGET_RANGE_ASSIST_NEXT: TEXT_TARGET_RANGE_ASSIST_DONE {
            idc=7020;
            x=0.550*safezoneW+safezoneX+0.321875;
            text="Next";
            action="";
        };

        class TEXT_TARGET_SPEED_ASSIST_TARGET_RANGE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE {
            idc=8000;
            x=0.550*safezoneW+safezoneX+0.12;
            text="Target Range";
        };
        class TEXT_TARGET_SPEED_ASSIST_NUM_TICKS: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE {
            idc=8001;
            x=0.550*safezoneW+safezoneX+0.12;
            text="Num Ticks";
        };
        class TEXT_TARGET_SPEED_ASSIST_TIME: TEXT_TARGET_RANGE_ASSIST_ANGLE {
            idc=8002;
            x=0.550*safezoneW+safezoneX+0.12;
            text="Time (secs)";
        };
        class TEXT_TARGET_SPEED_ASSIST_TARGET_ESTIMATED_SPEED: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE {
            idc=8003;
            x=0.550*safezoneW+safezoneX+0.12;
            text="Est Speed";
        };
        class TEXT_TARGET_SPEED_ASSIST_TARGET_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT {
            idc=8004;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {call FUNC(calculate_target_speed_assist)});
        };
        class TEXT_TARGET_SPEED_ASSIST_NUM_TICKS_INPUT: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_INPUT {
            idc=8005;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {call FUNC(calculate_target_speed_assist)});
        };
        class TEXT_TARGET_SPEED_ASSIST_TIME_INPUT: TEXT_TARGET_RANGE_ASSIST_ANGLE_INPUT {
            idc=8006;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {call FUNC(calculate_target_speed_assist)});
        };
        class TEXT_TARGET_SPEED_ASSIST_TARGET_ESTIMATED_SPEED_OUTPUT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE {
            idc=8007;
            w=0.065;
            x=0.550*safezoneW+safezoneX+0.2475;
            y=0.265*safezoneH+safezoneY+0.55;
            colorBackground[]={0.15,0.21,0.23,0.3};
            text="0";
        };
        class TEXT_TARGET_SPEED_ASSIST_TARGET_RANGE_UNIT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_UNIT {
            idc=8008;
            y=0.265*safezoneH+safezoneY+0.4;
            text="Meters";
        };
        class TEXT_TARGET_SPEED_ASSIST_NUM_TICKS_UNIT: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_UNIT {
            idc=8009;
            text="MIL";
            action=QUOTE(call FUNC(cycle_num_ticks_units));
        };
        class TEXT_TARGET_SPEED_ASSIST_TIMER_START: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_UNIT {
            idc=8010;
            y=0.265*safezoneH+safezoneY+0.5;
            text="Start";
            action=QUOTE(call FUNC(target_speed_assist_timer));
        };
        class TEXT_TARGET_SPEED_ASSIST_TARGET_ESTIMATED_SPEED_UNIT: TEXT_TARGET_RANGE_ASSIST_ESTIMATED_RANGE_UNIT {
            idc=8011;
            text="m/s";
        };
        class TEXT_TARGET_SPEED_ASSIST_DONE: TEXT_TARGET_RANGE_ASSIST_DONE {
            idc=8012;
            action=QUOTE(1 call FUNC(toggle_target_speed_assist));
        };
        class TEXT_TARGET_SPEED_ASSIST_CANCEL: TEXT_TARGET_RANGE_ASSIST_CANCEL {
            idc=8013;
            action=QUOTE(0 call FUNC(toggle_target_speed_assist));
        };
        class TEXT_TARGET_SPEED_ASSIST_PREV: TEXT_TARGET_RANGE_ASSIST_PREV {
            idc=8014;
        };
        class TEXT_TARGET_SPEED_ASSIST_NEXT: TEXT_TARGET_RANGE_ASSIST_NEXT {
            idc=8015;
        };

        class TEXT_TARGET_SPEED_ASSIST_TIMER_STOP_BACKGROUND: ATragMX_RscButton {
            idc=9000;
            w=0.285;
            h=0.49;
            x=0.550*safezoneW+safezoneX+0.11;
            y=0.265*safezoneH+safezoneY+0.2;
            colorBackground[]={0,0,0,0};
            colorBackgroundActive[]={0,0,0,0};
            action=QUOTE(GVAR(speedAssistTimer)=false);
        };
        class TEXT_TARGET_SPEED_ASSIST_TIME_OUTPUT: ATragMX_RscText {
            idc=9001;
            x=0.550*safezoneW+safezoneX+0.22;
            y=0.265*safezoneH+safezoneY+0.51;
            w=0.08;
            h=0.09;
            style=ST_CENTER;
            sizeEx=0.05;
            text="0.0";
        };
        class TEXT_TARGET_SPEED_ASSIST_TIMER_STOP: ATragMX_RscButton {
            idc=9002;
            style=ST_CENTER;
            w=0.07;
            h=0.04;
            x=0.550*safezoneW+safezoneX+0.225;
            y=0.265*safezoneH+safezoneY+0.60;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="Stop";
            action=QUOTE(GVAR(speedAssistTimer)=false);
        };

        class TEXT_RANGE_CARD_SETUP_START_RANGE: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE {
            idc=10000;
            x=0.550*safezoneW+safezoneX+0.12;
            text="Start Range";
        };
        class TEXT_RANGE_CARD_SETUP_END_RANGE: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE {
            idc=10001;
            x=0.550*safezoneW+safezoneX+0.12;
            text="End Range";
        };
        class TEXT_RANGE_CARD_SETUP_INCREMENT: TEXT_TARGET_RANGE_ASSIST_ANGLE {
            idc=10002;
            x=0.550*safezoneW+safezoneX+0.12;
            text="Increment";
        };
        class TEXT_RANGE_CARD_SETUP_START_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_TARGET_SIZE_INPUT {
            idc=10003;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {1 call FUNC(toggle_range_card_setup)});
        };
        class TEXT_RANGE_CARD_SETUP_END_RANGE_INPUT: TEXT_TARGET_RANGE_ASSIST_IMAGE_SIZE_INPUT {
            idc=10004;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {1 call FUNC(toggle_range_card_setup)});
        };
        class TEXT_RANGE_CARD_SETUP_INCREMENT_INPUT: TEXT_TARGET_RANGE_ASSIST_ANGLE_INPUT {
            idc=10005;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {1 call FUNC(toggle_range_card_setup)});
        };
        class TEXT_RANGE_CARD_SETUP_DONE: TEXT_TARGET_SPEED_ASSIST_DONE {
            idc=10006;
            action=QUOTE(1 call FUNC(toggle_range_card_setup));
        };
        class TEXT_RANGE_CARD_SETUP_CANCEL: TEXT_TARGET_SPEED_ASSIST_CANCEL {
            idc=10007;
            action=QUOTE(0 call FUNC(toggle_range_card_setup));
        };
        class TEXT_RANGE_CARD_SETUP_PREV: TEXT_TARGET_SPEED_ASSIST_PREV {
            idc=10008;
        };
        class TEXT_RANGE_CARD_SETUP_NEXT: TEXT_TARGET_SPEED_ASSIST_NEXT {
            idc=10009;
        };

        class TEXT_ADD_NEW_GUN_CAPTION: ATragMX_RscText {
            idc=11000;
            style=ST_LEFT;
            w=0.25;
            h=0.04;
            x=0.550*safezoneW+safezoneX+0.12;
            y=0.265*safezoneH+safezoneY+0.24;
            sizeEx=0.025;
            text="New Gun Name";
        };
        class TEXT_ADD_NEW_GUN_GUN_NAME_INPUT: ATragMX_RscEdit {
            idc=11001;
            style=ST_LEFT;
            w=0.225;
            h=0.04;
            x=0.550*safezoneW+safezoneX+0.12;
            y=0.265*safezoneH+safezoneY+0.28;
            text="";
            onKeyDown=QUOTE(call FUNC(trim_gun_name));
            onKeyUp=QUOTE(call FUNC(trim_gun_name));
        };
        class TEXT_ADD_NEW_GUN_OK: ATragMX_RscButton {
            idc=11002;
            style=ST_CENTER;
            w=0.1;
            h=0.04;
            x=0.550*safezoneW+safezoneX+0.12;
            y=0.265*safezoneH+safezoneY+0.33;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            text="OK";
            action=QUOTE(call FUNC(add_new_gun); false call FUNC(show_add_new_gun); true call FUNC(show_gun_list));
        };
        class TEXT_ADD_NEW_GUN_CANCEL: TEXT_ADD_NEW_GUN_OK {
            idc=11003;
            x=0.550*safezoneW+safezoneX+0.245;
            text="Cancel";
            action=QUOTE(false call FUNC(show_add_new_gun); true call FUNC(show_gun_list));
        };

        class TEXT_GUN_AMMO_DATA_BORE_HEIGHT: TEXT_BORE_HEIGHT {
            idc=12000;
            w=0.22;
            y=0.265*safezoneH+safezoneY+0.28;
            text="Bore     (cm)";
        };
        class TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT: ATragMX_RscEdit {
            idc=120000;
            w=0.06;
            x=0.550*safezoneW+safezoneX+0.335;
            y=0.265*safezoneH+safezoneY+0.28;
        };
        class TEXT_GUN_AMMO_DATA_BULLET_MASS: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=12001;
            y=0.265*safezoneH+safezoneY+0.320;
            text="Bullet Weight    (grams)";
        };
        class TEXT_GUN_AMMO_DATA_BULLET_MASS_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=120010;
            y=0.265*safezoneH+safezoneY+0.320;
        };
        class TEXT_GUN_AMMO_DATA_BULLET_DIAMETER: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=12002;
            y=0.265*safezoneH+safezoneY+0.360;
            text="Bullet Diam  (cm)";
        };
        class TEXT_GUN_AMMO_DATA_BULLET_DIAMETER_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=120020;
            y=0.265*safezoneH+safezoneY+0.360;
        };
        class TEXT_GUN_AMMO_DATA_AIR_FRICTION: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=12003;
            y=0.265*safezoneH+safezoneY+0.400;
            text="C1 Coefficient";
        };
        class TEXT_GUN_AMMO_DATA_AIR_FRICTION_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=120030;
            y=0.265*safezoneH+safezoneY+0.400;
        };
        class TEXT_GUN_AMMO_DATA_RIFLE_TWIST: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=12004;
            y=0.265*safezoneH+safezoneY+0.440;
            text="Rifle Twist (cm/trn)";
        };
        class TEXT_GUN_AMMO_DATA_RIFLE_TWIST_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=120040;
            y=0.265*safezoneH+safezoneY+0.440;
        };
        class TEXT_GUN_AMMO_DATA_MUZZLE_VELOCITY: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=12005;
            y=0.265*safezoneH+safezoneY+0.480;
            text="Muzzle Velocity (m/s)";
        };
        class TEXT_GUN_AMMO_DATA_MUZZLE_VELOCITY_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=120050;
            y=0.265*safezoneH+safezoneY+0.480;
        };
        class TEXT_GUN_AMMO_DATA_ZERO_RANGE: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=12006;
            y=0.265*safezoneH+safezoneY+0.520;
            text="Zero Range   (meters)";
        };
        class TEXT_GUN_AMMO_DATA_ZERO_RANGE_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=120060;
            y=0.265*safezoneH+safezoneY+0.520;
        };
        class TEXT_GUN_AMMO_DATA_ZERO_RANGE_METER_INDICATOR: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=120061;
            w=0.05;
            x=0.550*safezoneW+safezoneX+0.315;
            y=0.265*safezoneH+safezoneY+0.520;
            text="";
        };
        class TEXT_GUN_AMMO_DATA_DONE: TEXT_TARGET_SPEED_ASSIST_DONE {
            idc=12008;
            action=QUOTE(1 call FUNC(toggle_gun_ammo_data));
        };
        class TEXT_GUN_AMMO_DATA_CANCEL: TEXT_TARGET_SPEED_ASSIST_CANCEL {
            idc=12009;
            action=QUOTE(0 call FUNC(toggle_gun_ammo_data));
        };
        class TEXT_GUN_AMMO_DATA_PREV: TEXT_TARGET_SPEED_ASSIST_PREV {
            idc=12010;
        };
        class TEXT_GUN_AMMO_DATA_NEXT: TEXT_TARGET_SPEED_ASSIST_NEXT {
            idc=12011;
        };

        class TEXT_ATMO_ENV_DATA_DEFAULT: TEXT_LEAD {
            idc=13000;
            w=0.08;
            x=0.550*safezoneW+safezoneX+0.15;
            y=0.265*safezoneH+safezoneY+0.320;
            text="Default";
            action=QUOTE(call FUNC(restore_atmo_default));
        };
        class TEXT_ATMO_ENV_DATA_AT: TEXT_TARGET_A {
            idc=13001;
            w=0.04;
            x=0.550*safezoneW+safezoneX+0.24;
            y=0.265*safezoneH+safezoneY+0.320;
            text="AT";
            action=QUOTE(GVAR(atmosphereModeTBH) = false; call FUNC(update_atmo_selection));
        };
        class TEXT_ATMO_ENV_DATA_TBH: TEXT_ATMO_ENV_DATA_AT {
            idc=13002;
            x=0.550*safezoneW+safezoneX+0.28;
            text="TBH";
            action=QUOTE(GVAR(atmosphereModeTBH) = true; call FUNC(update_atmo_selection));
        };
        class TEXT_ATMO_ENV_DATA_ALTITUDE: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=13003;
            x=0.550*safezoneW+safezoneX+0.115;
            y=0.265*safezoneH+safezoneY+0.400;
            text="Altitude (ft)";
        };
        class TEXT_ATMO_ENV_DATA_ALTITUDE_INPUT: TEXT_GUN_AMMO_DATA_BORE_HEIGHT_INPUT {
            idc=130030;
            x=0.550*safezoneW+safezoneX+0.330;
            y=0.265*safezoneH+safezoneY+0.400;
        };
        class TEXT_ATMO_ENV_DATA_TEMPERATURE: TEXT_ATMO_ENV_DATA_ALTITUDE {
            idc=13004;
            y=0.265*safezoneH+safezoneY+0.440;
            text="temperature (F)";
        };
        class TEXT_ATMO_ENV_DATA_TEMPERATURE_INPUT: TEXT_ATMO_ENV_DATA_ALTITUDE_INPUT {
            idc=130040;
            y=0.265*safezoneH+safezoneY+0.440;
        };
        class TEXT_ATMO_ENV_DATA_BAROMETRIC_PRESSURE: TEXT_ATMO_ENV_DATA_ALTITUDE {
            idc=13005;
            y=0.265*safezoneH+safezoneY+0.480;
            text="Barom Pres (in.merc.)";
        };
        class TEXT_ATMO_ENV_DATA_BAROMETRIC_PRESSURE_INPUT: TEXT_ATMO_ENV_DATA_ALTITUDE_INPUT {
            idc=130050;
            y=0.265*safezoneH+safezoneY+0.480;
        };
        class TEXT_ATMO_ENV_DATA_RELATIVE_HUMIDITY: TEXT_ATMO_ENV_DATA_ALTITUDE {
            idc=13006;
            y=0.265*safezoneH+safezoneY+0.520;
            text="Relative Humidity (%)";
        };
        class TEXT_ATMO_ENV_DATA_RELATIVE_HUMIDITY_INPUT: TEXT_ATMO_ENV_DATA_ALTITUDE_INPUT {
            idc=130060;
            y=0.265*safezoneH+safezoneY+0.520;
        };
        class TEXT_ATMO_ENV_DATA_DONE: TEXT_TARGET_SPEED_ASSIST_DONE {
            idc=13007;
            action=QUOTE(1 call FUNC(toggle_atmo_env_data));
        };
        class TEXT_ATMO_ENV_DATA_CANCEL: TEXT_TARGET_SPEED_ASSIST_CANCEL {
            idc=13008;
            action=QUOTE(0 call FUNC(toggle_atmo_env_data));
        };
        class TEXT_ATMO_ENV_DATA_PREV: TEXT_TARGET_SPEED_ASSIST_PREV {
            idc=13009;
        };
        class TEXT_ATMO_ENV_DATA_NEXT: TEXT_TARGET_SPEED_ASSIST_NEXT {
            idc=13010;
        };
        class TEXT_ATMO_ENV_DATA_CALC_METHOD: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=13011;
            style=64;
            w=0.14;
            h=0.07;
            x=0.550*safezoneW+safezoneX+0.235;
            y=0.265*safezoneH+safezoneY+0.29;
            text="Calc Method";
        };

        class TEXT_TARGET_DATA_LATITUDE: TEXT_BORE_HEIGHT {
            idc=14000;
            w=0.22;
            y=0.265*safezoneH+safezoneY+0.28;
            text="Latitude";
        };
        class TEXT_TARGET_DATA_LATITUDE_INPUT: ATragMX_RscEdit {
            idc=140000;
            w=0.06;
            x=0.550*safezoneW+safezoneX+0.335;
            y=0.265*safezoneH+safezoneY+0.28;
        };
        class TEXT_TARGET_DATA_DIR_OF_FIRE: TEXT_TARGET_DATA_LATITUDE {
            idc=14001;
            y=0.265*safezoneH+safezoneY+0.320;
            text="Dir of Fire (deg from N)";
        };
        class TEXT_TARGET_DATA_DIR_OF_FIRE_INPUT: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140010;
            y=0.265*safezoneH+safezoneY+0.320;
        };
        class TEXT_TARGET_DATA_WIND_SPEED: TEXT_TARGET_DATA_LATITUDE {
            idc=14002;
            w=1.2;
            y=0.265*safezoneH+safezoneY+0.360;
            text="Wind Speed (m/s)";
        };
        class TEXT_TARGET_DATA_WIND_SPEED_1: TEXT_TARGET_DATA_LATITUDE {
            idc=141020;
            colorText[]={0,0,0,0.6};
            w=0.05;
            h=0.03;
            sizeEx=0.025;
            x=0.550*safezoneW+safezoneX+0.270;
            y=0.265*safezoneH+safezoneY+0.357;
            text="1";
        };
        class TEXT_TARGET_DATA_WIND_SPEED_INPUT_1: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140020;
            w=0.045;
            x=0.550*safezoneW+safezoneX+0.290;
            y=0.265*safezoneH+safezoneY+0.360;
        };
        class TEXT_TARGET_DATA_WIND_SPEED_2: TEXT_TARGET_DATA_WIND_SPEED_1 {
            idc=141021;
            x=0.550*safezoneW+safezoneX+0.330;
            text="2";
        };
        class TEXT_TARGET_DATA_WIND_SPEED_INPUT_2: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140021;
            w=0.045;
            x=0.550*safezoneW+safezoneX+0.350;
            y=0.265*safezoneH+safezoneY+0.360;
        };
        class TEXT_TARGET_DATA_WIND_DIRECTION: TEXT_TARGET_DATA_LATITUDE {
            idc=14003;
            y=0.265*safezoneH+safezoneY+0.400;
            text="Wind Direction (clock)";
        };
        class TEXT_TARGET_DATA_WIND_DIRECTION_INPUT: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140030;
            y=0.265*safezoneH+safezoneY+0.400;
        };
        class TEXT_TARGET_DATA_INCLINATION_ANGLE: TEXT_TARGET_DATA_LATITUDE {
            idc=14004;
            w=1.2;
            y=0.265*safezoneH+safezoneY+0.440;
            text="Inclination Angle";
        };
        class TEXT_TARGET_DATA_INCLINATION_ANGLE_COSINE: TEXT_TARGET_DATA_LATITUDE {
            idc=141041;
            colorText[]={0,0,0,0.6};
            w=0.05;
            h=0.03;
            sizeEx=0.025;
            x=0.550*safezoneW+safezoneX+0.270;
            y=0.265*safezoneH+safezoneY+0.437;
            text="c";
        };
        class TEXT_TARGET_DATA_INCLINATION_ANGLE_INPUT_COSINE: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140041;
            w=0.045;
            x=0.550*safezoneW+safezoneX+0.290;
            y=0.265*safezoneH+safezoneY+0.440;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {0 call FUNC(update_inclination_angle)});
        };
        class TEXT_TARGET_DATA_INCLINATION_ANGLE_DEGREE: TEXT_TARGET_DATA_INCLINATION_ANGLE_COSINE {
            idc=141040;
            x=0.550*safezoneW+safezoneX+0.330;
            text="d";
        };
        class TEXT_TARGET_DATA_INCLINATION_ANGLE_INPUT_DEGREE: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140040;
            w=0.045;
            x=0.550*safezoneW+safezoneX+0.350;
            y=0.265*safezoneH+safezoneY+0.440;
            onKeyUp=QUOTE(if (_this select 1 == 28) then {1 call FUNC(update_inclination_angle)});
        };
        class TEXT_TARGET_DATA_TARGET_SPEED: TEXT_TARGET_DATA_LATITUDE {
            idc=14005;
            y=0.265*safezoneH+safezoneY+0.480;
            text="Target Speed (m/s)";
        };
        class TEXT_TARGET_DATA_TARGET_SPEED_INPUT: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140050;
            y=0.265*safezoneH+safezoneY+0.480;
        };
        class TEXT_TARGET_DATA_TARGET_SPEED_DIRECTION: ATragMX_RscButton {
            idc=140051;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorFocused[]={0.15,0.21,0.23,0.2};
            w=0.0231;
            x=0.550*safezoneW+safezoneX+0.305;
            y=0.265*safezoneH+safezoneY+0.480;
            text=">";
            action=QUOTE(call FUNC(cycle_target_speed_direction));
        };
        class TEXT_TARGET_DATA_TARGET_RANGE: TEXT_TARGET_DATA_LATITUDE {
            idc=14006;
            y=0.265*safezoneH+safezoneY+0.520;
            text="Target Range (meters)";
        };
        class TEXT_TARGET_DATA_TARGET_RANGE_INPUT: TEXT_TARGET_DATA_LATITUDE_INPUT {
            idc=140060;
            y=0.265*safezoneH+safezoneY+0.520;
        };
        class TEXT_TARGET_DATA_TARGET_RANGE_METER_INDICATOR: TEXT_TARGET_DATA_LATITUDE {
            idc=140061;
            w=0.05;
            x=0.550*safezoneW+safezoneX+0.315;
            y=0.265*safezoneH+safezoneY+0.520;
            text="";
        };
        class TEXT_TARGET_DATA_DONE: TEXT_TARGET_SPEED_ASSIST_DONE {
            idc=14008;
            action=QUOTE(1 call FUNC(toggle_target_data));
        };
        class TEXT_TARGET_DATA_CANCEL: TEXT_TARGET_SPEED_ASSIST_CANCEL {
            idc=14009;
            action=QUOTE(0 call FUNC(toggle_target_data));
        };
        class TEXT_TARGET_DATA_PREV: TEXT_TARGET_SPEED_ASSIST_PREV {
            idc=14010;
        };
        class TEXT_TARGET_DATA_NEXT: TEXT_TARGET_SPEED_ASSIST_NEXT {
            idc=14011;
        };

        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=15000;
            style=64;
            w=0.25;
            h=0.07;
            x=0.550*safezoneW+safezoneX+0.13;
            y=0.265*safezoneH+safezoneY+0.32;
            text="Show result in";
        };
        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_1: TEXT_TARGET_A {
            idc=15001;
            w=0.04;
            x=0.550*safezoneW+safezoneX+0.14;
            y=0.265*safezoneH+safezoneY+0.35;
            text="1";
            action=QUOTE(GVAR(currentScopeClickNumberTemp) = 1; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_2: TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_1 {
            idc=15002;
            x=0.550*safezoneW+safezoneX+0.18;
            text="2";
            action=QUOTE(GVAR(currentScopeClickNumberTemp) = 2; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_3: TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_1 {
            idc=15003;
            x=0.550*safezoneW+safezoneX+0.22;
            text="3";
            action=QUOTE(GVAR(currentScopeClickNumberTemp) = 3; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_4: TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_1 {
            idc=15004;
            x=0.550*safezoneW+safezoneX+0.26;
            text="4";
            action=QUOTE(GVAR(currentScopeClickNumberTemp) = 4; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_8: TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_1 {
            idc=15005;
            x=0.550*safezoneW+safezoneX+0.30;
            text="8";
            action=QUOTE(GVAR(currentScopeClickNumberTemp) = 8; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_10: TEXT_SOLUTION_SETUP_SHOW_RESULT_IN_1 {
            idc=15006;
            x=0.550*safezoneW+safezoneX+0.34;
            text="10";
            action=QUOTE(GVAR(currentScopeClickNumberTemp) = 10; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_CLICKS_PER: TEXT_GUN_AMMO_DATA_BORE_HEIGHT {
            idc=15007;
            style=64;
            w=0.25;
            h=0.07;
            x=0.550*safezoneW+safezoneX+0.13;
            y=0.265*safezoneH+safezoneY+0.42;
            text="Clicks per";
        };
        class TEXT_SOLUTION_SETUP_CLICKS_PER_TMOA: TEXT_TARGET_A {
            idc=15008;
            w=0.05;
            x=0.550*safezoneW+safezoneX+0.15;
            y=0.265*safezoneH+safezoneY+0.45;
            text="TMOA";
            action=QUOTE(GVAR(currentScopeClickUnitTemp) = 0; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_CLICKS_PER_SMOA: TEXT_SOLUTION_SETUP_CLICKS_PER_TMOA {
            idc=15009;
            x=0.550*safezoneW+safezoneX+0.23;
            text="SMOA";
            action=QUOTE(GVAR(currentScopeClickUnitTemp) = 1; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_CLICKS_PER_MILS: TEXT_SOLUTION_SETUP_CLICKS_PER_TMOA {
            idc=15010;
            x=0.550*safezoneW+safezoneX+0.31;
            text="MILS";
            action=QUOTE(GVAR(currentScopeClickUnitTemp) = 2; call FUNC(update_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_DONE: TEXT_TARGET_SPEED_ASSIST_DONE {
            idc=15011;
            x=0.550*safezoneW+safezoneX+0.18;
            y=0.265*safezoneH+safezoneY+0.55;
            action=QUOTE(1 call FUNC(toggle_solution_setup));
        };
        class TEXT_SOLUTION_SETUP_CANCEL: TEXT_TARGET_SPEED_ASSIST_CANCEL {
            idc=15012;
            x=0.550*safezoneW+safezoneX+0.26;
            y=0.265*safezoneH+safezoneY+0.55;
            action=QUOTE(0 call FUNC(toggle_solution_setup));
        };

        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE: TEXT_BORE_HEIGHT {
            idc=16000;
            w=0.22;
            y=0.265*safezoneH+safezoneY+0.25;
            sizeEx=0.022;
            text="Temperature";
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE {
            idc=16001;
            x=0.550*safezoneW+safezoneX+0.215;
            sizeEx=0.022;
            text="Muzzle velocity";
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1: ATragMX_RscEdit {
            idc=160021;
            w=0.082;
            h=0.035;
            x=0.550*safezoneW+safezoneX+0.128;
            y=0.265*safezoneH+safezoneY+0.29;
            text="0";
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_2: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160022;
            y=0.265*safezoneH+safezoneY+0.325;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_3: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160023;
            y=0.265*safezoneH+safezoneY+0.360;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_4: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160024;
            y=0.265*safezoneH+safezoneY+0.395;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_5: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160025;
            y=0.265*safezoneH+safezoneY+0.430;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_6: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160026;
            y=0.265*safezoneH+safezoneY+0.465;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_7: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160027;
            y=0.265*safezoneH+safezoneY+0.500;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_1: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_1 {
            idc=160031;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_2: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_2 {
            idc=160032;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_3: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_3 {
            idc=160033;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_4: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_4 {
            idc=160034;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_5: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_5 {
            idc=160035;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_6: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_6 {
            idc=160036;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_MUZZLE_VELOCITY_INPUT_7: TEXT_MUZZLE_VELOCITY_DATA_TEMPERATURE_INPUT_7 {
            idc=160037;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_CLEAR: TEXT_TARGET_DATA_NEXT {
            idc=16004;
            style=ST_CENTER;
            h=0.035;
            y=0.265*safezoneH+safezoneY+0.3625;
            text="Clear";
            action=QUOTE(call FUNC(clear_muzzle_velocity_data));
        };
        class TEXT_MUZZLE_VELOCITY_DATA_QUESTIONMARK: TEXT_MUZZLE_VELOCITY_DATA_CLEAR {
            idc=16005;
            y=0.265*safezoneH+safezoneY+0.430;
            text="?";
            action="";
        };
        class TEXT_MUZZLE_VELOCITY_DATA_DONE: TEXT_TARGET_DATA_DONE {
            idc=16006;
            action=QUOTE(1 call FUNC(toggle_muzzle_velocity_data));
        };
        class TEXT_MUZZLE_VELOCITY_DATA_CANCEL: TEXT_TARGET_DATA_CANCEL {
            idc=16007;
            action=QUOTE(0 call FUNC(toggle_muzzle_velocity_data));
        };
        class TEXT_MUZZLE_VELOCITY_DATA_PREV: TEXT_TARGET_DATA_PREV {
            idc=16008;
        };
        class TEXT_MUZZLE_VELOCITY_DATA_NEXT: TEXT_TARGET_DATA_NEXT {
            idc=16009;
        };

        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE: TEXT_BORE_HEIGHT {
            idc=17000;
            w=0.22;
            x=0.550*safezoneW+safezoneX+0.15;
            y=0.265*safezoneH+safezoneY+0.25;
            sizeEx=0.022;
            text="Meters";
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE {
            idc=17001;
            x=0.550*safezoneW+safezoneX+0.235;
            sizeEx=0.022;
            text="BC-Coef";
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1: ATragMX_RscEdit {
            idc=170021;
            w=0.082;
            h=0.035;
            x=0.550*safezoneW+safezoneX+0.128;
            y=0.265*safezoneH+safezoneY+0.29;
            text="0";
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_2: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170022;
            y=0.265*safezoneH+safezoneY+0.325;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_3: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170023;
            y=0.265*safezoneH+safezoneY+0.360;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_4: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170024;
            y=0.265*safezoneH+safezoneY+0.395;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_5: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170025;
            y=0.265*safezoneH+safezoneY+0.430;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_6: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170026;
            y=0.265*safezoneH+safezoneY+0.465;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_7: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170027;
            y=0.265*safezoneH+safezoneY+0.500;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_1: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_1 {
            idc=170031;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_2: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_2 {
            idc=170032;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_3: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_3 {
            idc=170033;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_4: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_4 {
            idc=170034;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_5: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_5 {
            idc=170035;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_6: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_6 {
            idc=170036;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_C1_BALLISTIC_COEFFICIENT_INPUT_7: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DISTANCE_INPUT_7 {
            idc=170037;
            x=0.550*safezoneW+safezoneX+0.225;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_QUESTIONMARK: TEXT_TARGET_DATA_NEXT {
            idc=17004;
            style=ST_CENTER;
            w=0.04;
            h=0.035;
            y=0.265*safezoneH+safezoneY+0.35;
            text="?";
            action="";
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_CLEAR: TEXT_C1_BALLISTIC_COEFFICIENT_DATA_QUESTIONMARK {
            idc=17005;
            w=0.07;
            y=0.265*safezoneH+safezoneY+0.4175;
            text="Clear";
            action=QUOTE(call FUNC(clear_c1_ballistic_coefficient_data));
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_DONE: TEXT_TARGET_DATA_DONE {
            idc=17006;
            action=QUOTE(1 call FUNC(toggle_c1_ballistic_coefficient_data));
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_CANCEL: TEXT_TARGET_DATA_CANCEL {
            idc=17007;
            action=QUOTE(0 call FUNC(toggle_c1_ballistic_coefficient_data));
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_PREV: TEXT_TARGET_DATA_PREV {
            idc=17008;
        };
        class TEXT_C1_BALLISTIC_COEFFICIENT_DATA_NEXT: TEXT_TARGET_DATA_NEXT {
            idc=17009;
        };

        class TEXT_TRUING_DROP_ZERO_RANGE: ATragMX_RscText {
            idc=18000;
            style=ST_LEFT;
            x=0.550*safezoneW+safezoneX+0.115;
            y=0.265*safezoneH+safezoneY+0.220;
            w=0.135;
            h=0.03;
            sizeEx=0.025;
            text="ZR=100meters";
        };
        class TEXT_TRUING_DROP_DROP_UNIT: TEXT_TRUING_DROP_ZERO_RANGE {
            idc=18001;
            style=ST_LEFT;
            x=0.550*safezoneW+safezoneX+0.25;
            text="Drop=mil";
        };
        class TEXT_TRUING_DROP_TARGET_RANGE: TEXT_TRUING_DROP_ZERO_RANGE {
            idc=18002;
            y=0.265*safezoneH+safezoneY+0.35;
            sizeEx=0.027;
            text="Target Range";
        };
        class TEXT_TRUING_DROP_DROP: TEXT_TRUING_DROP_TARGET_RANGE {
            idc=18003;
            w=0.07;
            y=0.265*safezoneH+safezoneY+0.40;
            text="Drop";
        };
        class TEXT_TRUING_DROP_MUZZLE_VELOCITY: TEXT_TRUING_DROP_DROP {
            idc=18004;
            y=0.265*safezoneH+safezoneY+0.50;
            text="MV";
        };
        class TEXT_TRUING_DROP_C1_BALLISTIC_COEFFICIENT: TEXT_TRUING_DROP_DROP {
            idc=18005;
            y=0.265*safezoneH+safezoneY+0.55;
            text="C1";
        };
        class TEXT_TRUING_DROP_DROP_OUTPUT: ATragMX_RscEdit {
            idc=18006;
            style=ST_WITH_RECT+ST_RIGHT;
            colorBackground[]={0.15,0.21,0.23,0.3};
            colorDisabled[]={0,0,0,1};
            w=0.06;
            y=0.265*safezoneH+safezoneY+0.40;
            x=0.550*safezoneW+safezoneX+0.17;
            text="";
        };
        class TEXT_TRUING_DROP_MUZZLE_VELOCITY_OUTPUT: TEXT_TRUING_DROP_DROP_OUTPUT {
            idc=18007;
            y=0.265*safezoneH+safezoneY+0.50;
            text="";
        };
        class TEXT_TRUING_DROP_C1_BALLISTIC_COEFFICIENT_OUTPUT: TEXT_TRUING_DROP_DROP_OUTPUT {
            idc=18008;
            y=0.265*safezoneH+safezoneY+0.55;
            text="";
        };
        class TEXT_TRUING_DROP_SUPER: TEXT_TARGET_A {
            idc=18009;
            w=0.06;
            x=0.550*safezoneW+safezoneX+0.25;
            y=0.265*safezoneH+safezoneY+0.30;
            text="SUPER";
            action=QUOTE(GVAR(truingDropMode) = 0; call FUNC(update_truing_drop_selection));
        };
        class TEXT_TRUING_DROP_SUB: TEXT_TRUING_DROP_SUPER {
            idc=18010;
            x=0.550*safezoneW+safezoneX+0.32;
            text="SUB";
            action=QUOTE(GVAR(truingDropMode) = 1; call FUNC(update_truing_drop_selection));
        };
        class TEXT_TRUING_DROP_TARGET_RANGE_SUPER_INPUT: ATragMX_RscEdit {
            idc=18011;
            style=ST_WITH_RECT+ST_RIGHT;
            colorDisabled[]={0,0,0,0.6};
            w=0.06;
            x=0.550*safezoneW+safezoneX+0.25;
            y=0.265*safezoneH+safezoneY+0.35;
        };
        class TEXT_TRUING_DROP_TARGET_RANGE_SUB_INPUT: TEXT_TRUING_DROP_TARGET_RANGE_SUPER_INPUT {
            idc=18012;
            x=0.550*safezoneW+safezoneX+0.32;
        };
        class TEXT_TRUING_DROP_DROP_SUPER_INPUT: TEXT_TRUING_DROP_TARGET_RANGE_SUPER_INPUT {
            idc=18013;
            y=0.265*safezoneH+safezoneY+0.40;
        };
        class TEXT_TRUING_DROP_DROP_SUB_INPUT: TEXT_TRUING_DROP_TARGET_RANGE_SUB_INPUT {
            idc=18014;
            y=0.265*safezoneH+safezoneY+0.40;
        };
        class TEXT_TRUING_DROP_CALC: TEXT_GUN_LIST {
            idc=18015;
            style=ST_CENTER;
            w=0.11;
            x=0.550*safezoneW+safezoneX+0.26;
            y=0.265*safezoneH+safezoneY+0.45;
            text="Calc";
            action=QUOTE(true call FUNC(calculate_truing_drop));
        };
        class TEXT_TRUING_DROP_MV_INPUT: TEXT_TRUING_DROP_TARGET_RANGE_SUPER_INPUT {
            idc=18016;
            y=0.265*safezoneH+safezoneY+0.50;
        };
        class TEXT_TRUING_DROP_C1_BALLISTIC_COEFFICIENT_INPUT: TEXT_TRUING_DROP_TARGET_RANGE_SUB_INPUT {
            idc=18017;
            y=0.265*safezoneH+safezoneY+0.55;
        };
        class TEXT_TRUING_DROP_ACCEPT: TEXT_GUN_LIST {
            idc=18018;
            w=0.085;
            h=0.04;
            x=0.550*safezoneW+safezoneX+0.125;
            y=0.265*safezoneH+safezoneY+0.60;
            text="Accept";
            action=QUOTE(1 call FUNC(toggle_truing_drop));
        };
        class TEXT_TRUING_DROP_CANCEL: TEXT_TRUING_DROP_ACCEPT {
            idc=18019;
            x=0.550*safezoneW+safezoneX+0.210;
            text="Cancel";
            action=QUOTE(0 call FUNC(toggle_truing_drop));
        };
        class TEXT_TRUING_DROP_RESTORE: TEXT_TRUING_DROP_CANCEL {
            idc=18020;
            x=0.550*safezoneW+safezoneX+0.29525;
            text="Restore";
            action=QUOTE(true call FUNC(restore_truing_drop));
        };
    };
};
