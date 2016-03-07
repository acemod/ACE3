//Main Setting Display:
class GVAR(settingsDisplay) {
    idd = 315;
    onLoad = QUOTE(with uiNamespace do {GVAR(3denDisplay) = _this select 0;};);
    onUnload = QUOTE(_this call FUNC(3den_saveSettings););
    enableSimulation = 1;
    enableDisplay = 1;
    class ControlsBackground {
        class BackgroundDisable: ctrlStaticBackgroundDisable {};
        class BackgroundDisableTiles: ctrlStaticBackgroundDisableTiles {};
        class Background: ctrlStaticBackground {
            x = "((getResolution select 2) * 0.5 * pixelW) - (430 * pixelW)";
            y = "0.5 - (safezoneH min ( 180 * (pixelH * 5))) * 0.5 + 10 * (pixelH * 5)";
            w = "860 * pixelW";
            h = "(safezoneH min ( 180 * (pixelH * 5))) - ( 5 + 10) * (pixelH * 5)";
        };
        class BackgroundButtons: ctrlStaticFooter {
            x = "((getResolution select 2) * 0.5 * pixelW) - (430 * pixelW)";
            y = "0.5 + (safezoneH min ( 180 * (pixelH * 5))) * 0.5 - (2 * 5 + 2) * (pixelH * 5)";
            w = "860 * pixelW";
            h = "( 5 + 2) * (pixelH * 5)";
        };
        class Title: ctrlStaticTitle {
            idc = 200;
            x = "((getResolution select 2) * 0.5 * pixelW) - (430 * pixelW)";
            y = "0.5 - (safezoneH min ( 180 * (pixelH * 5))) * 0.5 + 5 * (pixelH * 5)";
            w = "860 * pixelW";
            h = "5 * (pixelH * 5)";
            text = "ACE Settings: %%s";
        };
        class AttributeCategories: ctrlControlsGroup {
            idc = 201;
            x = "((getResolution select 2) * 0.5 * pixelW) - (430 * pixelW)";
            y = "0.5 - (safezoneH min ( 180 * (pixelH * 5))) * 0.5 + 11 * (pixelH * 5) + pixelH";
            w = "860 * pixelW";
            h = "(safezoneH min ( 180 * (pixelH * 5))) - (2 * 5 + 10 + 3) * (pixelH * 5)";
            class Controls {
            };
        };
        class ButtonOK: ctrlButtonOK {
            x = "((getResolution select 2) * 0.5 * pixelW) + ( 86 - 50 - 2) * (pixelW * 5)";
            y = "0.5 + (safezoneH min ( 180 * (pixelH * 5))) * 0.5 - (2 * 5 + 1) * (pixelH * 5)";
            w = "25 * (pixelW * 5)";
            h = "5 * (pixelH * 5)";
            onButtonDown = "ctrlsetfocus (_this select 0);";
        };
        class ButtonCancel: ctrlButtonCancel {
            x = "((getResolution select 2) * 0.5 * pixelW) + ( 86 - 25 - 1) * (pixelW * 5)";
            y = "0.5 + (safezoneH min ( 180 * (pixelH * 5))) * 0.5 - (2 * 5 + 1) * (pixelH * 5)";
            w = "25 * (pixelW * 5)";
            h = "5 * (pixelH * 5)";
        };
    };
    class Controls {};
};

