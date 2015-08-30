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

private ["_safedWeapons", "_condition", "_statement", "_id", "_picture"];

params ["_unit", "_weapon", "_muzzle"];

_safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

if (_weapon in _safedWeapons) exitWith {
    _this call FUNC(unlockSafety);
};

_safedWeapons pushBack _weapon;

_unit setVariable [QGVAR(safedWeapons), _safedWeapons];

if (_unit getVariable [QGVAR(actionID), -1] == -1) then {
    _condition = {
        params ["", "_caller"];
        if (
          [_caller] call EFUNC(common,canUseWeapon)
          && {
              if (currentMuzzle _caller in (_caller getVariable [QGVAR(safedWeapons), []])) then {
                  if (inputAction "nextWeapon" > 0) exitWith {
                      [_this select 1, currentWeapon _caller, currentMuzzle _caller] call FUNC(unlockSafety);
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
        }
    };

    _statement = {
        params ["", "_caller"];
        [_caller, currentWeapon _caller, currentMuzzle _caller] call FUNC(unlockSafety);
    };

    //_id = [_unit, format ["<t color=""#FFFF00"" >%1</t>", localize LSTRING(TakeOffSafety)], "DefaultAction", _condition, {}, {true}, _statement, 10] call EFUNC(common,addActionMenuEventHandler);
    _id = [_unit, "DefaultAction", _condition, {}] call EFUNC(common,addActionEventHandler);

    _unit setVariable [QGVAR(actionID), _id];
};

if ((typeName _muzzle) == (typeName "")) then {
    _unit selectWeapon _muzzle; //_weapon
};

// play fire mode selector sound
[_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);

_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize LSTRING(PutOnSafety), _picture] call EFUNC(common,displayTextPicture);
