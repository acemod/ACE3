/*
 * Author: commy2
 *
 * Count the ammo of the currently loaded magazine or count rifle grenades. Play animation and display message.
 * 
 * Argument:
 * 0: The player (Object)
 * 1: The vehicle (Object)
 * 2: Skip the animation? Used after reloading (Bool)
 * 
 * Return value:
 * Nothing
 */

#define COUNT_BARS 12


private ["_unit", "_vehicle"];

_unit = _this select 0;
_vehicle = _this select 1;

if (_unit != _vehicle && !(_vehicle isKindOf "StaticWeapon")) then {
  _vehicle = _unit;
};

[_vehicle, currentWeapon _vehicle, currentMuzzle _vehicle, currentMagazine _vehicle, _this select 2] spawn {
  _vehicle = _this select 0;
  _weapon = _this select 1;
  _muzzle = _this select 2;
  _magazine = _this select 3;
  _skipDelay = _this select 4;

  if (currentWeapon _vehicle == "") exitWith {};
  if (typeName _muzzle != "STRING") then {_muzzle = _weapon};

  _showNumber = false;
  _ammo = 0;
  _maxRounds = 1;
  _count = 0;

  // not grenade launcher
  if (_muzzle == _weapon) then {
    _maxRounds = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count") max 1;

    _ammo = _vehicle ammo _weapon;
    if (_maxRounds >= COUNT_BARS) then {
      _count = round (COUNT_BARS * _ammo / _maxRounds);

      if (_ammo > 0) then {_count = _count max 1};
      if (_ammo < _maxRounds) then {_count = _count min (COUNT_BARS - 1)};
    } else {
      _count = _ammo;
    };

  // grenade launcher
  } else {
    _showNumber = true;

    _count = if (_magazine != "") then {
      {_x == _magazine} count (magazines _vehicle + [_magazine])
    } else {
      {_x in getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle >> "Magazines")} count magazines _vehicle
    };
  };

  if !(_skipDelay) then {
    _vehicle playActionNow "Gear";
    sleep 1
  };

  _text = if (_showNumber) then {
    parseText format ["<t align='center' >%1x</t>", _count]
  } else {
    _color = [
      2 * (1 - _ammo / _maxRounds) min 1,
      2 * _ammo / _maxRounds min 1,
      00
    ];

    _string = "";
    for "_a" from 1 to _count do {
      _string = _string + "|";
    };
    _text = [_string, _color] call AGM_Core_fnc_stringToColoredText;

    _string = "";
    for "_a" from (_count + 1) to (_maxRounds min COUNT_BARS) do {
      _string = _string + "|";
    };

    composeText [
      _text,
      [_string, [0.5, 0.5, 0.5]] call AGM_Core_fnc_stringToColoredText
    ]
  };

  _picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");

  [_text, _picture] call AGM_Core_fnc_displayTextPicture;
};