//Category group:
class GVAR(AttributeCategory): ctrlControlsGroupNoScrollbars {
    y = "2 * pixelH";
    w = "860 * pixelW";
    class Controls {
        class Minimize: ctrlCheckbox {
            idc = 7001;
            x = "0 * (pixelW * 5)";
            y = 0;
            w = "5 * (pixelW * 5)";
            h = "5 * (pixelH * 5)";
            textureChecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
            textureUnchecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
            textureFocusedUnchecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
            textureHoverUnchecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
            texturePressedUnchecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureChecked_ca.paa";
            textureDisabledUnchecked = "\a3\3DEN\Data\Displays\Display3DENEditAttributes\textureUnchecked_ca.paa";
            color[] = {1,1,1,0.5};
            colorFocused[] = {1,1,1,0.5};
            colorHover[] = {1,1,1,0.5};
            colorPressed[] = {1,1,1,0.5};
            colorDisabled[] = {1,1,1,0.5};
            onCheckedChanged = QUOTE(_this call FUNC(3den_resizeSubcatagoies););
        };
        class Title: ctrlButton {
            idc = 7002;
            x = "5 * (pixelW * 5)";
            y = "pixelH";
            w = "820 * pixelW";
            h = "5 * (pixelH * 5)";
            style = "0x10 + 0x200";
            font = "RobotoCondensedLight";
            sizeEx = "4.32 * (1 / (getResolution select 3)) * 5";
            colorText[] = {1,1,1,0.5};
            colorBackground[] = {0.2,0.2,0.2,1};
            colorFocused[] = {0.2,0.2,0.2,1};
            colorBackgroundActive[] = {0.2,0.2,0.2,1};
            colorShadow[] = {1,1,1,0.5};
            offsetX = 0;
            offsetY = "-pixelH";
            offsetPressedX = 0;
            offsetPressedY = 0;
            onButtonClick = "_ctrlCheckbox = _this select 0; _ctrlGroup = ctrlParentControlsGroup _ctrlCheckbox; (_ctrlGroup controlsGroupCtrl 7001) cbSetChecked !cbChecked (_ctrlGroup controlsGroupCtrl 7001);";
        };
        class Attributes: ctrlControlsGroupNoScrollbars {
            idc = 7003;
            y = "25 * pixelH";
            w = "860 * pixelW";
            class Controls {};
        };
    };
};

//Setting control groups (note: inheritace seemed to cause trouble, so some duplicattion for now)

class GVAR(scalar): ctrlControlsGroupNoScrollbars {
    w = "860 * pixelW";
    h = "25 * pixelH";
    class Controls {
        class Forced: ctrlCheckboxBaseline {
            idc = 1000;
            x = "0";
            w = "25 * pixelW";
            h = "25 * pixelH";
        };
        class Title: ctrlStatic {
            idc = 2000;
            style = 1;
            x = "25 * pixelW";
            w = "319 * pixelW";
            h = "25 * pixelH";
            colorBackground[] = {0,0,0,0};
        };
        class Value: ctrlEdit {
            idc = 3000;
            x = "(25+319) * pixelW";
            w = "150 * pixelW";
            h = "25 * pixelH";
        };
    };
};
class GVAR(scalarCombo): ctrlControlsGroupNoScrollbars {
    w = "860 * pixelW";
    h = "25 * pixelH";
    class Controls {
        class Forced: ctrlCheckboxBaseline {
            idc = 1000;
            x = "0";
            w = "25 * pixelW";
            h = "25 * pixelH";
        };
        class Title: ctrlStatic {
            idc = 2000;
            style = 1;
            x = "25 * pixelW";
            w = "319 * pixelW";
            h = "25 * pixelH";
            colorBackground[] = {0,0,0,0};
        };
        class Value: ctrlCombo {
            idc = 3000;
            x = "(25+319) * pixelW";
            w = "516 * pixelW";
            h = "25 * pixelH";
            onLbSelChanged = "_ctrlCheckbox = _this select 0; _ctrlGroup = ctrlParentControlsGroup _ctrlCheckbox; (_ctrlGroup controlsGroupCtrl 1000) cbSetChecked true;";
        };
    };
};
class GVAR(bool): ctrlControlsGroupNoScrollbars {
    w = "860 * pixelW";
    h = "25 * pixelH";
    class Controls {
        class Forced: ctrlCheckboxBaseline {
            idc = 1000;
            x = "0";
            w = "25 * pixelW";
            h = "25 * pixelH";
        };
        class Title: ctrlStatic {
            idc = 2000;
            style = 1;
            x = "25 * pixelW";
            w = "319 * pixelW";
            h = "25 * pixelH";
            colorBackground[] = {0,0,0,0};
        };
        class Value: ctrlToolbox {
            idc = 3000;
            style = "0x02";
            x = "(25+319) * pixelW";
            w = "150 * pixelW";
            h = "25 * pixelH";
            rows = 1;
            columns = 2;
            strings[] = {"$STR_A3_OPTIONS_DISABLED", "$STR_A3_OPTIONS_ENABLED"};
            onToolBoxSelChanged = "_ctrlCheckbox = _this select 0; _ctrlGroup = ctrlParentControlsGroup _ctrlCheckbox; (_ctrlGroup controlsGroupCtrl 1000) cbSetChecked true;";
        };
    };
};
