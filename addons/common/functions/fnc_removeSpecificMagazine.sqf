#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Removes a magazine from the unit or object that has a specific ammo count
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine <STRING>
 * 2: Ammo count <NUMBER>
 *
 * Return Value:
 * Magazine Removed <BOOL>
 *
 * Example:
 * [bob, "magazine", 5] call ace_common_fnc_removeSpecificMagazine
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_magazineType", "", [""]], ["_ammoCount", 0, [0]]];

private _isRemoved = false;

private _fnc_removeMagazine = {
    params ["_container", "_magArray"];
    _magArray params ["_magazineType", "_ammoCount"];

    private _allMagazines = magazinesAmmoCargo _container;
    private _specificMagazineIndex = _allMagazines findIf {_x isEqualTo _magArray};
    _allMagazines deleteAt _specificMagazineIndex;

    if (_specificMagazineIndex > -1) exitWith {
        clearMagazineCargoGlobal _container;
        private _containerType = typeOf _container;
        if (_containerType in ["GroundWeaponHolder", "WeaponHolderSimulated"]) then {
            _container = createVehicle [_containerType, getPosATL _container, [], 0, "CAN_COLLIDE"];
        };
        {
            _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        } forEach _allMagazines;
        true
    };
    false
};

private _containerArray = [_unit];
if (_unit isKindOf "CAManBase") then {
    _containerArray = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
};

{
    if ([_x, [_magazineType, _ammoCount]] call _fnc_removeMagazine) exitWith {_isRemoved = true};
} forEach _containerArray;

_isRemoved
