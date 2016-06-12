// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUT_BUTTON  16 // Arma 2 - textured button

#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_List_N_Box       102 // Arma 2 - N columns list box


// Static styles
#define ST_POS            0x0F
#define ST_HPOS            0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96
#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176
#define ST_SHADOW 0x100
#define ST_NO_RECT 0x200
#define ST_KEEP_ASPECT_RATIO 0x800
#define ST_TITLE ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HORZ 0x400
#define SL_TEXTURES 0x10

// Listbox styles
#define LB_TEXTURES 0x10
#define LB_MULTI 0x20
#define FontM "RobotoCondensed"

class RscText;

class DAGR_Button {
    idc = -1;
    type = CT_BUTTON;
    style = ST_LEFT;
    font = "RobotoCondensed";
    sizeEx = 0.02;
    colorText[] = { 0, 1, 0, 1 };
    colorFocused[] = { 0, 0, 0, 0 };   // border color for focused state
    colorDisabled[] = { 0, 0, 0, 0 };   // text color for disabled state
    colorBackground[] = { 0, 0, 0, 0 };
    colorBackgroundDisabled[] = { 0, 0, 0, 0 };   // background color for disabled state
    colorBackgroundActive[] = { 0, 0, 0, 0 };   // background color for active state
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    colorShadow[] = { 0, 0, 0, 0 };
    colorBorder[] = { 0, 0, 0, 0 };
    borderSize = 0;
    soundEnter[] = { "", 0, 1 };  // no sound
    soundPush[] = { "", 0, 1 };
    soundClick[] = { "", 0, 1 };  // no sound
    soundEscape[] = { "", 0, 1 };  // no sound
    x = 0.5;
    y = 0.5;
    w = 0.07;
    h = 0.05;
    text = "";
    action = "";
};
class DAGR_Menu_Pic {
    type = 0;
    idc = -1;
    style = 48;
    x = 0;
    y = 0;
    w = 0.7;
    h = 1.4;
    text = "";
    colorBackground[] = {};
    colorText[] = {};
    font = "RobotoCondensed";
    sizeEx = 0.04;
    waitForLoad = 0;
};

class DAGR_Menu_Text {
    type = 0;
    idc = -1;
    style = 0x00;
    x = 0.5;
    y = 0.5;
    w = 0.15;
    h = 0.15;
    colorBackground[] = { 0, 0, 0, 0 };
    colorText[] = { 0.239, 0.216, 0.153, 1 };
    font = "RobotoCondensed";
    sizeEx = 0.03;
    waitForLoad = 0;
    text = "";
};

class DAGR_Menu {
    idd = 266860;
    movingEnable = false;
    duration = 100000;
    fadein = 0;
    fadeout = 0;
    name = "Dagr_Menu";
    onLoad = "uiNamespace setVariable ['DAGR_Menu', _this select 0]";
    onUnload = QUOTE(GVAR(PWR) = true); // Simulate pressing the power button
    controls[] = {"DAGR_MENU_UI", "DAGR_PWR_Button", "DAGR_UP_Button", "DAGR_DOWN_Button", "DAGR_LEFT_Button", "DAGR_RIGHT_Button", "DAGR_NEXT_Button",
        "DAGR_SEL_Button", "DAGR_MENU_Button", "DAGR_F1_Button", "DAGR_F2_Button", "DAGR_F3_Button", "DAGR_F1_Text", "DAGR_F2_Text", "DAGR_F3_Text", "DAGR_MENU_OPTION0",
        "DAGR_MENU_OPTION1", "DAGR_MENU_OPTION2", "DAGR_MENU_OPTION3", "DAGR_MENU_OPTION4", "DAGR_MENU_SELECTION0", "DAGR_MENU_SELECTION1", "DAGR_MENU_SELECTION2",
        "DAGR_MENU_SELECTION3", "DAGR_MENU_SELECTION4", "DAGR_MENU_Main_Text", "DAGR_MENU_PSELECTION1", "DAGR_MENU_PSELECTION2", "DAGR_MENU_PSELECTION3",
        "DAGR_MENU_PSELECTION4", "DAGR_MENU_PSELECTION5", "DAGR_MENU_PSELECTION6","DAGR_MENU_PSELECTION7", "DAGR_MENU_PSELECTION8"};

    class DAGR_MENU_UI : DAGR_Menu_Pic {
        idc = 266861;
        x = 0.175;
        y = -0.173;
        text = QPATHTOF(UI\dagr_menu.paa);
        sizeEx = 0.1;
    };

    class DAGR_PWR_Button : DAGR_Button {
        idc = 266863;
        action = QUOTE(GVAR(PWR) = true);
        x = 0.40;
        y = 0.65;
    };

    class DAGR_UP_Button : DAGR_Button {
        idc = 266864;
        action = QUOTE(GVAR(UP) = true);
        x = 0.50;
        y = 0.675;
    };

    class DAGR_DOWN_Button : DAGR_Button {
        idc = 266865;
        action = QUOTE(GVAR(DOWN) = true);
        x = 0.50;
        y = 0.81;
    };

    class DAGR_LEFT_Button : DAGR_Button {
        idc = 266866;
        action = QUOTE(GVAR(LEFT) = true);
        x = 0.40;
        y = 0.735;
        w = 0.05;
        h = 0.07;
    };

