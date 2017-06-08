/*
 * Author: GitHawk
 * Rearms a vehicle.
 *
 * Arguments:
 * 0: Params <ARRAY>
 *   0: Vehicle <OBJECT>
 *   1: Unit <OBJECT>
 *   2: Turret Path <ARRAY>
 *   3: Number of magazines <NUMBER>
 *   4: Magazine Classname <STRING>
 *   5: Number of rounds <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[vehicle, player, [-1], 2, "5000Rnd_762x51_Belt", 500]] call ace_rearm_fnc_rearmSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_args", [objNull, objNull, [], 0, "", 0], [[]], [6]]
];
_args params ["_vehicle", "_unit", "_turretPath", "_numMagazines", "_magazineClass", "_numRounds"];
TRACE_6("rearmSuccess",_vehicle,_unit,_turretPath,_numMagazines,_magazineClass,_numRounds);

if (local _unit) then {
    [_unit, true, true] call FUNC(dropAmmo);
};

if (isServer) then {
    private _turretOwnerID = _vehicle turretOwner _turretPath;
    if (_turretOwnerID == 0) then {
        [QGVAR(rearmSuccessLocalEH), _this, [_vehicle]] call CBA_fnc_targetEvent;
    } else {
        [QGVAR(rearmSuccessLocalEH), _this, _turretOwnerID] call CBA_fnc_ownerEvent;
    };
} else {
    [QGVAR(rearmSuccessLocalEH), _this] call EFUNC(common,serverEvent);
};
