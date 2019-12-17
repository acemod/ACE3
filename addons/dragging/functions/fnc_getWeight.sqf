#include "script_component.hpp"
/*
 * Author: L-H, edited by commy2, rewritten by joko // Jonas, re-rewritten by mharis001
 * Returns the weight of the given object.
 * Weight is calculated from the object's mass and its current inventory.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Weight <NUMBER>
 *
 * Example:
 * [_object] call ace_dragging_fnc_getWeight
 *
 * Public: No
 */

params ["_object"];

private _weight = 0;
private _cfgWeapons   = configFile >> "CfgWeapons";
private _cfgGlasses   = configFile >> "CfgGlasses";
private _cfgVehicles  = configFile >> "CfgVehicles";
private _cfgMagazines = configFile >> "CfgMagazines";

// Add the masses of "regular" items in the object's inventory
// Handle separating CfgGlasses items from this cargo array
getItemCargo _object params ["_itemTypes", "_itemCounts"];

{
    private _itemConfig = if (isClass (_cfgGlasses >> _x)) then {
        _cfgGlasses >> _x
    } else {
        _cfgWeapons >> _x >> "ItemInfo"
    };

    _weight = _weight + getNumber (_itemConfig >> "mass") * (_itemCounts select _forEachIndex);
} forEach _itemTypes;

// Add the masses of magazine items in the object's inventory
getMagazineCargo _object params ["_magazineTypes", "_magazineCounts"];

{
    _weight = _weight + getNumber (_cfgMagazines >> _x >> "mass") * (_magazineCounts select _forEachIndex);
} forEach _magazineTypes;

// Add the masses of backpack items in the object's inventory
getBackpackCargo _object params ["_backpackTypes", "_backpackCounts"];

{
    _weight = _weight + getNumber (_cfgVehicles >> _x >> "mass") * (_backpackCounts select _forEachIndex);
} forEach _backpackTypes;

{
    _x params ["_weapon", "_muzzle", "_pointer", "_optic", "_primaryMagazine", "_secondaryMagazine", "_bipod"];

    // Add the weapon's mass
    _weight = _weight + getNumber (_cfgWeapons >> _weapon >> "WeaponSlotsInfo" >> "mass");

    // Add the masses of the weapon's attachments if they exist
    {
        if (_x != "") then {
            _weight = _weight + getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "mass");
        };
    } forEach [_muzzle, _pointer, _optic, _bipod];

    // Add the masses of the weapon's magazines if they exist
    {
        _x params ["_magazine"];

        if (!isNil "_magazine") then {
            _weight = _weight + getNumber (_cfgMagazines >> _magazine >> "mass");
        };
    } forEach [_primaryMagazine, _secondaryMagazine];
} forEach weaponsItemsCargo _object;

// Add the mass of the object itself
// The mass of sub-containers such as vests was added through the items cargo
// The container object is generally of type SupplyX and has mass of zero
_weight = _weight + getNumber (_cfgVehicles >> typeOf _object >> "mass");

// Mass in Arma isn't an exact amount but rather a volume/weight value
// This attempts to work around that by making it a usable value (sort of)
// Note: this is done before the recursive calls to avoid reducing the weight multiple times
_weight = _weight * 0.5;

// Handle sub-containers within the object's inventory
{
    _x params ["", "_container"];

    _weight = _weight + (_container call FUNC(getWeight));
} forEach everyContainer _object;

_weight
