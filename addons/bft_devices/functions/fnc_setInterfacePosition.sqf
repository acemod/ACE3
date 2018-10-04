#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 *   Move the whole interface by a provided offset
 *
 * Arguments:
 *   0: uiNamespace variable name of interface <STRING>
 *   1: offset in the form of [x,y] <ARRAY>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["ace_bft_devices_DK10_dlg",[0.2,0.1]] call ace_bft_fnc_setInterfacePosition;
 *
 * Public: No
 */


disableSerialization;

params ["_displayName", "_offset"];
_offset params ["_xOffset", "_yOffset"];
systemChat format ["offset %1 %2", _xOffset, _yOffset];
private _display = uiNamespace getVariable _displayName;
private _isDialog = I_GET_ISDIALOG;

// get both classes "controls" and "controlsBackground" if they exist
private _displayConfigContainers = [configFile >> "RscTitles" >> _displayName, configFile >> _displayName] select (_isDialog);
_displayConfigContainers = "true" configClasses _displayConfigContainers;

// iterate through the config to find all controls to move, excluding any child controls (i.e. the ones of control groups)
{
    if (isClass _x) then {
        private _displayConfigClasses = "true" configClasses _x;
        {
            if (isClass _x && {isNumber (_x >> "idc")}) then {
                // only move controls that have a positive IDC
                private _idc = getNumber (_x >> "idc");
                if (_idc > 0) then {
                    private _ctrl = _display displayCtrl _idc;
                    private _ctrlPosition = ctrlPosition _ctrl;
                    _ctrlPosition set [0, (_ctrlPosition select 0) + _xOffset];
                    _ctrlPosition set [1, (_ctrlPosition select 1) + _yOffset];
                    _ctrl ctrlSetPosition _ctrlPosition;
                    _ctrl ctrlCommit 0;
                } else {diag_log str ["invalid IDC",_x]};
            };
        } forEach _displayConfigClasses;
    };
} forEach _displayConfigContainers;

true
