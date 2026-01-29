#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Fired event handler, starts guidance if enabled for ammo
 *
 * Arguments:
 * 0: Shooter (Man/Vehicle) <OBJECT>
 * 1: Weapon (not used) <STRING>
 * 2: Muzzle (not used) <STRING>
 * 3: Mode (not used) <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine (not used) <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "", "", "", "ACE_Javelin_FGM148", "", theMissile] call ace_missileguidance_fnc_onFired;
 *
 * Public: No
 */

params ["_shooter", "", "", "", "_ammo", "", "_projectile"];

private _configAmmo = configFile >> "CfgAmmo" >> _ammo;

// Bail if guidance is disabled for this ammo
if ((getNumber (_configAmmo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {};

// Bail on locality of the projectile, it should be local to us
if (GVAR(enabled) < 1 || {!local _projectile} ) exitWith {};

// Bail if shooter isn't player AND system not enabled for AI:
if ( !isPlayer _shooter && { GVAR(enabled) < 2 } ) exitWith {};

// Verify ammo has explicity added guidance config (ignore inheritances)
private _configs = QUOTE(configName _x == QUOTE(QUOTE(ADDON))) configClasses _configAmmo;
if (_configs isEqualTo []) exitWith {};

private _args = call FUNC(onFiredGetArgs);
[LINKFUNC(guidancePFH),0, _args] call CBA_fnc_addPerFrameHandler;

if (GVAR(debug_enableMissileCamera)) then {
    [_projectile] call FUNC(dev_ProjectileCamera);
};
