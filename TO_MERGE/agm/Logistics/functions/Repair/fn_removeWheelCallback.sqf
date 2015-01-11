// by commy2

private ["_vehicle", "_part", "_damage", "_wheel", "_name", "_string"];

_vehicle = _this select 0;
_part = _this select 1;

_damage = _vehicle getHitPointDamage _part;

// can't remove destroyed or already removed wheel
if (_damage == 1) exitWith {};

[_vehicle, _part, 1, true] call AGM_Repair_fnc_setHitPointDamage;

[player, "AmovPknlMstpSrasWrflDnon", 1] call AGM_Core_fnc_doAnimation;

_wheel = ['AGM_SpareWheel', getPosASL player] call AGM_Logistics_fnc_spawnObject;
_wheel setdamage _damage;

_name = [_part] call AGM_Repair_fnc_getHitPointName;
_string = format [localize "STR_AGM_Repair_RemovedWheel", _name];

[_string] call AGM_Core_fnc_displayTextStructured;
