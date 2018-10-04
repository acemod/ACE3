#include "script_component.hpp"
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
 *   ["ace_bft_devices_DK10_dlg"] call ace_bft_fnc_getBackgroundPosition;
 *
 * Public: No
 */


#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

params ["_displayName"];

private _display = uiNamespace getVariable _displayName;
private _isDialog = I_GET_ISDIALOG;

// get both classes "controls" and "controlsBackground" if they exist
private _displayConfigContainers = [configFile >> "RscTitles" >> _displayName, configFile >> _displayName] select (_isDialog);
_displayConfigContainers = "true" configClasses _displayConfigContainers;

// get the class name and current position
private _backgroundCtrl = _display displayCtrl IDC_BACKGROUND;
private _backgroundClassName = ctrlClassName _backgroundCtrl;
private _backgroundPosition = ctrlPosition _backgroundCtrl;

// get the original position of the background control
private _backgroundConfigPosition = [];
{
    if (isClass _x && {isClass (_x >> _backgroundClassName)}) exitWith {
        _backgroundConfigPosition = [
            getNumber (_x >> _backgroundClassName >> "x"),
            getNumber (_x >> _backgroundClassName >> "y"),
            getNumber (_x >> _backgroundClassName >> "w"),
            getNumber (_x >> _backgroundClassName >> "h")
        ];
    };
} forEach _displayConfigContainers;

[_backgroundPosition,_backgroundConfigPosition]
