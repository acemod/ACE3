// by commy2

private ["_show", "_control"];

_show = _this select 0;

disableSerialization;
_control = (uiNamespace getVariable ["AGM_dlgSoldier", displayNull]) displayCtrl 187;

if (isNull _control) exitWith {};

if (_show) then {
  private "_config";
  _config = configFile >> "RscInGameUI" >> "RscUnitInfoSoldier" >> "WeaponInfoControlsGroupLeft" >> "controls" >> "CA_ModeTexture";

  _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
  _control ctrlCommit 0;
} else {
  _control ctrlSetPosition [0, 0, 0, 0];
  _control ctrlCommit 0;
};
