// by commy2

#define COLOR_ON [0.2941, 0.8745, 0.2157, 1.0]
#define COLOR_OFF [0.2941, 0.2941, 0.2941, 1.0]

private ["_state", "_dlgJavelinOptics", "_ctrlJavelinModeTop", "_ctrlJavelinModeDir"];

_state = missionNamespace getVariable ["AGM_TopDownAttack_modeJavelin", 0];

_state = [1, 0] select _state;

AGM_TopDownAttack_modeJavelin = _state;

playSound "AGM_Sound_Click";

disableSerialization;
_dlgJavelinOptics = uiNamespace getVariable ["AGM_dlgJavelinOptics", displayNull];

_ctrlJavelinModeTop = _dlgJavelinOptics displayCtrl 1006;
_ctrlJavelinModeDir = _dlgJavelinOptics displayCtrl 1007;

_ctrlJavelinModeTop ctrlSetTextColor ([COLOR_OFF, COLOR_ON] select _state);
_ctrlJavelinModeDir ctrlSetTextColor ([COLOR_ON, COLOR_OFF] select _state);
