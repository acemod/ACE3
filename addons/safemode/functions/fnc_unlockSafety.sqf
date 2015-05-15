// by commy2
#include "script_component.hpp"

PARAMS_3(_unit,_weapon,_muzzle);

private ["_safedWeapons"];
_safedWeapons = _unit getVariable [QGVAR(safedWeapons), []];

if (_weapon in _safedWeapons) then {
  _safedWeapons = _safedWeapons - [_weapon];

  _unit setVariable [QGVAR(safedWeapons), _safedWeapons];

  if (count _safedWeapons == 0) then {
    private "_id";
    _id = _unit getVariable [QGVAR(actionID), -1];

    //[_unit, "DefaultAction", _id] call EFUNC(common,removeActionMenuEventHandler);
    [_unit, "DefaultAction", _id] call EFUNC(common,removeActionEventHandler);
    _unit setVariable [QGVAR(actionID), -1];
  };
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
  } forEach getArray (configfile >> "CfgWeapons" >> _weapon >> "modes");

  // select last mode
  _mode = _modes select (count _modes - 1);

  // switch to last mode
  _index = 0;
  while {
    _index < 100 && {currentMuzzle _unit != _weapon || {currentWeaponMode _unit != _mode}}
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

private "_picture";
_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize "STR_ACE_SafeMode_TookOffSafety", _picture] call EFUNC(common,displayTextPicture);
