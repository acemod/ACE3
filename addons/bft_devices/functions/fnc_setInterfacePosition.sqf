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
 *   ["ace_bft_devices_DK10_dlg",[0.2,0.1]] call ace_bft_setInterfacePosition;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName","_xOffset","_yOffset","_display","_isDialog","_backgroundCtrl","_backgroundClassName","_displayConfigContainers","_displayConfigClasses","_idc","_ctrl","_ctrlPosition"];

disableSerialization;

_displayName = _this select 0;
_xOffset = _this select 1 select 0;
_yOffset = _this select 1 select 1;
_display = uiNamespace getVariable _displayName;
_isDialog = I_GET_ISDIALOG;

// get both classes "controls" and "controlsBackground" if they exist
_displayConfigContainers = if (_isDialog) then {
        "true" configClasses (configFile >> _displayName)
    } else {
        "true" configClasses (configFile >> "RscTitles" >> _displayName)
    };

// iterate through the config to find all controls to move, excluding any child controls (i.e. the ones of control groups)
{
    if (isClass _x) then {
        _displayConfigClasses = "true" configClasses _x;
        {
            if (isClass _x) then {
                // only move controls that have an IDC
                if (isNumber (_x >> "idc")) then {
                    // only move controls that have a positive IDC
                    _idc = getNumber (_x >> "idc");
                    if (_idc > 0) then {
                        _ctrl = _display displayCtrl _idc;
                        _ctrlPosition = ctrlPosition _ctrl;
                        _ctrlPosition set [0,(_ctrlPosition select 0) + _xOffset];
                        _ctrlPosition set [1,(_ctrlPosition select 1) + _yOffset];
                        _ctrl ctrlSetPosition _ctrlPosition;
                        _ctrl ctrlCommit 0;
                    } else {diag_log str ["invalid IDC",_x]};
                } else {diag_log str ["missing IDC",_x]};
            };
        } forEach _displayConfigClasses;
    };
} forEach _displayConfigContainers;

true