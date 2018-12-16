#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Gets the bore height of the weapon & optic combination with the given weapon index
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon index <NUMBER>
 *
 * Return Value:
 * bore height <NUMBER>
 *
 * Example:
 * [player, 0] call ace_scopes_fnc_getBoreHeight
 *
 * Public: Yes
 */

params ["_unit", "_weaponIndex"];

if (_weaponIndex < 0 || {_weaponIndex > 2}) exitWith { 0 }; 

private _weaponClass = [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit] select _weaponIndex; 
private _opticsClass = ([_unit] call FUNC(getOptics)) select _weaponIndex; 

if (_opticsClass == "") then { _opticsClass = _weaponClass; };

// Determine rail height above bore
private _railHeightAboveBore = 0;
private _weaponConfig = configFile >> "CfgWeapons" >> _weaponClass;
if (isNumber (_weaponConfig >> "ACE_RailHeightAboveBore")) then {
    _railHeightAboveBore = getNumber(_weaponConfig >> "ACE_RailHeightAboveBore");
} else {
    switch (_weaponIndex) do {
        case 0: { _railHeightAboveBore = 3.0; }; // Rifle
        case 2: { _railHeightAboveBore = 0.7; }; // Pistol
    };
};
// Determine scope height above rail
private _scopeHeightAboveRail = 0;
private _opticConfig = configFile >> "CfgWeapons" >> _opticsClass;
if (isNumber (_opticConfig >> "ACE_ScopeHeightAboveRail")) then {
    _scopeHeightAboveRail = getNumber(_opticConfig >> "ACE_ScopeHeightAboveRail");
} else {
    switch (getNumber(_opticConfig >> "ItemInfo" >> "opticType")) do {
        case 1: { _scopeHeightAboveRail = 4.5; }; // RCO or similar
        case 2: { _scopeHeightAboveRail = 4.0; }; // High power scope
        default {
            switch (_weaponIndex) do {
                case 0: { _scopeHeightAboveRail = 2.0; }; // Rifle iron sights
                case 2: { _scopeHeightAboveRail = 1.0; }; // Pistol iron sights
            };
        };
    };
};

(_railHeightAboveBore + _scopeHeightAboveRail)
