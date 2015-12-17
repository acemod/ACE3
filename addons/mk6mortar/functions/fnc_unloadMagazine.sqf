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
private ["_currentMagazine","_currentMagazineClass","_ammoCount"];

//Get weapon & magazine information about static weapon
_currentMagazine = (magazinesAllTurrets _static) select 1;
_currentMagazineClass = _currentMagazine select 0;
_ammoCount = _currentMagazine select 2;

//If current magazine is empty then remove it otherwise remove it and add it to the players inventory
if (_ammoCount == 0) then {
    [QGVAR(removeMagazine), [_static, _currentMagazineClass]] call EFUNC(common,globalEvent);
}else {
    _pos = _unit modelToWorldVisual [0,1,0];
    // TODO: Check unit inventory space and add to inventory first, then drop
    
    _unit = createVehicle ["WeaponHolder_Single_F",_pos,[],0,"NONE"];
    _unit addMagazineAmmoCargo [_currentMagazineClass, 1, _ammoCount];
    _unit setPosATL _pos;
    [QGVAR(removeMagazine), [_static, _currentMagazineClass]] call EFUNC(common,globalEvent);
};
