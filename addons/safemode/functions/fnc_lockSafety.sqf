// by commy2
#include "script_component.hpp"

PARAMS_3(_unit,_weapon,_muzzle);

// don't immediately switch back
if (inputAction "nextWeapon" > 0) exitWith {};

private ["_safedWeapons"];
_safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

if (_weapon in _safedWeapons) exitWith {
    _this call FUNC(unlockSafety);
};

_safedWeapons pushBack _weapon;

_unit setVariable [QGVAR(safedWeapons), _safedWeapons];

if (_unit getVariable [QGVAR(actionID), -1] == -1) then {
    private ["_condition", "_statement", "_id"];

    _condition = {
        if (
          [_this select 1] call EFUNC(common,canUseWeapon)
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
        }
    };

    _statement = {
        [_this select 1, currentWeapon (_this select 1), currentMuzzle (_this select 1)] call FUNC(unlockSafety);
    };

    //_id = [_unit, format ["<t color=""#FFFF00"" >%1</t>", localize "STR_ACE_SafeMode_TakeOffSafety"], "DefaultAction", _condition, {}, {true}, _statement, 10] call EFUNC(common,addActionMenuEventHandler);
    _id = [_unit, "DefaultAction", _condition, {}] call EFUNC(common,addActionEventHandler);

    _unit setVariable [QGVAR(actionID), _id];
};

if ((typeName _muzzle) == (typeName "")) then {
    _unit selectWeapon _muzzle;//_weapon
};

// play fire mode selector sound
[_unit, _weapon, _muzzle] call FUNC(playChangeFiremodeSound);

private "_picture";
_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize "STR_ACE_SafeMode_PutOnSafety", _picture] call EFUNC(common,displayTextPicture);
