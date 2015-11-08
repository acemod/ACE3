/*
 * Author: commy2
 * Called on unit initialization. Adds earplugs if the unit is equipped with either a really loud primary weapon or a rocket launcher.
 *
 * Arguments:
 * 0: A Soldier <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [guy] call ace_hearing_fnc_addEarPlugs
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Exit if hearing is disabled or soldier has earplugs already in (persistence scenarios)
if (!GVAR(enableCombatDeafness) || {[_unit] call FUNC(hasEarPlugsIn)}) exitWith {};

// add earplugs if the soldier has a rocket launcher
if ((secondaryWeapon _unit) != "") exitWith {
    _unit addItem "ACE_EarPlugs";
};

// otherwise add earplugs if the soldier has a big rifle
if ((primaryWeapon _unit) == "") exitWith {};

(primaryWeaponMagazine _unit) params [["_magazine", ""]];
if (_magazine == "") exitWith {};

local _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
local _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
local _count = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

local _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_caliber");
_caliber = call {
    if (_ammo isKindOf ["ShellBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
    if (_ammo isKindOf ["RocketBase", (configFile >> "CfgAmmo")]) exitWith { 200 };
    if (_ammo isKindOf ["MissileBase", (configFile >> "CfgAmmo")]) exitWith { 600 };
    if (_ammo isKindOf ["SubmunitionBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
    if (_caliber <= 0) then { 6.5 } else { _caliber };
};
local _loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) / 5;

//If unit has a machine gun boost effective loudness 50%
if (_count >= 50) then {_loudness = _loudness * 1.5};

if (_loudness > 0.2) then {
    _unit addItem "ACE_EarPlugs";
};
