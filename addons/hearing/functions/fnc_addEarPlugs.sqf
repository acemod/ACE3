#include "script_component.hpp"
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

params ["_unit"];
TRACE_2("params",_unit,typeOf _unit);

// only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(addEarPlugs), _this];
};

// Exit if hearing is disabled OR autoAdd is disabled OR soldier has earplugs already in (persistence scenarios)
if (!GVAR(enableCombatDeafness) || {!GVAR(autoAddEarplugsToUnits)} || {[_unit] call FUNC(hasEarPlugsIn)}) exitWith {};

// add earplugs if the soldier has a rocket launcher
if ((secondaryWeapon _unit) != "") exitWith {
    TRACE_1("has launcher - adding",_unit);
    _unit addItem "ACE_EarPlugs";
};

// otherwise add earplugs if the soldier has a big rifle
if ((primaryWeapon _unit) == "") exitWith {};

(primaryWeaponMagazine _unit) params [["_magazine", ""]];
if (_magazine == "") exitWith {};

private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _magazine >> "initSpeed");
private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
private _count = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

private _caliber = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ACE_caliber");
_caliber = call {
    if (_ammo isKindOf ["ShellBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
    if (_ammo isKindOf ["RocketBase", (configFile >> "CfgAmmo")]) exitWith { 200 };
    if (_ammo isKindOf ["MissileBase", (configFile >> "CfgAmmo")]) exitWith { 600 };
    if (_ammo isKindOf ["SubmunitionBase", (configFile >> "CfgAmmo")]) exitWith { 80 };
    if (_caliber <= 0) then { 6.5 } else { _caliber };
};
private _loudness = (_caliber ^ 1.25 / 10) * (_initspeed / 1000) / 5;

//If unit has a machine gun boost effective loudness 50%
if (_count >= 50) then {_loudness = _loudness * 1.5};

TRACE_2("primaryWeapon",_unit,_loudness);

if (_loudness > 0.2) then {
    TRACE_1("loud gun - adding",_unit);
    _unit addItem "ACE_EarPlugs";
};
