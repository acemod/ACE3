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
&& {2 > locked _vehicle}
&& {
    private _ejectVarName = "";
    {
        if (_unit == _x select 0) exitWith {
            _x params ["", "_role", "_cargoIndex", "_turretPath"];
            if (switch (toLower _role) do {
                case "driver": {!lockedDriver _vehicle};
                case "cargo": {!(_vehicle lockedCargo _cargoIndex)};
                default {!(_vehicle lockedTurret _turretPath)};
            }) then {
                _ejectVarName = format [QGVAR(ejectAction_%1_%2), _role, _turretPath];
            };
        };
    } count fullCrew _vehicle;
    _vehicle getVariable [_ejectVarName, false]
}
