// by commy2

private ["_dlg", "_show"];

_dlg = _this select 0;
_show = _this select 1;

if (_show) then {
  private "_config";

  _config = configFile >> "RscInGameUI" >> "RscUnitInfo" >> "WeaponInfoControlsGroupLeft" >> "controls" >> "CA_GrenadeCount";
  (_dlg displayCtrl 151) ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];

  _config = configFile >> "RscInGameUI" >> "RscUnitInfo" >> "WeaponInfoControlsGroupLeft" >> "controls" >> "CA_GrenadeType";
  (_dlg displayCtrl 152) ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];

} else {
  (_dlg displayCtrl 151) ctrlSetPosition [0,0,0,0];
  (_dlg displayCtrl 152) ctrlSetPosition [0,0,0,0];
};

(_dlg displayCtrl 151) ctrlCommit 0;
(_dlg displayCtrl 152) ctrlCommit 0;
