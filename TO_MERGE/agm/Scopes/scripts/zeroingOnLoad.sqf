disableSerialization;

_display = _this select 0;
uiNamespace setVariable ["AGM_Scopes_ZeroingDisplay", _display];
_vertical = _display displayCtrl 925002;
_horizontal = _display displayCtrl 925003;

_weapons = [
  primaryWeapon player,
  secondaryWeapon player,
  handgunWeapon player
];

if ((currentWeapon player) in _weapons) then {
  _zeroing = AGM_Scopes_Adjustment select (_weapons find (currentWeapon player));
  _horizontal ctrlSetText (str (_zeroing select 0));
  _vertical ctrlSetText (str (_zeroing select 1));
};
