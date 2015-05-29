/*
 * Author: Gundy
 *
 * Description:
 *   Called from various interface list boxes and executes the appropriate function
 *
 * Arguments:
 *   0: Function to trigger <STRING>
 *   1: _this variable from the onLBSelChanged event <ARRAY>
 *     0: Interface control <OBJECT>
 *     1: Selected item (-1 if nothing is selected) <INTEGER>
 *     2: 
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["UAVlist",_this] call ace_bft_devices_fnc_ifOnLBSelChanged;
 *
 * Public: No
 */

private [];

#include "script_component.hpp"

// ignore function call if the interface has not finished setup
if (GVAR(ifOpenStart) || I_CLOSED) exitWith {true};

_function = _this select 0;
_control = _this select 1 select 0;
_display = ctrlParent _control;
_displayName = I_GET_NAME;
_selectedIndex = _this select 1 select 1;

switch (_function) do {
    case "UAVlist": {
        if (_selectedIndex != -1) then {
            [_displayName,[['uavCam',_control lbData _selectedIndex]]] call FUNC(setSettings);
        };
    };
    case "HCAMlist": {
        if (_selectedIndex != -1) then {
            [_displayName,[['uavCam',_control lbData _selectedIndex]]] call FUNC(setSettings);
        };
    };
};

true