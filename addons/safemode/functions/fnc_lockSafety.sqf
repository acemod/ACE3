#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Puts weapon on safety, or take it off safety if safety is already put on.
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
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety
 *
 * Public: No
 */

params ["_unit", "_weapon", "_muzzle", ["_hint", true]];

private _safedWeapons = _unit getVariable QGVAR(safedWeapons);

if (isNil "_safedWeapons") then {
    _safedWeapons = createHashMap;

    _unit setVariable [QGVAR(safedWeapons), _safedWeapons];
};

_weapon = _weapon call EFUNC(common,baseWeapon);

// See if the current weapon has locked muzzled
private _safedWeaponMuzzles = _safedWeapons getOrDefault [_weapon, [], true];

// If muzzle is locked, unlock it (toggle)
if (_safedWeaponMuzzles findIf {_x select 0 == _muzzle} != -1) exitWith {
    [_unit, _weapon, _muzzle, _hint] call FUNC(unlockSafety);
};

(_unit weaponState _muzzle) params ["_currentWeapon", "_currentMuzzle", "_firemode"];

// If selection is a different weapon or muzzle, take the first firemode available for new weapon/muzzle
if (_currentWeapon != _weapon || {_currentMuzzle != _muzzle}) then {
    private _config = configFile >> "CfgWeapons" >> _weapon;

    if (_weapon != _muzzle) then {
        _config = _config >> _muzzle;
    };

    _firemode = ((getArray (_config >> "modes")) select {getNumber (_config >> _x >> "showToPlayer") == 1}) param [0, ""];

    // The alt syntax of selectWeapon doesn't mess with gun lights and lasers
    _unit selectWeapon [_weapon, _muzzle, _firemode];
};

// Store new muzzle & firemode
_safedWeaponMuzzles pushBack [_muzzle, _firemode];

// Lock muzzle
if (isNil {_unit getVariable QGVAR(actionID)}) then {
    _unit setVariable [QGVAR(actionID), [
        _unit, "DefaultAction", {
            params ["", "_unit"];

            if (
                _unit call CBA_fnc_canUseWeapon && {
                    (weaponState _unit) params ["_currentWeapon", "_currentMuzzle"];

                    _currentWeapon = _currentWeapon call EFUNC(common,baseWeapon);

                    // Block firing the muizzle in safe mode
                    if (((_unit getVariable [QGVAR(safedWeapons), createHashMap]) getOrDefault [_currentWeapon, []]) findIf {_x select 0 == _currentMuzzle} != -1) then {
                        if (inputAction "nextWeapon" > 0) exitWith {
                            [_unit, _currentWeapon, _currentMuzzle] call FUNC(unlockSafety);

                            false
                        };

                        true
                    } else {
                        false
                    }
                }
            ) then {
                // Player hud
                false call FUNC(setSafeModeVisual);

                true
            } else {
                // Player hud
                true call FUNC(setSafeModeVisual);

                false
            };
        }, {}
    ] call EFUNC(common,addActionEventHandler)];
};

// Play fire mode selector sound
[_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);

// Show info box unless disabled
if (_hint) then {
    [LLSTRING(PutOnSafety), getText (configFile >> "CfgWeapons" >> _weapon >> "picture")] call EFUNC(common,displayTextPicture);
};
