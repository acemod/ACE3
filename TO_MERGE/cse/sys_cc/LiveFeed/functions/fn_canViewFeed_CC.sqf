/**
 * fn_canViewFeed_CC.sqf
 * @Descr: Check if the provided device can view the feed of target if available.
 * @Author: Glowbal
 *
 * @Arguments: [target OBJECT, device STRING (Device classname)]
 * @Return: BOOL True if targets feed can be viewed with devices of given classname.
 * @PublicAPI: true
 */

private ["_target", "_return", "_deviceName", "_item"];
_target = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_deviceName = [_this, 1, "", [""]] call BIS_fnc_Param;

_return = false;
if (_target isKindOf "CAManBase") then {
	//if ([_target] call cse_fnc_hasTrackerItem_CC) then {
		if (_target getvariable ["cse_hasCameraFeed_enabled_CC", false]) then {
			_item = switch (([_deviceName] call cse_fnc_getDeviceSide_CC)) do {
				case WEST: {"cse_itemHelmetCamera_W"};
				case EAST: {"cse_itemHelmetCamera_O"};
				case independent: {"cse_itemHelmetCamera_I"};
				default {""};
			};
			if (_item == "") exitwith{};
			if ([_target, _item] call cse_fnc_hasItem_CC) then {
				_return = true;
			};
		};
	//};
} else {
	if (_deviceName != "") then {
		if (_target in allUnitsUAV) then {
			if (side _target == ([_deviceName] call cse_fnc_getDeviceSide_CC)) then {
				_return = true;
			};
		};
	};
};
_return;