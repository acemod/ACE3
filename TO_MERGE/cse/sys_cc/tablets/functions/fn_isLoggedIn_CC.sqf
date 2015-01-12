/**
 * fn_isLoggedIn_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_deviceName"];
_deviceName = _this select 0;
_loggedIn = false;

_trackers = [player,_deviceName] call cse_fnc_getAllBFTItemsOfType_CC;
{
	 _info = [_x] call cse_fnc_getTrackerInformation_CC;
	 if (_info select 3) then {
	 	_loggedIn = true;
	 };
}foreach _trackers;
//_trackerInfo = [_tracker] call cse_fnc_getTrackerInformation_CC;

_loggedIn