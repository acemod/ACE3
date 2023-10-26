#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Replaces the vehicle clan logo with an empty texture.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_novehicleclanlogo_fnc_removeClanLogo
 *
 * Public: Yes
 */

params ["_vehicle"];

private _selectionClan = getText (configOf _vehicle >> "selectionClan");
if !(_selectionClan in selectionNames _vehicle) exitWith {
    TRACE_2("vehicle does not have 'selectionClan' selection",_vehicle,_selectionClan);
};

if (_vehicle getVariable [QEGVAR(tagging,hasTag), false]) exitWith {
    TRACE_1("vehicle has tag applied",_vehicle);
};

TRACE_1("replacing clan logo with empty texture",_vehicle);
_vehicle setObjectTextureGlobal [_selectionClan, "#(argb,1,1,1)color(0,0,0,0)"] // return
