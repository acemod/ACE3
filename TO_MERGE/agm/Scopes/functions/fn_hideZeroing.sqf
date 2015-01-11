// by commy2

private ["_state", "_ctrl"];

_state = _this select 0;

disableSerialization;
_ctrl = (uiNamespace getVariable ['AGM_dlgWeaponZeroing', displayNull]) displayCtrl 168;

if (_state) then {
  _ctrl ctrlSetPosition [0,0,0,0];
} else {
  private "_config";

  _config = configFile >> "RscInGameUI" >> "RscWeaponZeroing" >> "CA_Zeroing";

  _ctrl ctrlSetPosition [
    getNumber (_config >> "x"),
    getNumber (_config >> "y"),
    getNumber (_config >> "w"),
    getNumber (_config >> "h")
  ];
};

_ctrl ctrlCommit 0;
