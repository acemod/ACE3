// by esteldunedain
#include "script_component.hpp"

// To propagate the setAmmo change, do it on all clients
// See https://github.com/acemod/ACE3/issues/1119 and https://feedback.bistudio.com/T167015
[QGVAR(syncAmmo), {
    params ["_unit", "_weapon", "_ammo"];
    TRACE_3("syncAmmo EH",_unit,_weapon,_ammo);
    _unit setAmmo [_weapon, _ammo];
}] call CBA_fnc_addEventHandler;

// Listen for attempts to link ammo
[QGVAR(ammoLinked), {
    params ["_target", "_unit", "_magazineInfo"];
    _magazineInfo params ["_magazine", "_ammo"];

    // Return the magazine if it's the wrong type
    if (currentMagazine _target != _magazine) exitWith {
        [QGVAR(ammoReturned), [_unit, _target, _magazineInfo, false], _unit] call CBA_fnc_targetEvent;
    };

    private _currentWeapon = currentWeapon _target;
    private _currentAmmo = _target ammo _currentWeapon;
    private _magazineCfg = configFile >> "CfgMagazines" >> _magazine;
    private _ammoMissing = getNumber (_magazineCfg >> "count") - _currentAmmo;

    // Return the magazine if the belt is full or empty
    if (_currentAmmo == 0 || {_ammoMissing == 0}) exitWith {
        [QGVAR(ammoReturned), [_unit, _target, _magazineInfo, false], _unit] call CBA_fnc_targetEvent;
    };

    // Add the ammo
    private _ammoAdded = _ammoMissing min _ammo;
    [QGVAR(syncAmmo), [_target, _currentWeapon, _currentAmmo + _ammoAdded]] call CBA_fnc_globalEvent;

    // Return left over ammo to reloading unit
    if (_ammo - _ammoAdded > 0) then {
        [QGVAR(ammoReturned), [_unit, _target, [_magazine, _ammo - _ammoAdded], true], _unit] call CBA_fnc_targetEvent;
    };
}] call CBA_fnc_addEventHandler;

// Listen for returned magazines
[QGVAR(ammoReturned), {
    params ["_unit", "_target", "_magazineInfo", "_success"];
    TRACE_3("ammoReturned EH",_unit,_target,_magazineInfo);

    // If inventory is full, magazine will be dropped on the ground
    [_unit, _magazineInfo select 0, _magazineInfo select 1, true] call CBA_fnc_addMagazine;

    [[LSTRING(BeltNotLinked), LSTRING(BeltLinked)] select _success] call EFUNC(common,displayTextStructured);
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"
