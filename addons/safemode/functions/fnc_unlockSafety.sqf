/*
 * Author: commy2
 * Take weapon of safety lock.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_unlockSafety
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon", "_muzzle"];

private ["_safedWeapons", "_picture"];

_safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];
_safedWeapons deleteAt (_safedWeapons find _weapon);

_unit setVariable [QGVAR(safedWeapons), _safedWeapons];

// remove action if all weapons have put their safety on
if (_safedWeapons isEqualTo []) then {
    [_unit, "DefaultAction", _unit getVariable [QGVAR(actionID), -1]] call EFUNC(common,removeActionEventHandler);
    _unit setVariable [QGVAR(actionID), -1];
};

_unit selectWeapon _muzzle;

if (inputAction "nextWeapon" > 0) then {
    // switch to the last mode to roll over to first after the default nextWeapon action
    private ["_modes", "_mode", "_index"];

    // get weapon modes
    _modes = [];
    {
        if (getNumber (configFile >> "CfgWeapons" >> _weapon >> _x >> "showToPlayer") == 1) then {
            _modes pushBack _x;
        };
        if (_x == "this") then {
            _modes pushBack _weapon;
        };
        nil
    } count getArray (configFile >> "CfgWeapons" >> _weapon >> "modes");

    // select last mode
    _mode = _modes select (count _modes - 1);

    // switch to last mode
    _index = 0;
    while {
        _index < 299 && {currentMuzzle _unit != _weapon || {currentWeaponMode _unit != _mode}}
    } do {
        _unit action ["SwitchWeapon", _unit, _unit, _index];
        _index = _index + 1;
    };
} else {
    // play fire mode selector sound
    [_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);
};

// player hud
[true] call FUNC(setSafeModeVisual);

// show info box
_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize LSTRING(TookOffSafety), _picture] call EFUNC(common,displayTextPicture);
