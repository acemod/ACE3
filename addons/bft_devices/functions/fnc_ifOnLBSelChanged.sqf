#include "script_component.hpp"
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


// ignore function call if the interface has not finished setup
if (GVAR(ifOpenStart) || I_CLOSED) exitWith {true};

params ["_function", "_controlArguments"];
_controlArguments params ["_control", "_selectedIndex"];
systemChat format ["this %1 _control %2 _selectedIndex %3", _this, _control, _selectedIndex];

private _display = ctrlParent _control;
private _interfaceID = I_GET_ID;

switch (_function) do {
    case "UAVlist": {
        if (_selectedIndex != -1) then {
            [_interfaceID,[['uavCam',_control lbData _selectedIndex]]] call FUNC(setSettings);
        };
    };
    case "HCAMlist": {
        if (_selectedIndex != -1) then {
            [_interfaceID,[['hCam',_control lbData _selectedIndex]]] call FUNC(setSettings);
        };
    };
};

true
