/*
 * Author: commy2
 * Put weapon on safety, or take it off safety if safety is already put on.
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
 * [ACE_player, currentWeapon ACE_player, currentMuzzle ACE_player] call ace_safemode_fnc_lockSafety
 *
 * Public: No
 */
#include "script_component.hpp"

// don't immediately switch back
if (inputAction "nextWeapon" > 0) exitWith {};

params ["_unit", "_weapon", "_muzzle"];

private _safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

if (_weapon in _safedWeapons) exitWith {
    _this call FUNC(unlockSafety);
};

_safedWeapons pushBack _weapon;

_unit setVariable [QGVAR(safedWeapons), _safedWeapons];

if (_unit getVariable [QGVAR(actionID), -1] == -1) then {
    _unit setVariable [QGVAR(actionID), [
        _unit, "DefaultAction", {
            if (
                [_this select 1] call CBA_fnc_canUseWeapon
                && {
                    if (currentMuzzle (_this select 1) in ((_this select 1) getVariable [QGVAR(safedWeapons), []])) then {
                        if (inputAction "nextWeapon" > 0) exitWith {
                            [_this select 1, currentWeapon (_this select 1), currentMuzzle (_this select 1)] call FUNC(unlockSafety);
                            false
                        };
                        true
                    } else {false}
                }
            ) then {
                // player hud
                [false] call FUNC(setSafeModeVisual);
                true
            } else {
                // player hud
                [true] call FUNC(setSafeModeVisual);
                false
            };
        }, {}
    ] call EFUNC(common,addActionEventHandler)];
};

if (_muzzle isEqualType "") then {
    _unit selectWeapon _muzzle;
};

// play fire mode selector sound
[_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);

// show info box
private _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize LSTRING(PutOnSafety), _picture] call EFUNC(common,displayTextPicture);
