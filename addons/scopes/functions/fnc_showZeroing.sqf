
#include "script_component.hpp"

disableSerialization;

_display = uiNamespace getVariable [QGVAR(ZeroingDisplay), displayNull];
if (isNull _display) exitWith {};

_weapons = [
    primaryWeapon ACE_player,
    secondaryWeapon ACE_player,
    handgunWeapon ACE_player
];

if !((currentWeapon ACE_player) in _weapons) exitWith {};

_adjustment = ACE_player getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    _adjustment = [[0,0], [0,0], [0,0]];
};

_zeroing = _adjustment select (_weapons find (currentWeapon ACE_player));
_vertical = _display displayCtrl 925002;
_horizontal = _display displayCtrl 925003;
_vertical ctrlSetText (str (_zeroing select 1));
_horizontal ctrlSetText (str (_zeroing select 0));
