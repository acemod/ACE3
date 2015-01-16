/**
 * fn_getCurrentApplication_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return","_deviceName"];

_deviceName = (call cse_fnc_getCurrentDeviceName_CC);
_return = "home";
if (!isnil format["CSE_CURRENT_APPLICATION_%1_CC",_deviceName]) then {
	_return = call compile format["CSE_CURRENT_APPLICATION_%1_CC",_deviceName];
};
_return