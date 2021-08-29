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
        _container addItemCargoGlobal ["ACE_Banana", 1]; // in case _container is GroundWeaponHolder containing only magazines
        clearMagazineCargoGlobal _container;
        {
            _container addMagazineAmmoCargo [_x select 0, 1, _x select 1];
        } forEach _allMagazines;
        _container removeItem "ACE_Banana";
        true
    };
    false
};

private _containerArray = [_unit];
if (_unit isKindOf "CAManBase") then {
    _containerArray = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
};

{
    if ([_x, [_magazineType, _ammoCount]] call _fnc_removeMagazine) then {
        _isRemoved = true;
        break
    };
} forEach _containerArray;

_isRemoved
