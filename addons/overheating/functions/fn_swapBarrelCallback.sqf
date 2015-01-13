// by commy2

private ["_player", "_weapon"];

_player = _this select 0;
_weapon = _this select 1;

// don't consume the barrel, but rotate through them.
//player removeItem "AGM_SpareBarrel";

[localize "STR_AGM_Overheating_SwappedBarrel", "\AGM_Overheating\UI\spare_barrel_ca.paa"] call AGM_Core_fnc_displayTextPicture;

_player setVariable [format ["AGM_Overheating_%1", _weapon], [0, 0], false];
