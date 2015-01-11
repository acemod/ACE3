// by commy2

private ["_magazine", "_ammo", "_ammoCount", "_fullMagazinesCount", "_restAmmo", "_isLoaded", "_weapon", "_reloadAction", "_text", "_picture"];

_magazine = _this select 0;

// exit if the last magazine of this type was taken out of the backpack
if !(_magazine in magazines player) exitWith {};

// get current ammo count
_ammo = 0;
{
  if (_x select 0 == _magazine) then {
    _ammo = _ammo + (_x select 1);
  };
} forEach magazinesAmmoFull player;

// how many rounds fit in one mag
_ammoCount = getNumber (configFile >> "CfgMagazines" >> _magazine >> "count");

// calculate new vaules
_fullMagazinesCount = floor (_ammo / _ammoCount);
_restAmmo = _ammo - _fullMagazinesCount * _ammoCount;

// remove old magazines
player removeMagazines _magazine;

_isLoaded = false;
// reload rifle
if (_magazine in primaryWeaponMagazine player) then {
  _weapon = primaryWeapon player;

  if (_fullMagazinesCount > 0) then {
    player setAmmo [_weapon, _ammoCount];
    _fullMagazinesCount = _fullMagazinesCount - 1;
  } else {
    player setAmmo [_weapon, _restAmmo];
    _restAmmo = 0;
  };

  if (_weapon == currentWeapon player) then {
    _reloadAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
    player playActionNow _reloadAction;
  };

  _isLoaded = true;
};

// reload pistol
if (_magazine in handgunMagazine player) then {
  _weapon = handgunWeapon player;

  if (_fullMagazinesCount > 0) then {
    player setAmmo [_weapon, _ammoCount];
    _fullMagazinesCount = _fullMagazinesCount - 1;
  } else {
    player setAmmo [_weapon, _restAmmo];
    _restAmmo = 0;
  };

  if (_weapon == currentWeapon player) then {
    _reloadAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
    player playActionNow _reloadAction;
  };

  _isLoaded = true;
};

// reload rocket launcher (just in case ...)
if (_magazine in secondaryWeaponMagazine player) then {
  _weapon = secondaryWeapon player;

  if (_fullMagazinesCount > 0) then {
    player setAmmo [_weapon, _ammoCount];
    _fullMagazinesCount = _fullMagazinesCount - 1;
  } else {
    player setAmmo [_weapon, _restAmmo];
    _restAmmo = 0;
  };

  if (_weapon == currentWeapon player) then {
    _reloadAction = getText (configFile >> "CfgWeapons" >> _weapon >> "reloadAction");
    player playActionNow _reloadAction;
  };

  _isLoaded = true;
};

// add new magazines
for "_a" from 1 to _fullMagazinesCount do {
  player addMagazine _magazine;
};

if (_restAmmo > 0) then {
  player addMagazine [_magazine, _restAmmo];
};

// display text if successful
_text = format [localize "STR_AGM_MagazineRepack_RepackedMagazinesDetail", [_fullMagazinesCount, _fullMagazinesCount + 1] select _isLoaded, _restAmmo];
_picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");

_text = parseText format ["<img align='center' size='1.8' color='#ffffff' image='%1'/> <br/> <t align='center'>%2</t> <br/> <t align='center'>%3</t>", _picture, localize "STR_AGM_MagazineRepack_RepackedMagazines", _text];

[_text] call AGM_Core_fnc_displayTextStructured;
