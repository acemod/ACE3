#include "script_component.hpp"

params ["_unit", "_weapon", "_muzzle", "_newMag", "_oldMag"];

private _magazine = _newMag select 0;

private _ammo = getText (configFile >> "CfgMagazines" >> _magazine >> "ammo");
private _cfgAmmo = configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON);
private _enabledNumber = getNumber (_cfgAmmo >> "enabled");

//With this sanity check, nothing is sanity in this way beyond this point;
if(_enabledNumber < 1 || _enabledNumber == 3) exitWith {};

private _entry = [_unit, _weapon, _magazine] call FUNC(createGuidedWeapon);
