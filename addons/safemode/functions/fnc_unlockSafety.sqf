#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Takes the weapon safety lock off.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 2: Muzzle <STRING>
 * 3: Show hint <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_unlockSafety
 *
 * Public: No
 */

params ["_unit", "_weapon", "_muzzle", ["_hint", true]];

private _safedWeaponMuzzles = (_unit getVariable QGVAR(safedWeapons)) get _weapon;
(_safedWeaponMuzzles deleteAt (_safedWeaponMuzzles findIf {_x select 0 == _muzzle})) params ["", "_firemode"];

private _ehID = _unit getVariable QGVAR(actionID);

// Remove action if all weapons have put their safety on
if (_safedWeaponMuzzles isEqualTo []) then {
    (_unit getVariable QGVAR(safedWeapons)) deleteAt _weapon;

    if (!isNil "_ehID") then {
        [_unit, "DefaultAction", _ehID] call EFUNC(common,removeActionEventHandler);

        _unit setVariable [QGVAR(actionID), nil];
    };
};

private _nextMode = inputAction "nextWeapon" > 0;

(_unit weaponState _muzzle) params ["_currentWeapon", "_currentMuzzle"];

// If selection is a different weapon or muzzle, take the first firemode available for new weapon/muzzle
if (_currentWeapon != _weapon || {_currentMuzzle != _muzzle} || _nextMode) then {
    private _config = configFile >> "CfgWeapons" >> _weapon;

    if (_weapon != _muzzle) then {
        _config = _config >> _muzzle;
    };

    if (_nextMode) then {
        private _modes = (getArray (_config >> "modes")) select {getNumber (_config >> _x >> "showToPlayer") == 1};

        _firemode = _modes param [(_modes find _firemode) + 1, ""];
    };

    // The alt syntax of selectWeapon doesn't mess with gun lights and lasers
    _unit selectWeapon [_weapon, _muzzle, _firemode];
};

// Play fire mode selector sound
if (!_nextMode) then {
    [_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);
};

// Player hud
true call FUNC(setSafeModeVisual);

// Show info box unless disabled
if (_hint) then {
    [LLSTRING(TookOffSafety), getText (configFile >> "CfgWeapons" >> _weapon >> "picture")] call EFUNC(common,displayTextPicture);
};
