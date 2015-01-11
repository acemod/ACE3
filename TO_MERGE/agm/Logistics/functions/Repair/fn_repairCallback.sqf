// by commy2
// Edited by Hawkeye104 for compatibility with repair module

private ["_vehicle", "_part", "_name", "_string"];

_vehicle = _this select 0;
_part = _this select 1;

// Repair module parameter function call
[_vehicle, _part, AGM_Repair_MaxDamageRepair] call AGM_Repair_fnc_setHitPointDamage;

[player, "AmovPknlMstpSrasWrflDnon", 1] call AGM_Core_fnc_doAnimation;

_name = [_part] call AGM_Repair_fnc_getHitPointName;
_string = format [localize "STR_AGM_Repair_Repaired", _name];

[_string] call AGM_Core_fnc_displayTextStructured;
