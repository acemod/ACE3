/**
 * fn_getAllviewableFeeds_CC.sqf
 * @Descr: Get all feeds that are viewable for provided device classname.
 * @Author: Glowbal
 *
 * @Arguments: [deviceName STRING (Device classname)]
 * @Return: ARRAY An array with objects that have a viewable feed.
 * @PublicAPI: true
 */

private ["_deviceName", "_return", "_displayText"];
_deviceName = _this select 0;

_return = [];
{
	if (_x isKindOf "CAManBase") then {
		if ([_x, _deviceName] call cse_fnc_canViewFeed_CC) then {
			_trackerInfo = [_x] call cse_fnc_getTrackerInformation_CC;
			_displayText = _trackerInfo select 1;
			if (_displayText == "") then {
				_displayText = format["Unknown: ", _trackerInfo select 0];
			};
			_return pushback [_displayText, [_x]];
		};
	};
}foreach allUnits;

{
	if ([_x, _deviceName] call cse_fnc_canViewFeed_CC) then {
		_trackerInfo = [_x] call cse_fnc_getTrackerInformation_CC;
		_displayText = _trackerInfo select 1;
		if (_displayText == "") then {
			_displayText = format["UAV: %1", [_x] call cse_fnc_findTargetName_gui];
		};
		_return pushback [_displayText, [_x]];
	};

}foreach allUnitsUAV;

_return;