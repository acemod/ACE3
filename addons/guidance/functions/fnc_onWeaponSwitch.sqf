#include "script_component.hpp"

params ["_unit"];


private _weaponState = weaponState (vehicle _unit);

if ( _unit != vehicle _unit || ((_unit == vehicle _unit) && !(_unit in crew _unit)) ) then {
    _weaponState = weaponState [vehicle _unit, [-1]];
    if ( ((vehicle _unit) turretUnit [0] == _unit) ) then {
        _weaponState = weaponState [vehicle _unit, [0]];
    };
};

_weaponState params ["_wsWeapon", "_wsMuzzle", "_wsMode", "_wsMagazine", "_wsAmmoCount"];

private _wsAmmo = getText (configFile >> "CfgMagazines" >> _wsMagazine >> "ammo");
private _cfgAmmo = configFile >> "CfgAmmo" >> _wsAmmo >> QUOTE(ADDON);
private _enabledNumber = getNumber (_cfgAmmo >> "enabled");

//With this sanity check, nothing is sanity in this way beyond this point;
if(_enabledNumber < 1 || _enabledNumber == 3) exitWith {};

private _entry = [vehicle _unit, _wsWeapon, _wsMagazine] call FUNC(createGuidedWeapon);
