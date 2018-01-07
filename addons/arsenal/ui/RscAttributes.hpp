#include "RscCommon.hpp"
#include "..\defines.hpp"

class GVAR(display) {
    idd = IDD_ace_arsenal;
    enableSimulation=1;
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(display))] call FUNC(onArsenalOpen));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(display))] call FUNC(onArsenalClose));
    onKeyDown = QUOTE([ARR_3('onKeyDown', _this, QQGVAR(display))] call FUNC(onKeyDown));
    onKeyUp = QUOTE(GVAR(shiftState) = _this select 2);
    onMouseButtonDown = QUOTE([ARR_3('onMouseButtonDown', _this, QQGVAR(display))] call FUNC(onMouseButtonDown));
    onMouseButtonUp = QUOTE([ARR_3('onMouseButtonUp', _this, QQGVAR(display))] call FUNC(onMouseButtonUp));
    icon="\A3\Ui_f\data\Logos\a_64_ca.paa";
    logo="\A3\Ui_f\data\Logos\arsenal_1024_ca.paa";
    class ControlsBackground {
        class blackLeft: ctrlStatic {
            colorBackground[]={0,0,0,1};
            x = QUOTE(safezoneXAbs);
            y = QUOTE(safezoneY);
            w = QUOTE(safezoneXAbs - safezoneX);
            h = QUOTE(safezoneH);
        };

        class blackRight: blackLeft {
            x = QUOTE(safezoneX + safezoneW);
        };

        class mouseArea: ctrlStatic {
            idc = IDC_mouseArea;
            style = 16;
            onMouseMoving = QUOTE([ARR_3('onMouseMoving', _this, GVAR(display))] call FUNC(handleMouse));
            onMouseHolding = QUOTE([ARR_3('onMouseHolding', _this, GVAR(display))] call FUNC(handleMouse));
            onMouseZChanged = QUOTE([ARR_3('onMouseZChanged', _this, GVAR(display))] call FUNC(handleScrollWheel));
            x = QUOTE(safezoneX);
            y = QUOTE(safezoneY);
            w = QUOTE(safezoneW);
            h = QUOTE(safezoneH);
        };
    };
    class controls {
        class ArrowLeft: ctrlButton {
            idc = IDC_arrowMinus;
            text = "-";
            colorBackground[]={0,0,0,0.8};
            onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), -1)] call FUNC(buttonCargo));
            fade = 1;
            enable = 0;
            x = 0.5;
            y = 0.5;
            w = QUOTE(1 * GRID_W);
            h = QUOTE(1 * GRID_H);
            sizeEx = QUOTE(7 * GRID_H);
        };
        class ArrowRight: ArrowLeft {
            idc = IDC_arrowPlus;
            onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), 1)] call FUNC(buttonCargo));
            text="+";
        };
        class blockLeftFrame: RscFrame {
            idc = IDC_blockLeftFrame;
            x = QUOTE(safezoneX + 13 * GRID_W);
            y = QUOTE(safezoneY + 14 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(safezoneH - 24 * GRID_H);
            colorText[] = {0,0,0,1};
        };
        class blockLeftBackground: ctrlStaticBackground {
            idc = IDC_blockLeftBackground;
            x = QUOTE(safezoneX + 13 * GRID_W);
            y = QUOTE(safezoneY + 14 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(safezoneH - 24 * GRID_H);
            colorBackground[] = {0,0,0,0.5};
        };
        class blockRightFrame: blockLeftFrame {
            idc = IDC_blockRightFrame;
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            h = QUOTE(safezoneH - 34 * GRID_H);
        };
        class blockRighttBackground: blockLeftBackground {
            idc = IDC_blockRighttBackground;
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            h = QUOTE(safezoneH - 34 * GRID_H);
        };
        class loadIndicator: RscControlsGroupNoScrollbars {
            idc = IDC_loadIndicator;
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            y = QUOTE(safeZoneH + safezoneY - 20 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(6 * GRID_H);
            class controls {
                class loadIndicatorBackground: ctrlStaticBackground {
                    idc = -1;
                    colorBackground[] = {0,0,0,0.5};
                    x = 0;
                    y = 0;
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(6 * GRID_H);
                };
                class loadIndicatorBar: ctrlProgress {
                    idc = IDC_loadIndicatorBar;
                    style = 0;
                    texture = "#(argb,8,8,3)color(1,1,1,1)";
                    colorBar[] = {1,1,1,1};
                    colorFrame[] = {0,0,0,1};
                    x = 0;
                    y = 0;
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(6 * GRID_H);
                };
            };
        };
        class totalWeight: RscControlsGroupNoScrollbars {
            idc = IDC_totalWeight;
            x = QUOTE(safezoneX + 13 * GRID_W);
            y = QUOTE(safeZoneH + safezoneY - 10 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(8 * GRID_H);
            class controls {
                class totalWeightBackground: ctrlStaticBackground {
                    idc = -1;
                    colorBackground[] = {0,0,0,0.8};
                    x = 0;
                    y = 0;
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(8 * GRID_H);
                };
                class totalWeightTitle: RscText {
                    idc = -1;
                    text = ECSTRING(common,Weight);
                    x = 0;
                    y = 0;
                    w = QUOTE(30 * GRID_W);
                    h = QUOTE(8 * GRID_H);
                    sizeEx = QUOTE(7 * GRID_H);
                };
                class totalWeightText: RscText {
                    idc = IDC_totalWeightText;
                    style = ST_RIGHT;
                    text = "";
                    x = QUOTE(30 * GRID_W);
                    y = 0;
                    w = QUOTE(50 * GRID_W);
                    h = QUOTE(8 * GRID_H);
                    sizeEx = QUOTE(7 * GRID_H);
                };
            };
        };
        class message: RscText {
            idc = IDC_message;
            fade = 1;
            style=2;
            shadow=0;
            colorBackground[]={0,0,0,0.69999999};
            text="";
            x = QUOTE(0.5 - WIDTH_TOTAL / 2);
            y = QUOTE(safeZoneH + safezoneY - 25 * GRID_H);
            w = QUOTE(WIDTH_TOTAL);
            h = QUOTE(10 * GRID_H);
            sizeEx = QUOTE(5 * GRID_H);
        };
        class menuBar: RscControlsGroupNoScrollbars {
            idc = IDC_menuBar;
            x = QUOTE(0.5 - WIDTH_TOTAL / 2);
            y = QUOTE(safezoneH + safezoneY - 9 * GRID_H);
            w = QUOTE(WIDTH_TOTAL);
            h = QUOTE(7 * GRID_H);
            class controls {
                class buttonHide: ctrlButton {
                    idc = -1;
                    colorBackground[] = {0,0,0,0.8};
                    x = QUOTE(1 * WIDTH_GAP + 0 * WIDTH_SINGLE);
                    y = QUOTE(0);
                    w = QUOTE(WIDTH_SINGLE);
                    h = QUOTE(7 * GRID_H);
                    text = CSTRING(buttonHideText);
                    sizeEx = QUOTE(5 * GRID_H);
                    shortcuts[] = {"0x0E"};
                    tooltip = CSTRING(buttonHideTooltip);
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(buttonHide));
                };
                class buttonLoadouts: buttonHide {
                    idc = -1;
                    x = QUOTE(2 * WIDTH_GAP + 1 * WIDTH_SINGLE);
                    text = CSTRING(buttonLoadoutsText);
                    onButtonClick = QUOTE(createDialog QQGVAR(loadoutsDisplay));
                };
                class buttonExport: buttonHide {
                    idc = -1;
                    x = QUOTE(3 * WIDTH_GAP + 2 * WIDTH_SINGLE);
                    text = CSTRING(buttonExportText);
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(buttonExport));
                };
                class buttonImport: buttonHide {
                    idc = -1;
                    x = QUOTE(4 * WIDTH_GAP + 3 * WIDTH_SINGLE);
                    text = CSTRING(buttonImportText);
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(buttonImport));
                };
                class buttonClose: ctrlButtonOK {
                    idc = IDC_menuBarClose;
                    colorBackground[] = {0,0,0,0.8};
                    x = QUOTE(5 * WIDTH_GAP + 4 * WIDTH_SINGLE);
                    y = QUOTE(0);
                    w = QUOTE(WIDTH_SINGLE);
                    h = QUOTE(7 * GRID_H);
                    text = CSTRING(buttonCloseText);
                    sizeEx = QUOTE(5 * GRID_H);
                    onButtonClick = QUOTE(ctrlparent (_this select 0) closeDisplay 1);
                };
            };
        };
        class infoBox: RscControlsGroupNoScrollbars {
            idc = IDC_infoBox;
            fade = 1;
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            y = QUOTE(safeZoneH + safezoneY - 14 * GRID_H);
            w = QUOTE(92 * GRID_W);
            h = QUOTE(12 * GRID_H);
            class controls {
                class infoBackground: ctrlStaticBackground {
                    idc = IDC_infoBackground;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(0);
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(12 * GRID_H);
                    colorBackground[] = {0,0,0,0.8};
                };
                class infoName: RscText {
                    idc = IDC_infoName;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(0);
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(7 * GRID_H);
                    sizeEx = QUOTE(5.5 * GRID_H);
                };
                class infoAuthor: RscText {
                    idc = IDC_infoAuthor;
                    colorText[] = {1,1,1,0.5};
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(6 * GRID_H);
                    w = QUOTE(80 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                };
                class DLCBackground: ctrlStaticBackground {
                    idc = IDC_DLCBackground;
                    fade = 1;
                    x = QUOTE(80 * GRID_W);
                    y = QUOTE(0);
                    w = QUOTE(12 * GRID_W);
                    h = QUOTE(12 * GRID_H);
                };
                class DLCIcon: RscActivePicture {
                    idc = IDC_DLCIcon;
                    enabled = 0;
                    fade = 1;
                    color[] = {1,1,1,1};
                    colorActive[] = {1,1,1,1};
                    text="#(argb,8,8,3)color(1,1,1,1)";
                    x = QUOTE(80 * GRID_W);
                    y = QUOTE(0);
                    w = QUOTE(12 * GRID_W);
                    h = QUOTE(12 * GRID_H);
                };
            };
        };
        class mouseBlock: RscText {
            idc = IDC_mouseBlock;
            style = 16;
            x = QUOTE(safezoneX);
            y = QUOTE(safezoneY);
            w = QUOTE(safezoneW);
            h = QUOTE(safezoneH);
        };
        class leftTabContent: RscListBox {
            idc = IDC_leftTabContent;
            colorBackground[]={0,0,0,0};
            colorSelectBackground[]={1,1,1,0.5};
            colorSelectBackground2[]={1,1,1,0.5};
            colorPictureSelected[]={1,1,1,1};
            colorSelect[]={1,1,1,1};
            colorSelect2[]={1,1,1,1};
            colorPictureRightSelected[]={1,1,1,1};
            onLBSelChanged = QUOTE(_this call FUNC(onSelChangedLeft));
            onSetFocus = QUOTE(GVAR(leftTabFocus) = true);
            onKillFocus = QUOTE(GVAR(leftTabFocus) = false);
            x = QUOTE(safezoneX + 13 * GRID_W);
            y = QUOTE(safezoneY + 14 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(safezoneH - 24.5 * GRID_H);
            sizeEx = QUOTE(7 * GRID_H);
        };
        class rightTabContent: leftTabContent {
            idc = IDC_rightTabContent;
            drawSideArrows=1;
            disableOverflow=1;
            onLBSelChanged = QUOTE(_this call FUNC(onSelChangedRight));
            onSetFocus = QUOTE(GVAR(rightTabFocus) = true);
            onKillFocus = QUOTE(GVAR(rightTabFocus) = false);
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            h = QUOTE(safezoneH - 34.5 * GRID_H);
        };
        class rightTabContentListnBox : RscListNBox {
            idc = IDC_rightTabContentListnBox;
            colorBackground[]={0,0,0,0};
            colorSelectBackground[]={1,1,1,0.5};
            colorSelectBackground2[]={1,1,1,0.5};
            colorPictureSelected[]={1,1,1,1};
            colorSelect[]={1,1,1,1};
            colorSelect2[]={1,1,1,1};
            colorPictureRightSelected[]={1,1,1,1};
            columns[]={0.07, 0.15, 0.75};
            idcLeft = IDC_arrowMinus;
            idcRIght = IDC_arrowPlus;
            drawSideArrows=1;
            disableOverflow=1;
            onLBSelChanged = QUOTE(_this call FUNC(onSelChangedRightListnBox));
            onSetFocus = QUOTE(GVAR(rightTabLnBFocus) = true);
            onKillFocus = QUOTE(GVAR(rightTabLnBFocus) = false);
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            y = QUOTE(safezoneY + 14 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(safezoneH - 34.5 * GRID_H);
            sizeEx = QUOTE(7 * GRID_H);
        };
        class sortLeftTab: RscCombo {
            idc = IDC_sortLeftTab;
            x = QUOTE(safezoneX + 13 * GRID_W);
            y = QUOTE(safezoneY + 8 * GRID_H);
            w = QUOTE(80 * GRID_W);
            h = QUOTE(6 * GRID_H);
            onLBSelChanged = QUOTE(_this call FUNC(sortPanel));
            sizeEx = QUOTE(5 * GRID_H);
            class Items {
                class Alphabet {
                    text="$STR_a3_rscdisplayarsenal_sort_alphabet";
                    default=1;
                    value= 0;
                };
                class Mod {
                    text="$STR_a3_rscdisplayarsenal_sort_mod";
                    value= 1;
                };
            };
        };
        class sortRightTab: sortLeftTab {
            idc = IDC_sortRightTab;
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
            class Items {
                class Alphabet {
                    text="$STR_a3_rscdisplayarsenal_sort_alphabet";
                    default=1;
                    value= 0;
                };
                class Weight {
                    text="$STR_a3_rscdisplayarsenal_sort_mod";
                    value= 1;
                };
            };
        };
        class leftSearchbar: ctrlEdit {
            idc = IDC_leftSearchbar;
            onSetFocus = QUOTE(GVAR(leftSearchbarFocus) = true);
            onKillFocus = QUOTE(GVAR(leftSearchbarFocus) = false);
            onMouseButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0), _this select 0, _this select 1)] call FUNC(clearSearchbar));
            x = QUOTE(safezoneX + 13 * GRID_W);
            y = QUOTE(safezoneY + 1.8 * GRID_H);
            w = QUOTE(74 * GRID_W);
            h = QUOTE(6 * GRID_H);
        };
        class leftSearchbarButton: ctrlButtonPicture {
            idc = IDC_leftSearchbarButton;
            text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
            colorBackground[]={0,0,0,0.5};
            onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), ctrlparent (_this select 0) displayCtrl IDC_leftSearchbar)] call FUNC(handleSearchbar));
            x = QUOTE(safezoneX + 87 * GRID_W);
            y = QUOTE(safezoneY + 1.8 * GRID_H);
            w = QUOTE(6 * GRID_W);
            h = QUOTE(6 * GRID_H);
        };
        class rightSearchbar: leftSearchBar {
            idc = IDC_rightSearchbar;
            onSetFocus = QUOTE(GVAR(rightSearchbarFocus) = true);
            onKillFocus = QUOTE(GVAR(rightSearchbarFocus) = false);
            x = QUOTE(safezoneX + safezoneW - 87 * GRID_W);
        };
        class rightSearchbarButton: leftSearchbarButton {
            idc = IDC_rightSearchbarButton;
            onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), ctrlparent (_this select 0) displayCtrl IDC_rightSearchbar)] call FUNC(handleSearchbar));
            x = QUOTE(safezoneX + safezoneW - 93 * GRID_W);
        };
        class tabLeft: RscControlsGroupNoScrollbars {
            idc = IDC_tabLeft;
            x = QUOTE(safezoneX + 1 * GRID_W);
            y = QUOTE(safezoneY + 8 * GRID_H);
            w = QUOTE(12 * GRID_W);
            h = QUOTE(200 * GRID_H);
            class controls {
                class iconBackgroundPrimaryWeapon: ctrlStaticBackground {
                    idc = IDC_iconBackgroundPrimaryWeapon;
                    fade=1;
                    enable=0;
                    colorBackground[]={0,0,0,1};
                    x = QUOTE(0);
                    y = QUOTE(0 * GRID_H);
                    w = QUOTE(12 * GRID_W);
                    h = QUOTE(9 * GRID_H);
                };
                class buttonPrimaryWeapon: RscButtonArsenal {
                    idc = IDC_buttonPrimaryWeapon;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_PrimaryWeapon";
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(fillLeftPanel));
                    colorBackground[]={0,0,0,0.5};
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(0 * GRID_H);
                    w = QUOTE(9 * GRID_W);
                    h = QUOTE(9 * GRID_H);
                };
                class iconBackgroundHandgun: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundHandgun;
                    y = QUOTE(10 * GRID_H);
                };
                class buttonHandgun: buttonPrimaryWeapon {
                    idc = IDC_buttonHandgun;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Handgun";
                   y = QUOTE(10 * GRID_H);
                };
                class iconBackgroundSecondaryWeapon: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundSecondaryWeapon;
                    y = QUOTE(20 * GRID_H);
                };
                class buttonSecondaryWeapon: buttonPrimaryWeapon {
                    idc = IDC_buttonSecondaryWeapon;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_SecondaryWeapon";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = QUOTE(20 * GRID_H);
                };
                class iconBackgroundHeadgear: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundHeadgear;
                    y = QUOTE(30 * GRID_H);
                };
                class buttonHeadgear: buttonPrimaryWeapon {
                    idc = IDC_buttonHeadgear;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Headgear";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa";
                    y = QUOTE(30 * GRID_H);
                };
                class iconBackgroundUniform: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundUniform;
                    y = QUOTE(40 * GRID_H);
                };
                class buttonUniform: buttonPrimaryWeapon {
                    idc = IDC_buttonUniform;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Uniform";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa";
                    y = QUOTE(40 * GRID_H);
                };
                class iconBackgroundVest: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundVest;
                    y = QUOTE(50 * GRID_H);
                };
                class buttonVest: buttonPrimaryWeapon {
                    idc = IDC_buttonVest;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Vest";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa";
                    y = QUOTE(50 * GRID_H);
                };
                class iconBackgroundBackpack: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundBackpack;
                    y = QUOTE(60 * GRID_H);
                };
                class buttonBackpack: buttonPrimaryWeapon {
                    idc = IDC_buttonBackpack;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Backpack";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa";
                    y = QUOTE(60 * GRID_H);
                };
                class iconBackgroundGoggles: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundGoggles;
                    y = QUOTE(70 * GRID_H);
                };
                class buttonGoggles: buttonPrimaryWeapon {
                    idc = IDC_buttonGoggles;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Goggles";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa";
                    y = QUOTE(70 * GRID_H);
                };
                class iconBackgroundNVG: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundNVG;
                    y = QUOTE(80 * GRID_H);
                };
                class buttonNVG: buttonPrimaryWeapon {
                    idc = IDC_buttonNVG;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_NVGs";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa";
                    y = QUOTE(80 * GRID_H);
                };
                class iconBackgroundBinoculars: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundBinoculars;
                    y = QUOTE(90 * GRID_H);
                };
                class buttonBinoculars: buttonPrimaryWeapon {
                    idc = IDC_buttonBinoculars;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Binoculars";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa";
                    y = QUOTE(90 * GRID_H);
                };
                class iconBackgroundMap: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundMap;
                    y = QUOTE(100 * GRID_H);
                };
                class buttonMap: buttonPrimaryWeapon {
                    idc = IDC_buttonMap;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Map";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa";
                    y = QUOTE(100 * GRID_H);
                };
                class iconBackgroundGPS: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundGPS;
                   y = QUOTE(110 * GRID_H);
                };
                class buttonGPS: buttonPrimaryWeapon {
                    idc = IDC_buttonGPS;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_GPS";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa";
                    y = QUOTE(110 * GRID_H);
                };
                class iconBackgroundRadio: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundRadio;
                    y = QUOTE(120 * GRID_H);
                };
                class buttonRadio: buttonPrimaryWeapon {
                    idc = IDC_buttonRadio;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Radio";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa";
                    y = QUOTE(120 * GRID_H);
                };
                class iconBackgroundCompass: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundCompass;
                    y = QUOTE(130 * GRID_H);
                };
                class buttonCompass: buttonPrimaryWeapon {
                    idc = IDC_buttonCompass;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Compass";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa";
                    y = QUOTE(130 * GRID_H);
                };
                class iconBackgroundWatch: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundWatch;
                    y = QUOTE(140 * GRID_H);
                };
                class buttonWatch: buttonPrimaryWeapon {
                    idc = IDC_buttonWatch;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Watch";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa";
                    y = QUOTE(140 * GRID_H);
                };
                class iconBackgroundFace: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundFace;
                    y = QUOTE(150 * GRID_H);
                };
                class buttonFace: buttonPrimaryWeapon {
                    idc = IDC_buttonFace;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Face";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Face_ca.paa";
                    y = QUOTE(150 * GRID_H);
                };
                class iconBackgroundVoice: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundVoice;
                    y = QUOTE(160 * GRID_H);
                };
                class buttonVoice: buttonPrimaryWeapon {
                    idc = IDC_buttonVoice;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Voice";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Voice_ca.paa";
                    y = QUOTE(160 * GRID_H);
                };
                class iconBackgroundInsigna: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundInsigna;
                    y = QUOTE(170 * GRID_H);
                };
                class buttonInsigna: buttonPrimaryWeapon {
                    idc = IDC_buttonInsigna;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Insignia";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Insignia_ca.paa";
                    y = QUOTE(170 * GRID_H);
                };
            };
        };
        class iconBackgroundOptic: ctrlStaticBackground {
            idc = IDC_iconBackgroundOptic;
            colorBackground[]={0,0,0,1};
            fade=1;
            enable=0;
            x = QUOTE(safezoneW  + safezoneX - 13 * GRID_W);
            y = QUOTE(safezoneY + 8 * GRID_H);
            w = QUOTE(12 * GRID_W);
            h = QUOTE(9 * GRID_H);
        };
        class buttonOptic: RscButtonArsenal {
            idc = IDC_buttonOptic;
            tooltip="$STR_A3_RscDisplayArsenal_tab_ItemOptic";
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
            onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(fillRightPanel));
            colorBackground[]={0,0,0,0.5};
            x = QUOTE(safezoneW  + safezoneX - 10 * GRID_W);
            y = QUOTE(safezoneY + 8 * GRID_H);
            w = QUOTE(9 * GRID_W);
            h = QUOTE(9 * GRID_H);
        };
        class iconBackgroundItemAcc: iconBackgroundOptic {
            idc = IDC_iconBackgroundItemAcc;
            y = QUOTE(safezoneY + 18 * GRID_H);
        };
        class buttonItemAcc: buttonOptic {
            idc = IDC_buttonItemAcc;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_ItemAcc";
            y = QUOTE(safezoneY + 18 * GRID_H);
        };
        class iconBackgroundMuzzle: iconBackgroundOptic {
            idc = IDC_iconBackgroundMuzzle;
            y = QUOTE(safezoneY + 28 * GRID_H);
        };
        class buttonMuzzle: buttonOptic {
            idc = IDC_buttonMuzzle;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_ItemMuzzle";
            y = QUOTE(safezoneY + 28 * GRID_H);
        };
        class iconBackgroundBipod: iconBackgroundOptic {
            idc = IDC_iconBackgroundBipod;
            y = QUOTE(safezoneY + 38 * GRID_H);
        };
        class buttonBipod: buttonOptic {
            idc = IDC_buttonBipod;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_ItemBipod";
            y = QUOTE(safezoneY + 38 * GRID_H);
        };
        class iconBackgroundCurrentMag: iconBackgroundOptic {
            idc = IDC_iconBackgroundCurrentMag;
            y = QUOTE(safezoneY + 48 * GRID_H);
        };
        class buttonCurrentMag: buttonOptic {
            idc = IDC_buttonCurrentMag;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
            tooltip= CSTRING(buttonCurrentMagTooltip);
            y = QUOTE(safezoneY + 48 * GRID_H);
        };
        class iconBackgroundCurrentMag2: iconBackgroundOptic {
            idc = IDC_iconBackgroundCurrentMag2;
            y = QUOTE(safezoneY + 58 * GRID_H);
        };
        class buttonCurrentMag2: buttonOptic {
            idc = IDC_buttonCurrentMag2;
            text= QPATHTOF(data\iconSecondaryMuzzle);
            tooltip= CSTRING(buttonCurrentMag2Tooltip);
            y = QUOTE(safezoneY + 58 * GRID_H);
        };
        class iconBackgroundMag: iconBackgroundOptic {
            idc = IDC_iconBackgroundMag;
            y = QUOTE(safezoneY + 48 * GRID_H);
        };
        class buttonMag: buttonOptic {
            idc = IDC_buttonMag;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMag";
            y = QUOTE(safezoneY + 48 * GRID_H);
        };
        class iconBackgroundMagALL: iconBackgroundOptic {
            idc = IDC_iconBackgroundMagALL;
            y = QUOTE(safezoneY + 58 * GRID_H);
        };
        class buttonMagALL: buttonOptic {
            idc = IDC_buttonMagALL;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMagAll";
            y = QUOTE(safezoneY + 58 * GRID_H);
        };
        class iconBackgroundThrow: iconBackgroundOptic {
            idc = IDC_iconBackgroundThrow;
            y = QUOTE(safezoneY + 68 * GRID_H);
        };
        class buttonThrow: buttonOptic {
            idc = IDC_buttonThrow;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_CargoThrow";
            y = QUOTE(safezoneY + 68 * GRID_H);
        };
        class iconBackgroundPut: iconBackgroundOptic {
            idc = IDC_iconBackgroundPut;
            y = QUOTE(safezoneY + 78 * GRID_H);
        };
        class buttonPut: buttonOptic {
            idc = IDC_buttonPut;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_CargoPut";
            y = QUOTE(safezoneY + 78 * GRID_H);
        };
        class iconBackgroundMisc: iconBackgroundOptic {
            idc = IDC_iconBackgroundMisc;
            y = QUOTE(safezoneY + 88 * GRID_H);
        };
        class buttonMisc: buttonOptic {
            idc = IDC_buttonMisc;
            text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
            tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMisc";
            y = QUOTE(safezoneY + 88 * GRID_H);
        };
        class buttonRemoveAll: ctrlButtonPicture {
            idc = IDC_buttonRemoveAll;
            text = QPATHTOF(data\iconClearContainer.paa);
            colorBackground[]={0,0,0,0.5};
            onButtonClick = QUOTE(ctrlParent (_this select 0) call FUNC(buttonClearAll));
            fade=1;
            enable=0;
            x = QUOTE(safezoneW  + safezoneX - 11 * GRID_W);
            y = QUOTE(safeZoneH + safezoneY - 29 * GRID_H);
            w = QUOTE(9 * GRID_W);
            h = QUOTE(9 * GRID_H);
        };
    };
};

