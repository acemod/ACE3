// by commy2

private ["_unit", "_weapon", "_muzzle", "_safedWeapons"];

_unit = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

_safedWeapons = _unit getVariable ["AGM_SafeMode_safedWeapons", []];

if (_weapon in _safedWeapons) then {
  _safedWeapons = _safedWeapons - [_weapon];

  _unit setVariable ["AGM_SafeMode_safedWeapons", _safedWeapons];

  if (count _safedWeapons == 0) then {
    private "_id";
    _id = _unit getVariable ["AGM_SafeWeapon_actionID", -1];

    //[_unit, "DefaultAction", _id] call AGM_Core_fnc_removeActionMenuEventHandler;
    [_unit, "DefaultAction", _id] call AGM_Core_fnc_removeActionEventHandler;
    _unit setVariable ["AGM_SafeWeapon_actionID", -1];
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
  [_unit, _weapon, _muzzle] call AGM_SafeMode_fnc_playChangeFiremodeSound;
};

// player hud
[true] call AGM_SafeMode_fnc_setSafeModeVisual;

private "_picture";
_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
[localize "STR_AGM_SafeMode_TookOffSafety", _picture] call AGM_Core_fnc_displayTextPicture;
