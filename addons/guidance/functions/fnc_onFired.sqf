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
_enabled = getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled");
_legacyEnabled = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_missileguidance" >> "enabled");
if ((_enabled < 1) && (_legacyEnabled < 1)) exitWith {};

//
//hint format ["%1\n%2", (getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")), QUOTE(ADDON)];
//if ((getNumber (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "enabled")) != 1) exitWith {};


// Bail on locality of the projectile, it should be local to us
if (!(local _projectile) ) exitWith {};

// Bail if shooter isn't player AND system not enabled for AI:
if ( !isPlayer _shooter && { (_enabled < 2) && (_legacyEnabled < 2) } ) exitWith {};

// MissileGuidance is enabled for this shot
TRACE_4("enabled",_shooter,_ammo,_projectile,typeOf _shooter);

_legacy = false;
if ((_legacyEnabled > 0) && !(_enabled > 0)) then {_legacy = true};

private _extractedInfo = [_this,_legacy] call FUNC(extractInfo);


_args = [_this, _extractedInfo];


[FUNC(guidancePFH), 0, _args ] call CBA_fnc_addPerFrameHandler;
