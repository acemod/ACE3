// by commy2

private ["_player", "_ctrlJavelinMode"];

_player = _this select 0;

disableSerialization;
_ctrlJavelinMode = (uiNamespace getVariable ["AGM_dlgJavelinOptics", displayNull]) displayCtrl 1006;

getNumber (configFile >> "CfgWeapons" >> currentWeapon _player >> "AGM_enableTopDownAttack") == 1
&& {ctrlShown _ctrlJavelinMode}
