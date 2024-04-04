#include "..\script_component.hpp"
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

    if (_magArray in (magazinesAmmoCargo _container)) exitWith {
        _container addMagazineAmmoCargo [_magazineType, -1, _ammoCount];
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
