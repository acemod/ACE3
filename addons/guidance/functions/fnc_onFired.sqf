#include "script_component.hpp"
/*
 * Author: LorenLuke, (adopted from framework by: jaynus / nou)
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

//DEBUG!!!
_addon = "ace_guidance";
if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> _addon >> "enabled")) != 1) exitWith {};
//
//hint format ["%1\n%2", (getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")), QUOTE(ADDON)];
//if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {};


// Bail on locality of the projectile, it should be local to us
if (GVAR(enabled) < 1 || {!local _projectile} ) exitWith {};

// Bail if shooter isn't player AND system not enabled for AI:
if ( !isPlayer _shooter && { GVAR(enabled) < 2 } ) exitWith {};

// MissileGuidance is enabled for this shot
TRACE_4("enabled",_shooter,_ammo,_projectile,typeOf _shooter);

private _extractedInfo = _this call FUNC(extractInfo);

_args = [_this, _extractedInfo];



[FUNC(guidancePFH), 0, _args ] call CBA_fnc_addPerFrameHandler;

