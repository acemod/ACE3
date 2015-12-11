/*
 * Author: GitHawk
 * Rearms a vehicle.
 *
 * Arguments:
 * 0: Params <ARRAY>
 *   0: Target <OBJECT>
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

private ["_dummy", "_weaponSelect", "_turretOwnerID"];
params ["_args"];
_args params ["_target", "_unit", "_turretPath", "_numMagazines", "_magazineClass", "_numRounds"];

//hint format ["Target: %1\nTurretPath: %2\nNumMagazines: %3\nMagazine: %4\nNumRounds: %5", _target, _turretPath, _numMagazines, _magazineClass, _numRounds];

if (local _unit) then {
    [_unit, true, true] call FUNC(dropAmmo);
};

if (isServer) then {
    _turretOwnerID = _target turretOwner _turretPath;
    if (_turretOwnerID == 0) then {
        [_this, QFUNC(rearmSuccessLocal), _target] call EFUNC(common,execRemoteFnc);
    } else {
        EGVAR(common,remoteFnc) = [_this, QFUNC(rearmSuccessLocal), 0];
        _turretOwnerID publicVariableClient QEGVAR(common,remoteFnc);
    };
} else {
    [_this, QFUNC(rearmSuccess), 1] call EFUNC(common,execRemoteFnc);
};
