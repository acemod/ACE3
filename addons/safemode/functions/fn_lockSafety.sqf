// by commy2

private ["_unit", "_weapon", "_muzzle", "_safedWeapons"];

_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

// don't immediately switch back
if (inputAction "nextWeapon" > 0) exitWith {};

_safedWeapons = _unit getVariable ["AGM_SafeMode_safedWeapons", []];

if (_weapon in _safedWeapons) exitWith {
  _this call AGM_SafeMode_fnc_unlockSafety;
};

_safedWeapons pushBack _weapon;

_unit setVariable ["AGM_SafeMode_safedWeapons", _safedWeapons];

if (_unit getVariable ["AGM_SafeWeapon_actionID", -1] == -1) then {
  private ["_condition", "_statement", "_id"];

  _condition = {
    if (
      [_this select 1] call AGM_Core_fnc_canUseWeapon
      && {
        if (currentMuzzle (_this select 1) in ((_this select 1) getVariable ["AGM_SafeMode_safedWeapons", []])) then {
          if (inputAction "nextWeapon" > 0) exitWith {
            [_this select 1, currentWeapon (_this select 1), currentMuzzle (_this select 1)] call AGM_SafeMode_fnc_unlockSafety;
            false
          };
          true
        } else {false}
      }
    ) then {
      // player hud
      [false] call AGM_SafeMode_fnc_setSafeModeVisual;
      true
    } else {
      // player hud
      [true] call AGM_SafeMode_fnc_setSafeModeVisual;
      false
    }
  };

  _statement = {
    [_this select 1, currentWeapon (_this select 1), currentMuzzle (_this select 1)] call AGM_SafeMode_fnc_unlockSafety;
  };

  //_id = [_unit, format ["<t color=""#FFFF00"" >%1</t>", localize "STR_AGM_SafeMode_TakeOffSafety"], "DefaultAction", _condition, {}, {true}, _statement, 10] call AGM_Core_fnc_addActionMenuEventHandler;
  _id = [_unit, "DefaultAction", _condition, {}] call AGM_Core_fnc_addActionEventHandler;

  _unit setVariable ["AGM_SafeWeapon_actionID", _id];
};

_unit selectWeapon _muzzle;//_weapon

// play fire mode selector sound
[_unit, _weapon, _muzzle] call AGM_SafeMode_fnc_playChangeFiremodeSound;

private "_picture";
_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize "STR_AGM_SafeMode_PutOnSafety", _picture] call AGM_Core_fnc_displayTextPicture;
