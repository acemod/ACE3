#include "script_component.hpp"

disableSerialization;

_display = _this select 0;
uiNamespace setVariable [QGVAR(ZeroingDisplay, _display];
_vertical = _display displayCtrl 925002;
_horizontal = _display displayCtrl 925003;

_weapons = [
    primaryWeapon player,
    secondaryWeapon player,
    handgunWeapon player
];

if ((currentWeapon ACE_player) in _weapons) then {
    _zeroing = GVAR(Adjustment) select (_weapons find (currentWeapon ACE_player));
    _horizontal ctrlSetText (str (_zeroing select 0));
    _vertical ctrlSetText (str (_zeroing select 1));
};
