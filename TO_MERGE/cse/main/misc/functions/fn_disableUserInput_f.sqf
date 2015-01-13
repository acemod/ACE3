/**
 * fn_disableUserInput_f.sqf
 * @Descr: Disables the user input. Works stacked.
 * @Author: Glowbal
 *
 * @Arguments: [id STRING, disable BOOL]
 * @Return: void
 * @PublicAPI: true
 */

private ["_id","_disable"];
_id = _this select 0;
_disable = _this select 1;


if (isnil "CSE_DISABLE_USER_INPUT_COLLECTION_F") then {
	CSE_DISABLE_USER_INPUT_COLLECTION_F = [];
};

if (_disable) then {
	CSE_DISABLE_USER_INPUT_COLLECTION_F pushback _id;
	[true] call cse_fnc_disableKeyInput_f;
} else {
	CSE_DISABLE_USER_INPUT_COLLECTION_F = CSE_DISABLE_USER_INPUT_COLLECTION_F - [_id];
	if (CSE_DISABLE_USER_INPUT_COLLECTION_F isEqualTo []) then {
		[false] call cse_fnc_disableKeyInput_f;
	};
};