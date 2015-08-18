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
    [_unit, QGVAR(vehRearm), false] call EFUNC(common,setForceWalkStatus);
    _dummy = _unit getVariable [QGVAR(dummy), objNull];
    if !(isNull _dummy) then {
        detach _dummy;
        deleteVehicle _dummy;
    };
    _unit setVariable [QGVAR(carriedMagazine), nil, true];
    _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRearm);
    _unit selectWeapon _weaponSelect;
    _unit setVariable [QGVAR(selectedWeaponOnRearm), nil];
};

if (isServer) then {
    _turretOwnerID = _target turretOwner _turretPath;
    EGVAR(common,remoteFnc) = [_this, QFUNC(rearmSuccessLocal), 0];
    _turretOwnerID publicVariableClient QEGVAR(common,remoteFnc);
} else {
    [_this, QUOTE(DFUNC(rearmSuccess)), 1] call EFUNC(common,execRemoteFnc);
};