    class DAGR_RIGHT_Button : DAGR_Button {
        idc = 266867;
        action = QUOTE(GVAR(RIGHT) = true);
        x = 0.62;
        y = 0.735;
        w = 0.05;
        h = 0.07;
    };

    class DAGR_NEXT_Button : DAGR_Button {
        idc = 266868;
        action = QUOTE(DAGR_NEXT = true);
        x = 0.60;
        y = 0.65;
    };

    class DAGR_SEL_Button : DAGR_Button {
        idc = 266869;
        action = QUOTE(GVAR(SEL) = true);
        x = 0.54;
        y = 0.735;
        w = 0.06;
        h = 0.06;
    };

    class DAGR_MENU_Button : DAGR_Button {
        idc = 266870;
        action = QUOTE(GVAR(MENU_B) = true);
        x = 0.46;
        y = 0.735;
        w = 0.06;
        h = 0.06;
    };

    class DAGR_F1_Button : DAGR_Button {
        idc = 266871;
        action = QUOTE(GVAR(F1) = true);
        x = 0.40;
        y = 0.575;
    };

    class DAGR_F2_Button : DAGR_Button {
        idc = 266872;
        action = QUOTE(GVAR(F2) = true);
        x = 0.495;
        y = 0.575;
    };

    class DAGR_F3_Button : DAGR_Button {
        idc = 266873;
        action = QUOTE(GVAR(F3) = true);
        x = 0.59;
        y = 0.575;
    };

    class DAGR_F1_Text : DAGR_Menu_Text {
        idc = 266874;
        x = 0.388;
        y = 0.38;
        text = "";
    };

    class DAGR_F2_Text : DAGR_Menu_Text {
        idc = 266875;
        x = 0.506;
        y = 0.38;
    };

    class DAGR_F3_Text : DAGR_Menu_Text {
        idc = 266876;
        x = 0.612;
        y = 0.38;
    };

    class DAGR_MENU_OPTION0 : DAGR_Menu_Text {
        idc = 2668777;
        style = 0x02;
        sizeEx = 0.035;
        x = 0.43;
        y = 0.19;
    };

    class DAGR_MENU_OPTION1 : DAGR_Menu_Text {
        idc = 2668778;
        style = 0x02;
        sizeEx = 0.035;
        x = 0.43;
        y = 0.225;
    };

    class DAGR_MENU_OPTION2 : DAGR_Menu_Text {
        idc = 2668779;
        style = 0x02;
        sizeEx = 0.035;
        x = 0.43;
        y = 0.26;
    };

    class DAGR_MENU_OPTION3 : DAGR_Menu_Text {
        idc = 2668780;
        style = 0x02;
        sizeEx = 0.035;
        x = 0.43;
        y = 0.295;
    };

    class DAGR_MENU_OPTION4 : DAGR_Menu_Text {
        idc = 2668781;
        style = 0x02;
        sizeEx = 0.035;
        x = 0.43;
        y = 0.33;
    };
    class DAGR_MENU_SELECTION0 : DAGR_Menu_Pic {
        idc = 2668783;
        x = 0.42;
        y = 0.246;
        w = 0.17;
        h = 0.035;
        sizeEx = 0.05;
    };

    class DAGR_MENU_SELECTION1 : DAGR_Menu_Pic {
        idc = 2668784;
        x = 0.42;
        y = 0.281;
        w = 0.17;
        h = 0.035;
        sizeEx = 0.05;
    };

    class DAGR_MENU_SELECTION2 : DAGR_Menu_Pic {
        idc = 2668785;
        x = 0.42;
        y = 0.316;
        w = 0.17;
        h = 0.035;
        sizeEx = 0.05;
    };

    class DAGR_MENU_SELECTION3 : DAGR_Menu_Pic {
        idc = 2668786;
        x = 0.42;
        y = 0.351;
        w = 0.17;
        h = 0.035;
        sizeEx = 0.05;
    };

    class DAGR_MENU_SELECTION4 : DAGR_Menu_Pic {
        idc = 2668787;
        x = 0.42;
        y = 0.386;
        w = 0.17;
        h = 0.035;
        sizeEx = 0.05;
    };

    class DAGR_MENU_Main_Text : DAGR_Menu_Text {
        idc = 2668782;
        style = ST_CENTER;
        x = 0.38;
        y = 0.32;
        w = 0.25;
        h = 0.035;
        sizeEx = 0.04;
    };

    class DAGR_MENU_PSELECTION1 : DAGR_Menu_Pic {
        idc = 2668788;
        x = 0.451;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION2 : DAGR_Menu_Pic {
        idc = 2668789;
        x = 0.465;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION3 : DAGR_Menu_Pic {
        idc = 2668790;
        x = 0.479;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION4 : DAGR_Menu_Pic {
        idc = 2668791;
        x = 0.493;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION5 : DAGR_Menu_Pic {
        idc = 2668792;
        x = 0.507;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION6 : DAGR_Menu_Pic {
        idc = 2668793;
        x = 0.521;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION7 : DAGR_Menu_Pic {
        idc = 2668794;
        x = 0.535;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };

    class DAGR_MENU_PSELECTION8 : DAGR_Menu_Pic {
        idc = 2668795;
        x = 0.549;
        y = 0.352;
        w = 0.01;
        h = 0.003;
    };
};
