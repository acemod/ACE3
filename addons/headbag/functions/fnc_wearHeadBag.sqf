#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Add or Remove Display that show when player wear A Headbag
 *
 * Arguments:
 * 0: Modus As Integer(0:Remove Bag Display 1: Add Bag Display)
 * 1: Kind of Mask for Display As String(ClassName)
 *
 * Return Value:
 *
 *
 * Public: No
 */

private["_kindOf", "_Path","_unit","_mode"];
_mode = _this select 0;
_kindOf = _this select 1;
switch _mode do {
    case 0: {
        with uiNameSpace do {
            ctrlDelete GVAR(UI_HeadBagOverlay);

        };
    };
    case 1: {
        _Path = getText(configFile >> "CfgWeapons" >> _kindOf >> QGVAR(Display));
        with uiNameSpace do {
            GVAR(UI_HeadBagOverlay) = (findDisplay 46) ctrlCreate ["RscPicture", -1];
            GVAR(UI_HeadBagOverlay) ctrlSetPosition [safeZoneX, safezoneY, safezoneW, safeZoneH];
            GVAR(UI_HeadBagOverlay) ctrlCommit 0;
            GVAR(UI_HeadBagOverlay) ctrlSetText _Path;

        };
    };
    default {};
};
