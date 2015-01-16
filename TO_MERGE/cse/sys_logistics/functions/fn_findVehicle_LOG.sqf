/**
 * fn_findVehicle_LOG.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_loadcar","_loadhelicopter", "_loadtank", "_vehicle"];
_unit = _this select 0;
_loadcar = nearestObject [_unit, "car"];
_loadhelicopter = nearestObject [_unit, "air"];
_loadtank = nearestObject [_unit, "tank"];
_vehicle = ObjNull;


if (_unit distance _loadcar <= 10) then {
	_vehicle = _loadcar;
} else {
	if (_unit distance _loadhelicopter <= 10) then
	{
			_vehicle = _loadhelicopter;
	} else {
		if (_unit distance _loadtank <= 10) then
		{
			_vehicle = _loadtank;
		} else {
		};
	};
};
_vehicle