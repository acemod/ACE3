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

params [["_unit", objNull, [objNull]], ["_vehicle", objNull, [objNull]]];

_vehicle == vehicle _unit
&& {_vehicle getVariable [
    // handle race when unit gets out of vehicle
    call {
        private _return = {
            _x params ["_owner", "_role", "", "_turretPath"];
            if (_unit == _owner) exitWith {
                format ["%1_%2_%3", QGVAR(ejectAction), _role, _turretPath]
            };
            false
        } count fullCrew _vehicle;
        // getVariable ["", ...] returns default value
        ["", _return] select (_return isEqualType "")
    },
    false
]}
