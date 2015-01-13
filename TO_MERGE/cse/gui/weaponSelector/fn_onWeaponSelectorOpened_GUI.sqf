private ["_display", "_currentWeapon", "_primaryWeapon", "_secondairyWeapon", "_pistol"];
_display = _this select 0;

_currentWeapon = currentWeapon player;
_primaryWeapon = primaryWeapon player;
_secondairyWeapon = secondaryWeapon player;
_pistol = handgunWeapon player;

// getText(configFile >> "CfgMagazines" >> "%1" >> "displayName"), getText(configFile >> "CfgMagazines" >> "%1" >> "picture");


(_display displayCtrl 710) ctrlSetText (getText(configFile >> "CfgWeapons" >> _currentWeapon >> "picture"));

(_display displayCtrl 100) ctrlSetText (getText(configFile >> "CfgWeapons" >> _currentWeapon >> "picture"));

(_display displayCtrl 103) ctrlSetText (getText(configFile >> "CfgWeapons" >> _secondairyWeapon >> "picture"));

(_display displayCtrl 104) ctrlSetText (getText(configFile >> "CfgWeapons" >> _pistol >> "picture"));

// (_display displayCtrl 107) ctrlSetText (getText(configFile >> "CfgWeapons" >> _currentWeapon >> "picture"));