/*
 * Author: commy2, voiper
 * Make chemlight snap sound.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * None
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_chemlights_fnc_throwChemlight
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

if (_weapon != "Throw") exitWith {};

// http://feedback.arma3.com/view.php?id=12340
if (isNull _projectile) then {
    _projectile = nearestObject [_unit, _ammo];
};

private _config = configFile >> "CfgAmmo" >> _ammo;

// handle chemlights
if (local _unit) then {

    if (_ammo isKindOf ["Chemlight_base", configFile >> "CfgAmmo"]) then {
        playSound3D [QUOTE(PATHTO_R(sounds\chemlight_snap.wav)), objNull, false, (eyePos _unit), 1, 1, 65];
    };

    if (getNumber (_config >> QGVAR(flashbang)) == 1) then {
        private _fuzeTime = getNumber (_config >> "explosionTime");

        [FUNC(flashbangThrownFuze), [_projectile], _fuzeTime] call EFUNC(common,waitAndExecute);
    };
};

