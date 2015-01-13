/**
 * fn_setLoggedIn_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName","_loggedIn","_trackers"];
_deviceName = _this select 0;
_loggedIn = _this select 1;

_trackers = [player,_deviceName] call cse_fnc_getAllBFTItemsOfType_CC;
{
	 _info = [_x] call cse_fnc_getTrackerInformation_CC;
	 _info set [3, _loggedIn];
	 [_x, _info] call cse_fnc_setTrackerInformation_CC;
}foreach _trackers;