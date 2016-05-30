#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

class Kestrel4500_RscText {
    idc=-1;
    type=0;
    style=ST_CENTER;
    colorDisabled[]={0,0,0,0};
    colorBackground[]={0,0,0,0};
    colorText[]={0,0,0,1};
    text="";
    x=0;
    y=0;
    w=0.1;
    h=0.03;
    font="TahomaB";
    sizeEx=0.04;
    shadow=0;
};
class Kestrel4500_RscButton {
    text="";
    colorText[]={0,0,0,1};
    colorDisabled[]={0,0,0,0};
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
    w=0.10;
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
class Kestrel4500_Display {
    name="Kestrel4500_Display";
    idd=-1;
    onLoad="uiNamespace setVariable ['Kestrel4500_Display', (_this select 0)]";
    onUnload=QUOTE(_this call FUNC(onCloseDialog));
    movingEnable=1;
    controlsBackground[]={};
    objects[]={};
    class controls {
        #define DIALOG_SAFE_Y(num) QUOTE((safeZoneY + num) min (safeZoneY + safeZoneH - 1.024*4/3 + num))
        class BACKGROUND {
            moving=1;
            type=0;
            font="TahomaB";
            SizeEX=0.025;
            idc=74000;
            style=48;
            x=safezoneX;
            y = DIALOG_SAFE_Y(0);
            w=1.024;
            h=1.024*4/3;
            colorBackground[]={1,1,1,1};
            colorText[]={1,1,1,1};
            text=PATHTOF(UI\Kestrel4500.paa);
        };
        class POWER: Kestrel4500_RscButton {
            idc=-1;
            x=safezoneX+0.385;
            y = DIALOG_SAFE_Y(1.125);
            w=0.042;
            h=0.042*4/3;
            action=QUOTE(7 call FUNC(buttonPressed));
            onMouseButtonDown = "playSound 'kestrel4500_exit_button_click'";
        };
        class ENTER: POWER {
            idc=-1;
            x=safezoneX+0.46;
            y = DIALOG_SAFE_Y(1.0);
            w=0.1;
            action=QUOTE(0 call FUNC(buttonPressed));
            onMouseButtonDown = "playSound 'kestrel4500_center_button_click'";
        };
        class TOP: Kestrel4500_RscButton {
            idc=-1;
            x=safezoneX+0.46;
            y = DIALOG_SAFE_Y(0.93);
            w=0.1;
            h=0.03;
            action=QUOTE(1 call FUNC(buttonPressed));
            onMouseButtonDown = "playSound 'kestrel4500_top_button_click'";
        };
        class BOTTOM: TOP {
            idc=-1;
            y = DIALOG_SAFE_Y(1.1);
            action=QUOTE(2 call FUNC(buttonPressed));
            onMouseButtonDown = "playSound 'kestrel4500_bottom_button_click'";
        };
        class LEFT: Kestrel4500_RscButton {
            idc=-1;
            x=safezoneX+0.4;
            y = DIALOG_SAFE_Y(0.97);
            w=0.046;
            h=0.11;
            action=QUOTE(3 call FUNC(buttonPressed));
            onMouseButtonDown = "playSound 'kestrel4500_left_button_click'";
        };
        class RIGHT: LEFT {
            idc=-1;
            x=safezoneX+0.58;
            action=QUOTE(4 call FUNC(buttonPressed));
            onMouseButtonDown = "playSound 'kestrel4500_right_button_click'";
        };
        class MEMORY: Kestrel4500_RscButton {
            idc=-1;
            x=safezoneX+0.395;
            y = DIALOG_SAFE_Y(0.87);
            w=0.05;
            h=0.045*4/3;
            action=QUOTE(5 call FUNC(buttonPressed));
        };
        class BACKLIGHT: MEMORY {
            idc=-1;
            x=safezoneX+0.585;
            action=QUOTE(6 call FUNC(buttonPressed));
        };

