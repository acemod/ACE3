// by commy2

private "_crate";

_crate = _this select 1;

isNull (missionNamespace getVariable ["AGM_Fortifications_Setup", objNull])
&& {!([_crate] call AGM_Core_fnc_owned)}
