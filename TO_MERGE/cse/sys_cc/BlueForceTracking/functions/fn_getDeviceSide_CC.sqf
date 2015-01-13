
private ["_device","_side","_deviceName"];
_deviceName = _this select 0;
_side = playerSide;
if (isnil "CSE_REGISTERED_DEVICES_CC") then {
	CSE_REGISTERED_DEVICES_CC = [];
};
{
	if ((_x select 0) == _deviceName) exitwith {
		_side = _x select 3;
	};
}foreach CSE_REGISTERED_DEVICES_CC;
_side