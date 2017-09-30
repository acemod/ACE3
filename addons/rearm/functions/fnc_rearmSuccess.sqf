/*
 * Author: GitHawk
 * Rearms a vehicle, after progress bar finishes, pass args to machine where turret is local.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Turret Path <ARRAY>
 * 3: Number of magazines <NUMBER>
 * 4: Magazine Classname <STRING>
 * 5: Number of rounds <NUMBER>
 * 6: Pylon Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player, [-1], 2, "5000Rnd_762x51_Belt", 500, -1] call ace_rearm_fnc_rearmSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_vehicle", "_unit", "_turretPath", "_numMagazines", "_magazineClass", "_numRounds", "_pylon"];
TRACE_7("rearmSuccess",_vehicle,_unit,_turretPath,_numMagazines,_magazineClass,_numRounds,_pylon);

if (local _unit) then {
    [_unit, true, true] call FUNC(dropAmmo);
};

if (!alive _vehicle) exitWith {WARNING("vehicle dead/null");};

if (isServer) then {
    private _turretOwnerID = _vehicle turretOwner _turretPath;
    if (_turretOwnerID == 0) then {
        [QGVAR(rearmSuccessLocalEH), _this, [_vehicle]] call CBA_fnc_targetEvent;
    } else {
        [QGVAR(rearmSuccessLocalEH), _this, _turretOwnerID] call CBA_fnc_ownerEvent;
    };
} else {
    [QGVAR(rearmSuccessEH), _this] call CBA_fnc_serverEvent;
};
