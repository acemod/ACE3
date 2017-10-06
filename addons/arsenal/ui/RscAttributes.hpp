#include "script_component.hpp"
#include "RscCommon.hpp"
#include "..\defines.hpp"

class GVAR(display) {
    idd = 1127001;
    enableSimulation=1;
    onLoad = QUOTE([ARR_3('onLoad', _this, QQGVAR(display))] call FUNC(onArsenalOpen));
    onUnload = QUOTE([ARR_3('onUnload', _this, QQGVAR(display))] call FUNC(onArsenalClose));
    onKeyDown = QUOTE([ARR_3('onKeyDown', _this, QQGVAR(display))] call FUNC(onArsenalKeyDown));
    onMouseButtonDown = QUOTE([ARR_3('onMouseButtonDown', _this, QQGVAR(display))] call FUNC(onArsenalMouseButtonDown));
    onMouseButtonUp = QUOTE([ARR_3('onMouseButtonUp', _this, QQGVAR(display))] call FUNC(onArsenalMouseButtonUp));
    icon="\A3\Ui_f\data\Logos\a_64_ca.paa";
    logo="\A3\Ui_f\data\Logos\arsenal_1024_ca.paa";
    class ControlsBackground {
        class blackLeft: ctrlStatic {
            colorBackground[]={0,0,0,1};
            x = safezoneXAbs;
            y = safezoneY;
            w = safezoneXAbs - safezoneX;
            h = safezoneH;
        };

        class blackRight: blackLeft {
            x = safezoneX + safezoneW;
        };

