/**
 * fn_getCurrentDeviceName_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_display"];
disableSerialization;
if (isnil "CSE_CURRENT_DEVICE_NAME_CC") then {
	CSE_CURRENT_DEVICE_NAME_CC = "";
};

 _display = findDisplay 590823;
 if (isNull _display) then {
 	CSE_CURRENT_DEVICE_NAME_CC = "";
 } else {

};
CSE_CURRENT_DEVICE_NAME_CC