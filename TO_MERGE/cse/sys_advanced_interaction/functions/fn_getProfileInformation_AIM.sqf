/**
 * fn_getProfileInformation_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_set"];
_unit = _this select 0;
_set = _this select 1;
if (count (_unit getvariable ["cse_profile_information_aim",[]]) == 0) then {
	[_unit] call cse_fnc_generateProfileInformation_AIM;
};
_profile = _unit getvariable ["cse_profile_information_aim",[]];
// [_occupation, _dateOfBirth, _politicalViews, _culture, _supportedSides, _homeTown]

switch (_set) do {
	case "Culture": {
		_profile select 3
	};
	case "Occupation": {
		_profile select 0
	};
	case "PoliticalViews": {
		_profile select 2
	};
	case "SupportedSides": {
		_profile select 4
	};
	case "homeTown": {
		_profile select 5
	};
	case "dateOfBirth": {
		_profile select 6
	};
	default {
		"Unknown"
	};
};