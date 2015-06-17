///////////////////////////////////////////////////////////////////////////
/// Styles
///////////////////////////////////////////////////////////////////////////

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
#define CT_SHORTCUTBUTTON   16
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
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

// Fonts
#define GUI_FONT_NORMAL         PuristaMedium
#define GUI_FONT_BOLD           PuristaSemibold
#define GUI_FONT_THIN           PuristaLight
#define GUI_FONT_MONO           EtelkaMonospacePro
#define GUI_FONT_NARROW         EtelkaNarrowMediumPro
#define GUI_FONT_CODE           LucidaConsoleB
#define GUI_FONT_SYSTEM         TahomaB

///////////////////////////////////////////////////////////////////////////
/// Base Classes
///////////////////////////////////////////////////////////////////////////
class GVAR(RscText) {
    access = 0;
    type = 0;
    idc = -1;
    colorBackground[] = {
        0,
        0,
        0,
        0
    };
    colorText[] = {
        1,
        1,
        1,
        1
    };
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0.037;
    w = 0.3;
    style = 0;
    shadow = 1;
    colorShadow[] = {
        0,
        0,
        0,
        0.5
    };
    font = "PuristaMedium";
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    linespacing = 1;
};
class GVAR(RscStructuredText) {
    access = 0;
    type = 13;
    idc = -1;
    style = 0;
    colorText[] = {
        1,
        1,
        1,
        1
    };
    class Attributes {
        font = "PuristaMedium";
        color = "#ffffff";
        align = "left";
        shadow = 1;
    };
    x = 0;
    y = 0;
    h = 0.035;
    w = 0.1;
    text = "";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 1;
};
class GVAR(RscPicture) {
    access = 0;
    type = 0;
    idc = -1;
    style = 48;
    colorBackground[] = {
        0,
        0,
        0,
        0
    };
    colorText[] = {
        1,
        1,
        1,
        1
    };
    font = "TahomaB";
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};
class GVAR(RscEdit) {
    access = 0;
    type = 2;
    x = 0;
    y = 0;
    h = 0.04;
    w = 0.2;
    colorBackground[] = {
        0,
        0,
        0,
        0
    };
    colorText[] = {
        0.95,
        0.95,
        0.95,
        1
    };
    colorDisabled[] = {
        1,
        1,
        1,
        0.25
    };
    colorSelection[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    autocomplete = "";
    text = "";
    size = 0.2;
    style = "0x00 + 0x40";
    font = "PuristaMedium";
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    canModify = 1;
};
class GVAR(RscCombo) {
    access = 0;
    type = 4;
    colorSelect[] = {
        0,
        0,
        0,
        1
    };
    colorText[] = {
        1,
        1,
        1,
        1
    };
    colorBackground[] = {
        0,
        0,
        0,
        1
    };
    colorScrollbar[] = {
        1,
        0,
        0,
        1
    };
    soundSelect[] = {
        "\A3\ui_f\data\sound\RscCombo\soundSelect",
        0.1,
        1
    };
    soundExpand[] = {
        "\A3\ui_f\data\sound\RscCombo\soundExpand",
        0.1,
        1
    };
    soundCollapse[] = {
        "\A3\ui_f\data\sound\RscCombo\soundCollapse",
        0.1,
        1
    };
    maxHistoryDelay = 1;
    class ScrollBar {
        color[] = {
            1,
            1,
            1,
            0.6
        };
        colorActive[] = {
            1,
            1,
            1,
            1
        };
        colorDisabled[] = {
            1,
            1,
            1,
            0.3
        };
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
    style = 16;
    x = 0;
    y = 0;
    w = 0.12;
    h = 0.035;
    shadow = 0;
    colorSelectBackground[] = {
        1,
        1,
        1,
        0.7
    };
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = 0.45;
    color[] = {
        1,
        1,
        1,
        1
    };
    colorActive[] = {
        1,
        0,
        0,
        1
    };
    colorDisabled[] = {
        1,
        1,
        1,
        0.25
    };
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
};
class GVAR(RscListBox) {
    access = 0;
    type = 5;
    w = 0.4;
    h = 0.4;
    rowHeight = 0;
    colorText[] = {
        1,
        1,
        1,
        1
    };
    colorDisabled[] = {
        1,
        1,
        1,
        0.25
    };
    colorScrollbar[] = {
        1,
        0,
        0,
        0
    };
    colorSelect[] = {
        0,
        0,
        0,
        1
    };
    colorSelect2[] = {
        0,
        0,
        0,
        1
    };
    colorSelectBackground[] = {
        0.95,
        0.95,
        0.95,
        1
    };
    colorSelectBackground2[] = {
        1,
        1,
        1,
        0.5
    };
    colorBackground[] = {
        0,
        0,
        0,
        0.3
    };
    colorPicture[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    soundSelect[] = {
        "\A3\ui_f\data\sound\RscListbox\soundSelect",
        0.09,
        1
    };
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    class ScrollBar {
        color[] = {
            1,
            1,
            1,
            0.6
        };
        colorActive[] = {
            1,
            1,
            1,
            1
        };
        colorDisabled[] = {
            1,
            1,
            1,
            0.3
        };
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
    style = 16;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    shadow = 0;
    colorShadow[] = {
        0,
        0,
        0,
        0.5
    };
    color[] = {
        1,
        1,
        1,
        1
    };
    period = 1.2;
    maxHistoryDelay = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    class listScrollBar {
        color[] = {
            1,
            1,
            1,
            0.6
        };
        colorActive[] = {
            1,
            1,
            1,
            1
        };
        colorDisabled[] = {
            1,
            1,
            1,
            0.3
        };
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
};
class GVAR(RscButton) {
    access = 0;
    type = 1;
    text = "";
    colorText[] = {
        1,
        1,
        1,
        1
    };
    colorDisabled[] = {
        0.4,
        0.4,
        0.4,
        1
    };
    colorBackground[] = {0.118, 0.118, 0.118,.7};
    colorBackgroundDisabled[] = {
        0.95,
        0.95,
        0.95,
        1
    };
    colorBackgroundActive[] = {0.118, 0.118, 0.118,1};
    colorFocused[] = {0.118, 0.118, 0.118,1};
    colorShadow[] = {
        0,
        0,
        0,
        1
    };
    colorBorder[] = {
        0,
        0,
        0,
        1
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

class GVAR(ActiveText) {
    access = 0;
    type = CT_ACTIVETEXT;
    style = ST_LEFT;
    text = "";
    color[] = { 1, 1, 1, 1 };
    colorActive[] = { 1, 1, 1, 1 };
    colorText[] = {
        1,
        1,
        1,
        1
    };
    colorDisabled[] = {
        0.4,
        0.4,
        0.4,
        1
    };
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        0.7
    };
    colorBackgroundDisabled[] = {
        0.95,
        0.95,
        0.95,
        1
    };
    colorBackgroundActive[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    colorFocused[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    colorShadow[] = {
        0,
        0,
        0,
        1
    };
    colorBorder[] = {
        0,
        0,
        0,
        1
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

class GVAR(HTML) {
    access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
    style = ST_LEFT; // Style
    default = 0; // Control selected by default (only one within a display can be used)
    blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

    colorBackground[] = {0.2,0.2,0.2,1}; // Fill color

    colorText[] = {1,1,1,1}; // Text color
    colorBold[] = {1,1,1,1}; // <b> text color
    colorLink[] = {1,1,1,1}; // <a> text color
    colorLinkActive[] = {1,0.5,0,1}; // Active <a> text color
    colorPicture[] = {1,1,1,1}; // Picture color
    colorPictureBorder[] = {0,0,0,0}; // Picture border color
    colorPictureLink[] = {1,1,1,1}; // <a> picture color
    colorPictureSelected[] = {1,1,1,1}; // Active <a> picture color

    prevPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_left_ca.paa"; // Pagination arrow for previous page
    nextPage = "\A3\ui_f\data\gui\rsccommon\rschtml\arrow_right_ca.paa"; // Pagination arrow for next page
    /*
    tooltip = "CT_HTML"; // Tooltip text
    tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
    tooltipColorText[] = {1,1,1,1}; // Tooltip text color
    tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color
    */
    //filename = "a3\ui_f\data\html\RscFeedback.html";
    /*
    class P // Paragraph style {
        font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
        fontBold = GUI_FONT_BOLD; // Vold font from CfgFontFamilies
        sizeEx = GUI_GRID_CENTER_H; // Text size
        align = "left"; // Text align (can be "left", "center" or "right")
    };
    class H1:P{}; // Header 1 style (uses same attributes as P)
    class H2:P{}; // Header 2 style (uses same attributes as P)
    class H3:P{}; // Header 3 style (uses same attributes as P)
    class H4:P{}; // Header 4 style (uses same attributes as P)
    class H5:P{}; // Header 5 style (uses same attributes as P)
    class H6:P{}; // Header 6 style (uses same attributes as P)
    */
    /*
    onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
    onDestroy = "systemChat str ['onDestroy',_this]; false";
    onMouseEnter = "systemChat str ['onMouseEnter',_this]; false";
    onMouseExit = "systemChat str ['onMouseExit',_this]; false";
    onSetFocus = "systemChat str ['onSetFocus',_this]; false";
    onKillFocus = "systemChat str ['onKillFocus',_this]; false";
    onKeyDown = "systemChat str ['onKeyDown',_this]; false";
    onKeyUp = "systemChat str ['onKeyUp',_this]; false";
    onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
    onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
    onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
    onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
    onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
    onMouseMoving = "";
    onMouseHolding = "";

    onHTMLLink = "systemChat str ['onHTMLLink',_this]; false";
    */
};

// Invisable button

class GVAR(RscButtonInv) {
    access = 0;
    type = 1;
    text = "";
    colorText[] = {
        0,
        0,
        0,
        0
    };
    colorDisabled[] = {
        0.4,
        0.4,
        0.4,
        0
    };
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        0
    };
    colorBackgroundDisabled[] = {
        0.95,
        0.95,
        0.95,
        0
    };
    colorBackgroundActive[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        0
    };
    colorFocused[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        0
    };
    colorShadow[] = {
        0,
        0,
        0,
        0
    };
    colorBorder[] = {
        0,
        0,
        0,
        0
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};




class GVAR(RscShortcutButton) {
    type = 16;
    x = 0.1;
    y = 0.1;
    class HitZone {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos {
        left = 0;
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    };
    class TextPos {
        left = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0;
    };
    shortcuts[] = {
    };
    textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
    color[] = {
        1,
        1,
        1,
        1
    };
    color2[] = {
        0.95,
        0.95,
        0.95,
        1
    };
    colorDisabled[] = {
        1,
        1,
        1,
        0.25
    };
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    colorBackground2[] = {
        1,
        1,
        1,
        1
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    class Attributes {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
    idc = -1;
    style = 0;
    default = 0;
    shadow = 1;
    w = 0.183825;
    h = "((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
    periodFocus = 1.2;
    periodOver = 0.8;
    period = 0.4;
    font = "PuristaMedium";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    text = "";
    action = "";
    class AttributesImage {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
    };
};
class GVAR(RscShortcutButtonMain) {
    idc = -1;
    style = 0;
    default = 0;
    w = 0.313726;
    h = 0.104575;
    color[] = {
        1,
        1,
        1,
        1
    };
    colorDisabled[] = {
        1,
        1,
        1,
        0.25
    };
    class HitZone {
        left = 0;
        top = 0;
        right = 0;
        bottom = 0;
    };
    class ShortcutPos {
        left = 0.0145;
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        w = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2) * (3/4)";
        h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    };
    class TextPos {
        left = "(((safezoneW / safezoneH) min 1.2) / 32) * 1.5";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20)*2 - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)) / 2";
        right = 0.005;
        bottom = 0;
    };
    animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
    animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\over_ca.paa";
    animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\focus_ca.paa";
    animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\down_ca.paa";
    animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButtonMain\normal_ca.paa";
    period = 0.5;
    font = "PuristaMedium";
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    text = "";
    action = "";
    class Attributes {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class AttributesImage {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "false";
    };
};
class GVAR(RscFrame) {
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {
        0,
        0,
        0,
        0
    };
    colorText[] = {
        1,
        1,
        1,
        1
    };
    font = "PuristaMedium";
    sizeEx = 0.02;
    text = "";
};
class GVAR(RscSlider) {
    access = 0;
    type = 3;
    style = 1024;
    w = 0.3;
    color[] = {
        1,
        1,
        1,
        0.8
    };
    colorActive[] = {
        1,
        1,
        1,
        1
    };
    shadow = 0;
    h = 0.025;
};
class GVAR(IGUIBack) {
    type = 0;
    idc = 124;
    style = 128;
    text = "";
    colorText[] = {
        0,
        0,
        0,
        0
    };
    font = "PuristaMedium";
    sizeEx = 0;
    shadow = 0;
    x = 0.1;
    y = 0.1;
    w = 0.1;
    h = 0.1;
    colorbackground[] = {
        "(profilenamespace getvariable ['IGUI_BCG_RGB_R',0])",
        "(profilenamespace getvariable ['IGUI_BCG_RGB_G',1])",
        "(profilenamespace getvariable ['IGUI_BCG_RGB_B',1])",
        "(profilenamespace getvariable ['IGUI_BCG_RGB_A',0.8])"
    };
};
class GVAR(RscCheckbox) {
    idc = -1;
    type = 7;
    style = 0;
    x = "LINE_X(XVAL)";
    y = "LINE_Y";
    w = "LINE_W(WVAL)";
    h = 0.029412;
    colorText[] = {
        1,
        0,
        0,
        1
    };
    color[] = {
        0,
        0,
        0,
        0
    };
    colorBackground[] = {
        0,
        0,
        1,
        1
    };
    colorTextSelect[] = {
        0,
        0.8,
        0,
        1
    };
    colorSelectedBg[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    colorSelect[] = {
        0,
        0,
        0,
        1
    };
    colorTextDisable[] = {
        0.4,
        0.4,
        0.4,
        1
    };
    colorDisable[] = {
        0.4,
        0.4,
        0.4,
        1
    };
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    rows = 1;
    columns = 1;
    strings[] = {
        "UNCHECKED"
    };
    checked_strings[] = {
        "CHECKED"
    };
};
class GVAR(RscButtonMenu) {
    idc = -1;
    type = 16;
    style = "0x02 + 0xC0";
    default = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,0.5)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
    colorBackground[] = {
        0,
        0,
        0,
        0.8
    };
    colorBackground2[] = {
        1,
        1,
        1,
        0.5
    };
    color[] = {
        1,
        1,
        1,
        1
    };
    color2[] = {
        1,
        1,
        1,
        1
    };
    colorText[] = {
        1,
        1,
        1,
        1
    };
    colorDisabled[] = {
        1,
        1,
        1,
        0.25
    };

    class HitZone {
        left = 0.004;
        top = 0.029;
        right = 0.004;
        bottom = 0.029;
    };

    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    class TextPos {
        left = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
        top = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
        right = 0.005;
        bottom = 0;
    };
    class Attributes {
        font = "PuristaLight";
        color = "#E5E5E5";
        align = "left";
        shadow = "false";
    };
    class ShortcutPos {
        left = "(6.25 * (((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
        top = 0.005;
        w = 0.0225;
        h = 0.03;
    };
    soundEnter[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
        0.09,
        1
    };
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundPush",
        0.09,
        1
    };
    soundClick[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundClick",
        0.09,
        1
    };
    soundEscape[] = {
        "\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
        0.09,
        1
    };
};
class GVAR(RscButtonMenuOK) {
    idc = 1;
    shortcuts[] = {
        "0x00050000 + 0",
        28,
        57,
        156
    };
    default = 1;
    text = "OK";
    soundPush[] = {
        "\A3\ui_f\data\sound\RscButtonMenuOK\soundPush",
        0.09,
        1
    };
};
class GVAR(RscButtonMenuCancel) {
    idc = 2;
    shortcuts[] = {
        "0x00050000 + 1"
    };
    text = "Cancel";
};
class GVAR(RscControlsGroup) {
    class VScrollbar {
        color[] = {
            1,
            1,
            1,
            1
        };
        width = 0.021;
        autoScrollSpeed = -1;
        autoScrollDelay = 5;
        autoScrollRewind = 0;
        shadow = 0;
    };
    class HScrollbar {
        color[] = {
            1,
            1,
            1,
            1
        };
        height = 0.028;
        shadow = 0;
    };
    class ScrollBar {
        color[] = {
            1,
            1,
            1,
            0.6
        };
        colorActive[] = {
            1,
            1,
            1,
            1
        };
        colorDisabled[] = {
            1,
            1,
            1,
            0.3
        };
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    };
    class Controls {
    };
    type = 15;
    idc = -1;
    x = 0;
    y = 0;
    w = 1;
    h = 1;
    shadow = 0;
    style = 16;
};
/*
class GVAR(RscFrame) {
    type = 0;
    idc = -1;
    style = 64;
    shadow = 2;
    colorBackground[] = {0,0,0,0.518};
    colorText[] = {1,1,1,1};
    font = "Zeppelin32";
    sizeEx = 0.02;
    text = "";
};
*/
/*
class GVAR(RscSlider) {
    access = 0;
    type = 3;
    style = 1024;
    w = 0.3;
    color[] = {1,1,1,0.8};
    colorActive[] = {1,1,1,1};
    shadow = 0;
    h = 0.025;
};
*/

class GVAR(RscMapControl) {
  access = 0;
  idc = -1;
  type = CT_MAP_MAIN;
  style = ST_PICTURE;

  x = 0.10;
  y = 0.10;
  w = 0.80;
  h = 0.60;

    moveOnEdges = 1;
    shadow = 0;
    ptsPerSquareSea = 5;
    ptsPerSquareTxt = 3;
    ptsPerSquareCLn = 10;
    ptsPerSquareExp = 10;
    ptsPerSquareCost = 10;
    ptsPerSquareFor = 9;
    ptsPerSquareForEdge = 9;
    ptsPerSquareRoad = 6;
    ptsPerSquareObj = 9;
    showCountourInterval = 0;
    scaleMin = 0.001;
    scaleMax = 1.0;
    scaleDefault = 0.16;
    maxSatelliteAlpha = 0.85;
    alphaFadeStartScale = 0.35;
    alphaFadeEndScale = 0.4;
    colorBackground[] = {0.969,0.957,0.949,1.0};
    colorSea[] = {0.467,0.631,0.851,0.5};
    colorForest[] = {0.4,1,0.4,0.3};
    colorForestBorder[] = {0.0,0.0,0.0,0.0};
    colorRocks[] = {0.0,0.0,0.0,0.3};
    colorRocksBorder[] = {0.0,0.0,0.0,0.0};
    colorLevels[] = {0,0,0,1};
    colorMainCountlines[] = {1,0,0,1};
    colorCountlines[] = {1,0,0,0.5};
    colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
    colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
    colorPowerLines[] = {0.1,0.1,0.1,1.0};
    colorRailWay[] = {0.8,0.2,0.0,1.0};
    colorNames[] = {0,0,0,1};
    colorInactive[] = {1.0,1.0,1.0,0.5};
    colorOutside[] = {0.5,0.5,0.5,1.0};
    colorTracks[] = {0.84,0.76,0.65,1.0};
    colorTracksFill[] = {0.84,0.76,0.65,1.0};
    colorRoads[] = {1.0,0.8,0.0,1.0};
    colorRoadsFill[] = {1.0,0.8,0.0,1.0};
    colorMainRoads[] = {1.0,0.6,0.4,1.0};
    colorMainRoadsFill[] = {1.0,0.6,0.4,1.0};
    colorGrid[] = {0.1,0.1,0.1,0.6};
    colorGridMap[] = {0.1,0.1,0.1,0.6};
    fontLabel = "PuristaMedium";
    sizeExLabel = "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontGrid = "TahomaB";
    sizeExGrid = 0.02;
    fontUnits = "TahomaB";
    sizeExUnits = "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontNames = "PuristaMedium";
    sizeExNames = "(            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
    fontInfo = "PuristaMedium";
    sizeExInfo = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
    fontLevel = "TahomaB";
    sizeExLevel = 0.02;

    colorText[] = {1,1,1,1.0};
    font = "PuristaMedium";
    text = "#(argb,8,8,3)color(1,1,1,1)";
    SizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    //size = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";

    class Legend {
        x = "SafeZoneX +                    (           ((safezoneW / safezoneH) min 1.2) / 40)";
        y = "SafeZoneY + safezoneH - 4.5 *                  (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        w = "10 *                   (           ((safezoneW / safezoneH) min 1.2) / 40)";
        h = "3.5 *                  (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        font = "PuristaMedium";
        sizeEx = "(         (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        colorBackground[] = {1,1,1,0.5};
        color[] = {0,0,0,1};
    };
    class Task {
        icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
        iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
        iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
        iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
        iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
        color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
        colorCreated[] = {1,1,1,1};
        colorCanceled[] = {0.7,0.7,0.7,1};
        colorDone[] = {0.7,1,0.3,1};
        colorFailed[] = {1,0.3,0.2,1};
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class Waypoint {
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        color[] = {0,0,0,1};
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class WaypointCompleted {
        icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
        color[] = {0,0,0,1};
        size = 27;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
    };
    class CustomMark {
        icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        color[] = {0,0,0,1};
    };
    class Command {
        icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
        size = 18;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        color[] = {1,1,1,1};
    };
    class Bush {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        color[] = {0.45,0.64,0.33,0.4};
        size = "14/2";
        importance = "0.2 * 14 * 0.05 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Rock {
        icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
        color[] = {0.1,0.1,0.1,0.8};
        size = 12;
        importance = "0.5 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class SmallTree {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        color[] = {0.45,0.64,0.33,0.4};
        size = 12;
        importance = "0.6 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class Tree {
        icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
        color[] = {0.45,0.64,0.33,0.4};
        size = 12;
        importance = "0.9 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
    };
    class busstop {
        icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class fuelstation {
        icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class hospital {
        icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class church {
        icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class lighthouse {
        icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class power {
        icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class powersolar {
        icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class powerwave {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class powerwind {
        icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class quay {
        icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class shipwreck {
        icon = "\A3\ui_f\data\map\mapcontrol\shipwreck_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class transmitter {
        icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class watertower {
        icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {1,1,1,1};
    };
    class Cross {
        icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {0,0,0,1};
    };
    class Chapel {
        icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
        size = 24;
        importance = 1;
        coefMin = 0.85;
        coefMax = 1.0;
        color[] = {0,0,0,1};
    };
    class Bunker {
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 14;
        importance = "1.5 * 14 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
        color[] = {0,0,0,1};
    };
    class Fortress {
        icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
        size = 16;
        importance = "2 * 16 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
        color[] = {0,0,0,1};
    };
    class Fountain {
        icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
        size = 11;
        importance = "1 * 12 * 0.05";
        coefMin = 0.25;
        coefMax = 4;
        color[] = {0,0,0,1};
    };
    class Ruin {
        icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
        size = 16;
        importance = "1.2 * 16 * 0.05";
        coefMin = 1;
        coefMax = 4;
        color[] = {0,0,0,1};
    };
    class Stack {
        icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
        size = 20;
        importance = "2 * 16 * 0.05";
        coefMin = 0.9;
        coefMax = 4;
        color[] = {0,0,0,1};
    };
    class Tourism {
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        size = 16;
        importance = "1 * 16 * 0.05";
        coefMin = 0.7;
        coefMax = 4;
        color[] = {0,0,0,1};
    };
    class ViewTower {
        icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
        size = 16;
        importance = "2.5 * 16 * 0.05";
        coefMin = 0.5;
        coefMax = 4;
        color[] = {0,0,0,1};
    };

    class ActiveMarker {
        //icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
        size = 24;
        importance = 1;
        coefMin = 1;
        coefMax = 1;
        color[] = {0,0,0,1};
    };
};

class GVAR(MenuItem): GVAR(ActiveText) {
    colorActive[] = {255/255,165/255,0/255,1};
};

class GVAR(MenuExit): GVAR(MenuItem) {
    color[] = {1,1,1,0.75};
};
