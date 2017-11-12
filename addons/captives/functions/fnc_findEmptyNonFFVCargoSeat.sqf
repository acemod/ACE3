/*
 * Author: PabstMirror
 * Finds a free cargo seat, searching non FFV first
 *
 * Arguments:
 * 0: The Vehicle <OBJECT>
 *
 * Return Value:
 * ARRAY [seat index <NUMBER>, is FFV <BOOL>]
 *
 * Example:
 * [car1] call ACE_captives_fnc_findEmptyNonFFVCargoSeat
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params", _vehicle);

scopeName "main";

{
    _x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret"];
    if (isNull _unit && {_role == "cargo"} && {_cargoIndex > -1} && {!_isPersonTurret}) then {
        [_cargoIndex, false] breakOut "main";
    };
} forEach (fullCrew [_vehicle, "", true]);

{
    _x params ["_unit", "_role", "_cargoIndex", "_turretPath", "_isPersonTurret"];
    if (isNull _unit && {_cargoIndex > -1}) then {
        [_cargoIndex, true] breakOut "main";
    };
} forEach (fullCrew [_vehicle, "", true]);

[-1, false]