class GVAR(loadoutsDisplay) {
    idd = IDD_loadouts_display;
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(loadoutsDisplay))] call FUNC(onLoadoutsOpen));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(loadoutsDisplay))] call FUNC(onLoadoutsClose));
    class controls {
        class centerBox: ctrlControlsGroupNoScrollbars {
            idc = IDC_centerBox;
            x = QUOTE(safezoneW  + safezoneX - (180 * GRID_W));
            y = QUOTE(safezoneY + (5 * GRID_H));
            w = QUOTE(160 * GRID_W);
            h = QUOTE(safezoneH - (34 * GRID_H));
            class controls {
                class centerFrame: RscFrame {
                    idc = -1;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(0 * GRID_H);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safezoneH - (45 * GRID_H));
                    colorText[] = {0,0,0,1};
                };
                class centerBackground: ctrlStaticBackground {
                    idc = -1;
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safezoneH - (45 * GRID_H));
                    colorBackground[] = {0.13,0.13,0.13,0.9};
                };
                class centerTitle: ctrlStaticTitle {
                    idc = IDC_centerTitle;
                    style = ST_CENTER;
                    text = "";
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                };
                class contentPanel: RscListnBox {
                    idc = IDC_contentPanel;
                    columns[]={0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90};
                    drawSideArrows=0;
                    disableOverflow=1;
                    onSetFocus = QUOTE(GVAR(loadoutsPanelFocus) = true);
                    onKillFocus = QUOTE(GVAR(loadoutsPanelFocus) = false);
                    onLBSelChanged = QUOTE([ARR_3(ctrlParent (_this select 0), _this select 0, _this select 1)] call FUNC(onSelChangedLoadouts));
                    onLBDblClick = QUOTE([ARR_2(ctrlparent (_this select 0), (ctrlParent (_this select 0)) displayCtrl IDC_buttonLoad)] call FUNC(buttonLoadoutsLoad));
                    x = QUOTE(0);
                    y = QUOTE(5 * GRID_H);
                    w = QUOTE(160 * GRID_W);
                    h = QUOTE(safezoneH - (57 * GRID_H));
                    sizeEx = QUOTE(7 * GRID_H);
                };
                class textTitle: RscText {
                    idc= -1;
                    text="$STR_DISP_GAME_NAME";
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(15 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                    colorBackground[]={0,0,0,0.2};
                };
                class textEditBox: ctrlEdit {
                    idc= IDC_textEditBox;
                    x = QUOTE(15 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(65 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                };
                class loadoutsSearchbar: ctrlEdit {
                    idc = IDC_loadoutsSearchbar;
                    onSetFocus = QUOTE(GVAR(loadoutsSearchbarFocus) = true);
                    onKillFocus = QUOTE(GVAR(loadoutsSearchbarFocus) = false);
                    onMouseButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0), _this select 0, _this select 1)] call FUNC(clearSearchbar));
                    x = QUOTE(83 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(72 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                };
                class loadoutsSearchbarButton: ctrlButtonPicture {
                    idc = -1;
                    text = "\a3\Ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
                    colorBackground[]={0,0,0,0.5};
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), ctrlparent (_this select 0) displayCtrl IDC_loadoutsSearchbar)] call FUNC(handleLoadoutsSearchbar));
                    x = QUOTE(155 * GRID_W);
                    y = QUOTE(safezoneH - (51 * GRID_H));
                    w = QUOTE(5 * GRID_W);
                    h = QUOTE(5 * GRID_H);
                };
                class buttonSave: ctrlButton {
                    idc = IDC_buttonSave;
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(safezoneH - (44 * GRID_H));
                    w = QUOTE(30 * GRID_W);
                    h = QUOTE(10 * GRID_H);
                    text= CSTRING(buttonSaveText);
                    tooltip= CSTRING(buttonSaveTooltip);
                    sizeEx = QUOTE(5 * GRID_H);
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsSave));
                    colorBackground[] = {0,0,0,0.8};
                };
                class buttonRename: buttonSave {
                    idc = IDC_buttonRename;
                    x = QUOTE(32.5 * GRID_W);
                    text= CSTRING(buttonRenameText);
                    tooltip= CSTRING(buttonRenameTooltip);
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsRename));
                };
                class buttonLoad: buttonSave {
                    idc = IDC_buttonLoad;
                    x = QUOTE(65 * GRID_W);
                    text= CSTRING(buttonLoadText);
                    tooltip= CSTRING(buttonLoadTooltip);
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsLoad));
                };
                class buttonShare: buttonSave {
                    idc = IDC_buttonShare;
                    x = QUOTE(97.5 * GRID_W);
                    text= CSTRING(buttonSharePrivateText);
                    tooltip= CSTRING(buttonShareTooltip);
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsShare));
                };
                class buttonDelete: buttonSave {
                    idc = IDC_buttonDelete;
                    x = QUOTE(130 * GRID_W);
                    text= CSTRING(buttonDeleteText);
                    tooltip= CSTRING(buttonDeleteTooltip);
                    colorBackgroundActive[] = {0.5,0,0,1};
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(buttonLoadoutsDelete));
                };
            };
        };
        
        class buttonClose: ctrlButton {
            idc = -1;
            x = QUOTE(safezoneW  + safezoneX - 32 * GRID_W);
            y = QUOTE(safezoneH + safezoneY - 9 * GRID_H);
            w = QUOTE(30 * GRID_W);
            h = QUOTE(7 * GRID_H);
            sizeEx = QUOTE(5 * GRID_H);
            text= CSTRING(buttonCloseText);
            shortcuts[]= {"0x01"};
            tooltip= "";
            onButtonClick = QUOTE(ctrlparent (_this select 0) closeDisplay 2);
        };
        class buttonBar: ctrlControlsGroupNoScrollbars {
            idc = -1;
            x = QUOTE((safezoneW * 0.5) + safezoneX - (80.5 * GRID_W));
            y = QUOTE(safezoneH + safezoneY - 9 * GRID_H);
            w = QUOTE(161 * GRID_W);
            h = QUOTE(7 * GRID_H);
            class controls {
                class buttonMyLoadoutsBackground: ctrlStaticBackground {
                    idc = IDC_buttonMyLoadoutsBackground;
                    x = QUOTE(0);
                    y = QUOTE(0);
                    w = QUOTE(52 * GRID_W);
                    h = QUOTE(7 * GRID_H);
                    colorBackground[] = {0,0,0,0.7};
                };
                class buttonMyLoadouts: ctrlButton {
                    idc = IDC_buttonMyLoadouts;
                    colorBackground[] = {0,0,0,0};
                    x = QUOTE(0 * GRID_W);
                    y = QUOTE(0 * GRID_H);
                    w = QUOTE(52 * GRID_W);
                    h = QUOTE(7 * GRID_H);
                    sizeEx = QUOTE(5 * GRID_H);
                    text= CSTRING(tabMyLoadoutsText);
                    tooltip= CSTRING(tabMyLoadoutsTooltip);
                    onButtonClick = QUOTE([ARR_2(ctrlparent (_this select 0), _this select 0)] call FUNC(loadoutsChangeTab));
                };
                class buttonDefaultLoadoutsBackground: buttonMyLoadoutsBackground {
                    idc = IDC_buttonDefaultLoadoutsBackground;
                    x = QUOTE(54.5 * GRID_W);
                };
                class buttonDefaultLoadouts: buttonMyLoadouts {
                    idc = IDC_buttonDefaultLoadouts;
                    x = QUOTE(54.5 * GRID_W);
                    text= CSTRING(tabDefaultLoadoutsText);
                    tooltip= CSTRING(tabDefaultLoadoutsTooltip);
                };
                class buttonSharedLoadoutsBackground: buttonMyLoadoutsBackground {
                    idc = IDC_buttonSharedLoadoutsBackground;
                    x = QUOTE(109 * GRID_W);
                };
                class buttonSharedLoadouts: buttonMyLoadouts {
                    idc = IDC_buttonSharedLoadouts;
                    x = QUOTE(109 * GRID_W);
                    text= CSTRING(tabSharedLoadoutsText);
                    tooltip= CSTRING(tabSharedLoadoutsTooltip);
                };
            };
        };
    };
};
