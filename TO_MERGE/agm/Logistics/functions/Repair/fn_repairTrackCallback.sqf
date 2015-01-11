// by commy2

#define POST_REPAIR_DAMAGE 0

private ["_vehicle", "_part", "_spareTrack", "_name", "_string"];

_vehicle = _this select 0;
_part = _this select 1;
_spareTrack = _this select 2;

deleteVehicle _spareTrack;

[_vehicle, _part, POST_REPAIR_DAMAGE] call AGM_Repair_fnc_setHitPointDamage;

[player, "AmovPknlMstpSrasWrflDnon", 1] call AGM_Core_fnc_doAnimation;

_name = [_part] call AGM_Repair_fnc_getHitPointName;
_string = format [localize "STR_AGM_Repair_Repaired", _name];

[_string] call AGM_Core_fnc_displayTextStructured;
