#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Adds a weapon to the units back (global effect).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapons items (weaponsItems format) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, weaponsItems player select 1] call ace_weapononback_fnc_add
 *
 * Public: Yes
 */
params ["_unit", "_weaponsItems", ["_calledFromEvent", false]];

if (!_calledFromEvent) exitWith {
    [QGVAR(add), [_unit, _weaponsItems], EVENT_ID(_unit)] call CBA_fnc_globalEventJIP;
};

// Replace old weapon holder
private _weaponHolder = _unit getVariable [QGVAR(weaponHolder), objNull];
private _oldWeapon = "";
if (!isNull _weaponHolder) then {
    deleteVehicle _weaponHolder;
};

_weaponHolder = QGVAR(weaponHolder) createVehicleLocal [0, 0, 0];
_weaponHolder attachTo [_unit, [0, 0, 0], "proxy:\a3\characters_f\proxies\launcher.001"];

// Add weapon to weapon holder
_weaponHolder addWeaponWithAttachmentsCargo [_weaponsItems, 1];

// Disable simulation to lock
_weaponHolder enableSimulation false;

_unit setVariable [QGVAR(weaponHolder), _weaponHolder];
GVAR(units) pushBack _unit;

if (local _unit) then {
    private _oldMass = _unit getVariable [QGVAR(weaponMass), 0];
    private _newMass = 0;

    // Calculate weapon weight with all items
    _weaponsItems params ["_weapon", "_muzzle", "_side", "_optic", "_magPrimary", "_magSecondary", "_bipod"];

    // Weapon itself
    _newMass = _newMass + getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass");

    // Attachments
    {
        if (_x != "") then {
            _newMass = _newMass + getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass");
        };
    } forEach [_muzzle, _side, _optic, _bipod];

    // Magazines
    {
        if !(_x isEqualTo []) then {
            _newMass = _newMass + getNumber (configFile >> "CfgMagazines" >> _x#0 >> "mass");
        };
    } forEach [_magPrimary, _magSecondary];

    [_unit, _unit, _newMass - _oldMass] call EFUNC(movement,addLoadToUnitContainer);
    _unit setVariable [QGVAR(weaponMass), _newMass, true];

    // Reset saved zeroing, if this weapon was swapped it will be restored in FUNC(swap)
    ACE_player setVariable [QGVAR(scopeAdjustment), [0, 0, 0]];

    _unit addWeapon QGVAR(weapon);
    [] call FUNC(updateInventory);
};

if (isNil QGVAR(renderPFH)) then {
    GVAR(renderPFH) = [FUNC(renderPFH), 0, []] call CBA_fnc_addPerFrameHandler;
};
