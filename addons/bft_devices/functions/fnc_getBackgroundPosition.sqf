/*
 * Author: Gundy
 *
 * Description:
 *   Get the current and config position of the interface background element
 *
 * Arguments:
 *   0: uiNamespace variable name of interface <STRING>
 *
 * Return Value:
 *   Interface position and config position <ARRAY>
 *      0: Interface position in the form of [x,y,w,h] <ARRAY>
 *      1: Interface config position in the form of [x,y,w,h], empty array if background could not be found <ARRAY>
 *
 * Example:
 *   ["ace_bft_devices_DK10_dlg"] call ace_bft_getBackgroundPosition;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private ["_displayName","_display","_isDialog","_backgroundCtrl","_backgroundClassName","_backgroundPosition","_backgroundConfigPosition","_displayConfigContainers"];

_displayName = _this select 0;
_display = uiNamespace getVariable _displayName;
_isDialog = I_GET_ISDIALOG;

// get both classes "controls" and "controlsBackground" if they exist
_displayConfigContainers = if (_isDialog) then {
        "true" configClasses (configFile >> _displayName)
    } else {
        "true" configClasses (configFile >> "RscTitles" >> _displayName)
    };

// get the class name and current position
_backgroundCtrl = _display displayCtrl IDC_BACKGROUND;
_backgroundClassName = ctrlClassName _backgroundCtrl;
_backgroundPosition = ctrlPosition _backgroundCtrl;

// get the original position of the background control
_backgroundConfigPosition = [];
{
    if (isClass _x) then {
        if (isClass (_x >> _backgroundClassName)) exitWith {
            _backgroundConfigPosition = [
                    getNumber (_x >> _backgroundClassName >> "x"),
                    getNumber (_x >> _backgroundClassName >> "y"),
                    getNumber (_x >> _backgroundClassName >> "w"),
                    getNumber (_x >> _backgroundClassName >> "h")
                ];
        };
    };
} forEach _displayConfigContainers;

[_backgroundPosition,_backgroundConfigPosition]