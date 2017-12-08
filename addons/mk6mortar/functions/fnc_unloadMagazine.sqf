/*
 * Author: Grey
 *
 * Unload current magazine from static weapon
 *
 * Arguments:
 * 0: static <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target, _player] call ace_mk6mortar_fnc_unloadMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_static","_unit"];

//Get weapon & magazine information about static weapon
private _currentMagazine = (magazinesAllTurrets _static) select 1;
private _currentMagazineClass = _currentMagazine select 0;
private _ammoCount = _currentMagazine select 2;

// Try to add the round to player inventory, otherwise place it on the ground near the player
if (_ammoCount > 0) then {
    if (_unit canAdd _currentMagazineClass) then {
        _unit addMagazineGlobal _currentMagazineClass;
    } else {
        _pos = _unit modelToWorldVisual [0.5,0.5,0]; // Front right of player
        _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
        _unit addMagazineAmmoCargo [_currentMagazineClass, 1, _ammoCount];
        _unit setPosATL _pos;
    };
    [QGVAR(removeMagazine), [_static, _currentMagazineClass]] call CBA_fnc_globalEvent;
};
