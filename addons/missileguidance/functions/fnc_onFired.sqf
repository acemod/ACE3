#include "..\script_component.hpp"
/*
 * Author: jaynus / nou
 * Fired event handler, starts guidance if enabled for ammo
 *
 * Arguments:
 * 0: Shooter (Man/Vehicle) <OBJECT>
 * 1: Weapon <STRING>
 * 3: Mode <STRING>
 * 4: Ammo <STRING>
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

params ["_shooter","_weapon","","_mode","_ammo","","_projectile"];

// Bail if guidance is disabled for this ammo
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {};

// Bail on locality of the projectile, it should be local to us
if (GVAR(enabled) < 1 || {!local _projectile} ) exitWith {};

// Bail if shooter isn't player AND system not enabled for AI:
if ( !isPlayer _shooter && { GVAR(enabled) < 2 } ) exitWith {};

// Verify ammo has explicity added guidance config (ignore inheritances)
private _configs = configProperties [(configFile >> "CfgAmmo" >> _ammo), QUOTE(configName _x == QUOTE(QUOTE(ADDON))), false];
if (_configs isEqualTo []) exitWith {};

private _args = call FUNC(onFiredGetArgs);
[LINKFUNC(guidancePFH),0, _args] call CBA_fnc_addPerFrameHandler;

if (GVAR(debug_enableMissileCamera)) then {
    [_projectile] call FUNC(dev_ProjectileCamera);
};