        class TEXT_TOP: Kestrel4500_RscText {
            idc=74100;
            x=safezoneX+0.40;
            y = DIALOG_SAFE_Y(0.58);
            w=0.22;
            h=0.04;
            text="";
        };
        class TEXT_CENTER_BIG: TEXT_TOP {
            idc=74200;
            y = DIALOG_SAFE_Y(0.61);
            h=0.10;
            SizeEx=0.06;
        };
        class TEXT_CENTER: TEXT_TOP {
            idc=74201;
            y = DIALOG_SAFE_Y(0.64);
        };
        class TEXT_CENTER_LINE_1_LEFT: TEXT_TOP {
            idc=74300;
            y = DIALOG_SAFE_Y(0.60);
            style=ST_LEFT;
            h=0.10;
            SizeEx=0.05;
        };
        class TEXT_CENTER_LINE2_LEFT: TEXT_CENTER_LINE_1_LEFT {
            idc=74301;
            y = DIALOG_SAFE_Y(0.64);
        };
        class TEXT_CENTER_LINE_3_LEFT: TEXT_CENTER_LINE2_LEFT {
            idc=74302;
            y = DIALOG_SAFE_Y(0.68);
        };
        class TEXT_CENTER_LINE_1_RIGHT: TEXT_CENTER_LINE_1_LEFT {
            idc=74303;
            style=ST_RIGHT;
        };
        class TEXT_CENTER_LINE2_RIGHT: TEXT_CENTER_LINE2_LEFT {
            idc=74304;
            style=ST_RIGHT;
        };
        class TEXT_CENTER_LINE_3_RIGHT: TEXT_CENTER_LINE_3_LEFT {
            idc=74305;
            style=ST_RIGHT;
        };
        class TEXT_INFO_LINE_1: TEXT_TOP {
            idc=74400;
            y = DIALOG_SAFE_Y(0.68);
        };
        class TEXT_INFO_LINE_2: TEXT_TOP {
            idc=74401;
            y = DIALOG_SAFE_Y(0.72);
        };
        class TEXT_BOTTOM_BIG: TEXT_TOP {
            idc=74500;
            y = DIALOG_SAFE_Y(0.67);
            h=0.10;
            SizeEx=0.06;
        };
        class TEXT_CENTER_LINE_1: TEXT_TOP {
            idc=74600;
            y = DIALOG_SAFE_Y(0.58);
            SizeEx=0.03;
        };
        class TEXT_CENTER_LINE_2: TEXT_CENTER_LINE_1 {
            idc=74601;
            y = DIALOG_SAFE_Y(0.61);
        };
        class TEXT_CENTER_LINE_3: TEXT_CENTER_LINE_1 {
            idc=74602;
            y = DIALOG_SAFE_Y(0.64);
        };
        class TEXT_CENTER_LINE_4: TEXT_CENTER_LINE_1 {
            idc=74603;
            y = DIALOG_SAFE_Y(0.67);
        };
        class TEXT_CENTER_LINE_5: TEXT_CENTER_LINE_1 {
            idc=74604;
            y = DIALOG_SAFE_Y(0.70);
        };
        class TEXT_CENTER_LINE_6: TEXT_CENTER_LINE_1 {
            idc=74605;
            y = DIALOG_SAFE_Y(0.73);
        };
    };
};
class RscTitles {
    class RscKestrel4500 {
        idd=-1;
        onLoad="with uiNameSpace do { RscKestrel4500 = _this select 0 };";
        onUnload=(_this call FUNC(onCloseDisplay));
        movingEnable=0;
        duration=60;
        fadeIn="false";
        fadeOut="false";
        class controls {
            #define DISPLAY_SAFE_Y(num) QUOTE((safeZoneY + 0.7 + num) min (safeZoneY + safeZoneH - 1.024*4/3*0.75 + num))
            class RscKestrel4500 {
                idc=75000;
                moving=0;
                type=0;
                font="TahomaB";
                SizeEX=0.025*0.75;
                style=48;
                x=safezoneX+0.14;
                y = DISPLAY_SAFE_Y(0);
                w=0.512*0.75;
                h=1.024*4/3*0.75;
                colorBackground[]={1,1,1,1};
                colorText[]={1,1,1,1};
                text=PATHTOF(UI\Kestrel4500_0.paa);
            };
            class RscTextTop: Kestrel4500_RscText {
                idc=75100;
                x=safezoneX-0.05+0.40*0.75;
                y = DISPLAY_SAFE_Y(0.58*0.75);
                w=0.22*0.75;
                h=0.04*0.75;
                SizeEx=0.04*0.75;
                text="";
            };
            class RscTextCenterBig: RscTextTop {
                idc=75200;
                y = DISPLAY_SAFE_Y(0.61*0.75);
                h=0.10*0.75;
                SizeEx=0.06*0.75;
                text="";
            };
            class RscTextCenter: RscTextTop {
                idc=75201;
                y = DISPLAY_SAFE_Y(0.64*0.75);
            };
            class RscTextCenterLine1Left: RscTextTop {
                idc=75300;
                y = DISPLAY_SAFE_Y(0.60*0.75);
                style=ST_LEFT;
                h=0.10*0.75;
                SizeEx=0.05*0.75;
                text="";
            };
            class RscTextCenterLine2Left: RscTextCenterLine1Left {
                idc=75301;
                y = DISPLAY_SAFE_Y(0.64*0.75);
                text="";
            };
            class RscTextCenterLine3Left: RscTextCenterLine2Left {
                idc=75302;
                y = DISPLAY_SAFE_Y(0.68*0.75);
                text="";
            };
            class RscTextCenterLine1Right: RscTextCenterLine1Left {
                idc=75303;
                style=ST_RIGHT;
            };
            class RscTextCenterLine2Right: RscTextCenterLine2Left {
                idc=75304;
                style=ST_RIGHT;
            };
            class RscTextCenterLine3Right: RscTextCenterLine3Left {
                idc=75305;
                style=ST_RIGHT;
            };
            class RscTextInfoLine1: RscTextTop {
                idc=75400;
                y = DISPLAY_SAFE_Y(0.68*0.75);
                text="";
            };
            class RscTextInfoLine2: RscTextTop {
                idc=75401;
                y = DISPLAY_SAFE_Y(0.72*0.75);
                text="";
            };
            class RscTextBottomBig: RscTextTop {
                idc=75500;
                y = DISPLAY_SAFE_Y(0.67*0.75);
                h=0.10*0.75;
                SizeEx=0.06*0.75;
                text="";
            };
            class RscTextCenterLine1: RscTextTop {
                idc=75600;
                y = DISPLAY_SAFE_Y(0.58*0.75);
                SizeEx=0.03*0.75;
            };
            class RscTextCenterLine2: RscTextCenterLine1 {
                idc=75601;
                y = DISPLAY_SAFE_Y(0.61*0.75);
            };
            class RscTextCenterLine3: RscTextCenterLine1 {
                idc=75602;
                y = DISPLAY_SAFE_Y(0.64*0.75);
            };
            class RscTextCenterLine4: RscTextCenterLine1 {
                idc=75603;
                y = DISPLAY_SAFE_Y(0.67*0.75);
            };
            class RscTextCenterLine5: RscTextCenterLine1 {
                idc=75604;
                y = DISPLAY_SAFE_Y(0.70*0.75);
            };
            class RscTextCenterLine6: RscTextCenterLine1 {
                idc=75605;
                y = DISPLAY_SAFE_Y(0.73*0.75);
            };
        };
    };

    class RscKestrel4500_Preload {
        idd = -1;
        movingEnable = 0;
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        class controls {
            class Preload_0 {
                text = QPATHTOF(UI\Kestrel4500_0.paa);
            };
            class Preload_1 {
                text = QPATHTOF(UI\Kestrel4500_1.paa);
            };
            class Preload_2 {
                text = QPATHTOF(UI\Kestrel4500_2.paa);
            };
            class Preload_3 {
                text = QPATHTOF(UI\Kestrel4500_3.paa);
            };
            class Preload_4 {
                text = QPATHTOF(UI\Kestrel4500_4.paa);
            };
            class Preload_5 {
                text = QPATHTOF(UI\Kestrel4500_5.paa);
            };
            class Preload_6 {
                text = QPATHTOF(UI\Kestrel4500_6.paa);
            };
        };
    };
};