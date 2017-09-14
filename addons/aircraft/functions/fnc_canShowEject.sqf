/*
 * Author: Dystopian
 * Check if Eject action can be shown.
 *
 * Arguments:
 * 0: Unit who calls action <OBJECT>
 * 1: Vehicle which action is attached to <OBJECT>
 *
 * Return Value:
 * Can show <BOOL>
 *
 * Example:
 * [player, vehicle player] call ace_aircraft_fnc_canShowEject
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_vehicle"];

_vehicle == vehicle _unit
&& {
    private _ejectVarName = "";
    {
        if (_unit == _x select 0) exitWith {
            _ejectVarName = format [QGVAR(ejectAction_%1), _x select 3];
        };
    } count fullCrew _vehicle;
    _vehicle getVariable [_ejectVarName, false]
}