        class mouseArea: ctrlStatic {
            idc = IDC_mouseArea;
            style = 16;
            onMouseMoving = QUOTE([ARR_3('onMouseMoving', _this, GVAR(display))] call FUNC(arsenalHandleMouse));
            onMouseHolding = QUOTE([ARR_3('onMouseHolding', _this, GVAR(display))] call FUNC(arsenalHandleMouse));
            onMouseZChanged = QUOTE([ARR_3('onMouseZChanged', _this, GVAR(display))] call FUNC(arsenalHandleScrollWheel));
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };
    class controls {
        class blockLeftFrame: RscFrame {
            idc = IDC_blockLeftFrame;
            x = safezoneX + 15 * GRID_W;
            y = safezoneY + 14 * GRID_H;
            w = 70 * GRID_W;
            h = safezoneH - 22 * GRID_H;
            colorText[] = {0,0,0,1};
        };
        class blockLeftBackground: ctrlStaticBackground {
            idc = IDC_blockLeftBackground;
            x = safezoneX + 15 * GRID_W;
            y = safezoneY + 14 * GRID_H;
            w = 70 * GRID_W;
            h = safezoneH - 22 * GRID_H;
            colorBackground[] = {0,0,0,0.5};
        };
        class blockRightFrame: blockLeftFrame {
            idc = IDC_blockRightFrame;
            x = safezoneX + safezoneW - 85 * GRID_W;
            h = safezoneH + safezoneY - 62 * GRID_H;
        };
        class blockRighttBackground: blockLeftBackground {
            idc = IDC_blockRighttBackground;
            x = safezoneX + safezoneW - 85 * GRID_W;
            h = safezoneH + safezoneY - 62 * GRID_H;
        };
        class loadIndicator: ctrlProgress {
            idc = IDC_loadIndicator;
            fade = 0;
            style = 0;
            texture = "#(argb,8,8,3)color(1,1,1,1)";
            colorBar[] = {1,1,1,1};
            colorFrame[] = {0,0,0,1};
            x = safezoneX + safezoneW - 85 * GRID_W;
            y = safezoneY + 131 * GRID_H;
            w = 70 * GRID_W;
            h = 7 * GRID_H;
        };
        class message: RscText {
            idc = IDC_message;
            fade = 1;
            style=2;
            shadow=0;
            colorBackground[]={0,0,0,0.69999999};
            text="";
            x = safezoneX + safezoneW * 0.50 - 75 * GRID_W;
            y = safeZoneH + safezoneY - 25 * GRID_H;
            w = 150 * GRID_W;
            h = 10 * GRID_H;
            sizeEx = 5 * GRID_H;
        };
        class menuBar: RscControlsGroupNoScrollbars {
            idc = IDC_menuBar;
            x = safezoneX + safezoneW * 0.50 - 75 * GRID_W;
            y = safeZoneH + safezoneY - 10 * GRID_H;
            w = 150 * GRID_W;
            h = 7 * GRID_H;
            class controls {
                class menuBarBackground: ctrlStaticBackground {
                    idc = IDC_menuBarBackground;
                    x = 0;
                    y = 0;
                    w = 150 * GRID_W;
                    h = 7 * GRID_H;
                    colorBackground[] = {0,0,0,1};
                };
                class buttonClose: ctrlButtonClose {
                    idc = IDC_buttonClose;
                    x = 0;
                    y = 0;
                    w = 25 * GRID_W;
                    h = 7 * GRID_H;
                    text="Close"; // TBL
                    shortcuts[]= {"0x01"};
                    tooltip="Close interface"; // TBL
                };
                class buttonSave: ctrlButton {
                    idc = IDC_buttonSave;
                    x = 25 * GRID_W;
                    y = 0;
                    w = 25 * GRID_W;
                    h = 7 * GRID_H;
                    text="Save"; // TBL
                    tooltip="Save loadout"; // TBL
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(arsenalButtonSave));
                };
                class buttonLoad: buttonSave {
                    idc = IDC_buttonLoad;
                    x = 50 * GRID_W;
                    text="Load"; // TBL
                    tooltip="Load loadout"; // TBL
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(arsenalButtonLoad));
                };
                class buttonImport: buttonSave {
                    idc = IDC_buttonImport;
                    x = 75 * GRID_W;
                    text="Import"; // TBL
                    tooltip="Import loadout"; // TBL
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(arsenalButtonImport));
                };
                class buttonExport: buttonSave {
                    idc = IDC_buttonExport;
                    x = 100 * GRID_W;
                    text="Export"; // TBL
                    tooltip="Export loadout"; // TBL
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(arsenalButtonExport));
                };
                class buttonHide: buttonSave {
                    idc = IDC_buttonHide;
                    x = 125 * GRID_W;
                    text="Hide"; // TBL
                    shortcuts[]= {"0x0E"};
                    tooltip="Hide interface"; // TBL
                    onButtonClick = QUOTE([ctrlparent (_this select 0)] call FUNC(arsenalButtonHide));
                };
            };
        };
        class infoBox: RscControlsGroupNoScrollbars {
            idc = IDC_infoBox;
            fade = 1;
            x = safezoneX + safezoneW - 100 * GRID_W;
            y = safezoneH - 75 * GRID_H;
            w = 85 * GRID_W;
            h = 15 * GRID_H;
            class controls {
                class infoBackground: ctrlStaticBackground {
                    idc = IDC_infoBackground;
                    x = 15 * GRID_W;
                    y = 0;
                    w = 70 * GRID_W;
                    h = 15 * GRID_H;
                    colorBackground[] = {0,0,0,0.8};
                };
                class infoName: RscText {
                    idc = IDC_infoName;
                    x = 15 * GRID_W;
                    y = 0;
                    w = 70 * GRID_W;
                    h = 8 * GRID_H;
                    sizeEx = 8 * GRID_H; 
                };
                class infoAuthor: RscText {
                    idc = IDC_infoAuthor;
                    colorText[] = {1,1,1,0.5};
                    x = 17 * GRID_W;
                    y = 8 * GRID_H;
                    w = 70 * GRID_W;
                    h = 6 * GRID_H;
                    sizeEx = 5 * GRID_H; 
                };
                class DLCBackground: ctrlStaticBackground {
                    idc = IDC_DLCBackground;
                    fade = 1;
                    x = 0;
                    y = 0;
                    w = 15 * GRID_W;
                    h = 15 * GRID_H;
                };
                class DLCIcon: RscActivePicture {
                    idc = IDC_DLCIcon;
                    enabled = 0;
                    fade = 1;
                    color[] = {1,1,1,1};
                    colorActive[] = {1,1,1,1};
                    text="#(argb,8,8,3)color(1,1,1,1)";
                    x = 0;
                    y = 0;
                    w = 15 * GRID_W;
                    h = 15 * GRID_H;
                };
            };
        };
        class stats: RscControlsGroupNoScrollbars{
            idc = IDC_stats;
            fade=1;
            enable=0;
            x = safezoneX + safezoneW - 85 * GRID_W;
            y = safezoneH - 145 * GRID_H;
            w = 68 * GRID_W;
            h = 61 * GRID_H;
            class controls {
                class statsBackground: ctrlStaticBackground {
                    idc = IDC_statsBackground;
                    x = 0;
                    y = 0;
                    w = 70 * GRID_W;
                    h = 65 * GRID_H;
                    colorBackground[]={0,0,0,0.5};
                };
                class stat1: ctrlProgress {
                    colorBar[]={1,1,1,1};
                    colorFrame[]={0,0,0,1};
                    x = 1.5 * GRID_W;
                    y = 1 * GRID_H;
                    w = 65 * GRID_W;
                    h = 6.5 * GRID_H;
                };
                class stat2: stat1 {
                    y = 8.5 * GRID_H;
                };
                class stat3: stat1 {
                    y = 16 * GRID_H;
                };
                class stat4: stat1 {
                    y = 23.5 * GRID_H;
                };
                class stat5: stat1 {
                    y = 31 * GRID_H;
                };
                class stat6: stat1 {
                    y = 38.5 * GRID_H;
                };
                class stat7: stat1 {
                    y = 46 * GRID_H;
                };
                class stat8: stat1 {
                    y = 53.5 * GRID_H;
                };
                class statText1: RscText {
                    shadow=0;
                    colorShadow[]={1,1,1,1};
                    colorText[]={0,0,0,1};
                    colorBackground[]={1,1,1,0.1};
                    text = "teeeeeest"; // TBR
                    x = 1.5 * GRID_W;
                    y = 1 * GRID_H;
                    w = 40 * GRID_W;
                    h = 6 * GRID_H;
                };
                class statText2: statText1 {
                    y = 8.5 * GRID_H;
                };
                class statText3: statText1 {
                    y = 16 * GRID_H;
                };
                class statText4: statText1 {
                    y = 23.5 * GRID_H;
                };
                class statText5: statText1 {
                    y = 31 * GRID_H;
                };
                class statText6: statText1 {
                    y = 38.5 * GRID_H;
                };
                class statText7: statText1 {
                    y = 46 * GRID_H;
                };
                class statText8: statText1 {
                    y = 53.5 * GRID_H;
                };
            };
        };
        class mouseBlock: RscText {
            idc = IDC_mouseBlock;
            style=16;
            x="safezoneX";
            y="safezoneY";
            w="safezoneW";
            h="safezoneH";
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
            x = safezoneX + 15 * GRID_W;
            y = safezoneY + 15 * GRID_H;
            w = 70 * GRID_W;
            h = safezoneH - 22 * GRID_H;
        };
        class rightTabContent: leftTabContent {
            idc = IDC_rightTabContent;
            x = safezoneX + safezoneW - 85 * GRID_W;
            h = safezoneH + safezoneY - 62 * GRID_H;
        };
        class sortLeftTab: ctrlCombo {
            idc = IDC_sortLeftTab;
            x = safezoneX + 15 * GRID_W;
            y = safezoneY + 8 * GRID_H;
            w = 70 * GRID_W;
            h = 6 * GRID_H;
            class Items {
                class Alphabet {
                    text="$STR_a3_rscdisplayarsenal_sort_alphabet";
                    default=1;
                };
                class Mod {
                    text="$STR_a3_rscdisplayarsenal_sort_mod";
                };
            };
        };
        class sortRightTab: sortLeftTab {
            idc = IDC_sortRightTab;
            x = safezoneX + safezoneW - 85 * GRID_W;
        };
        class leftSearchbar: ctrlEdit {
            idc = IDC_leftSearchbar;
            x = safezoneX + 15 * GRID_W;
            y = safezoneY + 1.8 * GRID_H;
            w = 70 * GRID_W;
            h = 6 * GRID_H;
        };
        class rightSearchbar: leftSearchBar{
            idc = IDC_rightSearchbar;
            x = safezoneX + safezoneW - 85 * GRID_W;
        };
        class tabLeft: RscControlsGroupNoScrollbars {
            idc = IDC_tabLeft;
            x = safezoneX + 3 * GRID_W;
            y = safezoneY + 8 * GRID_H;
            w = 9 * GRID_W;
            h = 200 * GRID_H;
            class controls {
                class iconBackgroundPrimaryWeapon: RscPicture {
                    idc = IDC_iconBackgroundPrimaryWeapon;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    colorText[]={0,0,0,0.8};
                    x = 0;
                    y = 0 * GRID_H;
                    w = 9 * GRID_W;
                    h = 9 * GRID_H;
                };
                class buttonPrimaryWeapon: RscButtonArsenal{
                    idc = ;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_PrimaryWeapon";
                    colorBackground[]={0,0,0,0.5};
                    x = 0;
                    y = 0 * GRID_H;
                    w = 9 * GRID_W;
                    h = 9 * GRID_H;
                };
                class iconBackgroundHandgun: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundHandgun;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    y = 10 * GRID_H;
                };
                class buttonHandgun: buttonPrimaryWeapon {
                    idc = IDC_buttonHandgun;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Handgun";
                   y = 10 * GRID_H;
                };
                class iconBackgroundSecondaryWeapon: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundSecondaryWeapon;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = 20 * GRID_H;
                };
                class buttonSecondaryWeapon: buttonPrimaryWeapon {
                    idc = IDC_buttonSecondaryWeapon;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_SecondaryWeapon";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = 20 * GRID_H;
                };
                class iconBackgroundHeadgear: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundHeadgear;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa";
                    y = 30 * GRID_H;
                };
                class buttonHeadgear: buttonPrimaryWeapon {
                    idc = IDC_buttonHeadgear;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Headgear";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa";
                    y = 30 * GRID_H;
                };
                class iconBackgroundUniform: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundUniform;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa";
                    y = 40 * GRID_H;
                };
                class buttonUniform: buttonPrimaryWeapon {
                    idc = IDC_buttonUniform;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Uniform";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa";
                    y = 40 * GRID_H;
                };
                class iconBackgroundVest: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundVest;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa";
                    y = 50 * GRID_H;
                };
                class buttonVest: buttonPrimaryWeapon {
                    idc = IDC_buttonVest;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Vest";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa";
                    y = 50 * GRID_H;
                };
                class iconBackgroundBackpack: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundBackpack;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa";
                    y = 60 * GRID_H;
                };
                class buttonBackpack: buttonPrimaryWeapon {
                    idc = IDC_buttonBackpack;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Backpack";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa";
                    y = 60 * GRID_H;
                };
                class iconBackgroundGoggles: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundGoggles;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa";
                    y = 70 * GRID_H;
                };
                class buttonGoggles: buttonPrimaryWeapon {
                    idc = IDC_buttonGoggles;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Goggles";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Goggles_ca.paa";
                    y = 70 * GRID_H;
                };
                class iconBackgroundNVG: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundNVG;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa";
                    y = 80 * GRID_H;
                };
                class buttonNVG: buttonPrimaryWeapon {
                    idc = IDC_buttonNVG;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_NVGs";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa";
                    y = 80 * GRID_H;
                };
                class iconBackgroundBinoculars: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundBinoculars;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa";
                    y = 90 * GRID_H;
                };
                class buttonBinoculars: buttonPrimaryWeapon {
                    idc = IDC_buttonBinoculars;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Binoculars";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa";
                    y = 90 * GRID_H;
                };
                class iconBackgroundMap: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundMap;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa";
                    y = 100 * GRID_H;
                };
                class buttonMap: buttonPrimaryWeapon {
                    idc = IDC_buttonMap;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Map";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Map_ca.paa";
                    y = 100 * GRID_H;
                };
                class iconBackgroundGPS: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundGPS;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa";
                   y = 110 * GRID_H;
                };
                class buttonGPS: buttonPrimaryWeapon {
                    idc = IDC_buttonGPS;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_GPS";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa";
                    y = 110 * GRID_H;
                };
                class iconBackgroundRadio: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundRadio;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa";
                    y = 120 * GRID_H;
                };
                class buttonRadio: buttonPrimaryWeapon {
                    idc = IDC_buttonRadio;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Radio";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa";
                    y = 120 * GRID_H;
                };
                class iconBackgroundCompass: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundCompass;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa";
                    y = 130 * GRID_H;
                };
                class buttonCompass: buttonPrimaryWeapon {
                    idc = IDC_buttonCompass;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Compass";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Compass_ca.paa";
                    y = 130 * GRID_H;
                };
                class iconBackgroundWatch: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundWatch;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa";
                    y = 140 * GRID_H;
                };
                class buttonWatch: buttonPrimaryWeapon {
                    idc = IDC_buttonWatch;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Watch";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Watch_ca.paa";
                    y = 140 * GRID_H;
                };
                class iconBackgroundFace: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundFace;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Face_ca.paa";
                    y = 150 * GRID_H;
                };
                class buttonFace: buttonPrimaryWeapon {
                    idc = IDC_buttonFace;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Face";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Face_ca.paa";
                    y = 150 * GRID_H;
                };
                class iconBackgroundVoice: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundVoice;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Voice_ca.paa";
                    y = 160 * GRID_H;
                };
                class buttonVoice: buttonPrimaryWeapon {
                    idc = IDC_buttonVoice;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Voice";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Voice_ca.paa";
                    y = 160 * GRID_H;
                };
                class iconBackgroundInsigna: IconBackgroundPrimaryWeapon {
                    idc = IDC_iconBackgroundInsigna;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Insignia_ca.paa";
                    y = 170 * GRID_H;
                };
                class buttonInsigna: buttonPrimaryWeapon {
                    idc = IDC_buttonInsigna;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Insignia";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Insignia_ca.paa";
                    y = 170 * GRID_H;
                };
            };
        };
        class tabRight: RscControlsGroupNoScrollbars{
            idc = IDC_tabRight;
            x = safezoneW  + safezoneX - 12 * GRID_W;
            y = safezoneY + 8 * GRID_H;
            w = 9 * GRID_W;
            h = 200 * GRID_H;
            class controls {
                class iconBackgroundOptic: RscPicture {
                    idc = IDC_iconBackgroundOptic;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
                    colorText[]={0,0,0,0.8};
                    x = 0;
                    y = 0 * GRID_H;
                    w = 9 * GRID_W;
                    h = 9 * GRID_H;
                };
                class buttonOptic: RscButtonArsenal {
                    idc = IDC_buttonOptic;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemOptic";
                    colorBackground[]={0,0,0,0.5};
                    x = 0;
                    y = 0 * GRID_H;
                    w = 9 * GRID_W;
                    h = 9 * GRID_H;
                };
                class iconBackgroundItemAcc: iconBackgroundOptic {
                    idc = IDC_iconBackgroundItemAcc;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa";
                    y = 10 * GRID_H;
                };
                class buttonItemAcc: buttonOptic {
                    idc = IDC_buttonItemAcc;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemAcc";
                    y = 10 * GRID_H;
                };
                class iconBackgroundMuzzle: iconBackgroundOptic {
                    idc = IDC_iconBackgroundMuzzle;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa";
                    y = 20 * GRID_H;
                };
                class buttonMuzzle: buttonOptic {
                    idc = IDC_buttonMuzzle;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemMuzzle";
                    y = 20 * GRID_H;
                };
                class iconBackgroundBipod: iconBackgroundOptic {
                    idc = IDC_iconBackgroundBipod;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa";
                    y = 30 * GRID_H;
                };
                class buttonBipod: buttonOptic {
                    idc = IDC_buttonBipod;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemBipod";
                    y = 30 * GRID_H;
                };
                class iconBackgroundMag: iconBackgroundOptic {
                    idc = IDC_iconBackgroundMag;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
                    y = 40 * GRID_H;
                };
                class buttonMag: buttonOptic {
                    idc = IDC_buttonMag;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMag_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMag";
                    y = 40 * GRID_H;
                };
                class iconBackgroundMagALL: iconBackgroundOptic {
                    idc = IDC_iconBackgroundMagALL;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa";
                    y = 50 * GRID_H;
                };
                class buttonMagALL: buttonOptic {
                    idc = IDC_buttonMagALL;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMagAll";
                    y = 50 * GRID_H;
                };
                class iconBackgroundThrow: iconBackgroundOptic {
                    idc = IDC_iconBackgroundThrow;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa";
                    y = 60 * GRID_H;
                };
                class buttonThrow: buttonOptic {
                    idc = IDC_buttonThrow;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoThrow";
                    y = 60 * GRID_H;
                };
                class iconBackgroundPut: iconBackgroundOptic {
                    idc = IDC_iconBackgroundPut;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa";
                    y = 70 * GRID_H;
                };
                class buttonPut: buttonOptic {
                    idc = IDC_buttonPut;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoPut";
                    y = 70 * GRID_H;
                };
                class iconBackgroundMisc: iconBackgroundOptic {
                    idc = IDC_iconBackgroundMisc;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
                    y = 80 * GRID_H;
                };
                class buttonMisc: buttonOptic {
                    idc = IDC_buttonMisc;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMisc";
                    y = 80 * GRID_H;
                };
            };
        };
        class tabRight2: RscControlsGroupNoScrollbars {
            idc = IDC_tabRight2;
            x = safezoneX + safezoneW - 96 * GRID_W;
            y = safezoneH - 175 * GRID_H;
            w = 9 * GRID_W;
            h = 19 * GRID_H;
            class controls {
                class buttonRemoveAll: RscButtonArsenal {
                    idc = IDC_buttonRemoveAll;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
                    tooltip="Remove all items from the container"; //TBL
                    colorBackground[]={0,0,0,0.5};
                    x = 0;
                    y = 0 * GRID_H;
                    w = 9 * GRID_W;
                    h = 9 * GRID_H;
                };
                class buttonRemoveAllSelected: buttonRemoveAll {
                    idc = IDC_buttonRemoveAllSelected;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
                    tooltip="Remove all selected items"; //TBL
                    y = 10 * GRID_H;
                };
            };
        };
    };
};
