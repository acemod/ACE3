/**
 * fn_resetAllDefaults_f.sqf
 * @Descr: reset all variables that have been defined
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_oldUnit","_sets","_CSEFadingBlackUI","_ctrlFadingBlackUI"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_oldUnit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

//_unit setvariable["cse_unconscious_non_captive_f",nil];
if (missionNamespace getvariable ["cse_unconscious_non_captive_f",false]) then {
	_unit setCaptive false;
	missionNamespace setvariable["cse_unconscious_non_captive_f",nil];
	[format["Detected unit as a non captive but in captive state. RESETTING"]] call cse_fnc_debug;
} else {
	[format["didn't trigger but unit is: %1 - %2", captive _unit, (missionNamespace getvariable ["cse_unconscious_non_captive_f",false])]] call cse_fnc_debug;
};

_unit setvariable ["cse_isDead",nil,true];
_unit setvariable ["cse_state_unconscious", nil, true];

if (isPlayer _unit) then {
	[true] call cse_fnc_setVolume_f;
	[false] call cse_fnc_disableKeyInput_f;
	[false] call cse_fnc_effectBlackOut;
	[player, -1] call cse_fnc_limitSpeed;
	if (isnil "CSE_DISABLE_USER_INPUT_COLLECTION_F") then {
		CSE_DISABLE_USER_INPUT_COLLECTION_F = [];
	};
	{
		[_X, false] call cse_fnc_disableUserInput_f;
	}foreach CSE_DISABLE_USER_INPUT_COLLECTION_F;
};
_sets = [_unit] call cse_fnc_getAllSetVariables;
[format["defaults for %1 : %2",_unit,_sets]] call cse_fnc_debug;
if ((count _sets) > 0) then {
	{
		if (!(_x select 4)) then {
			_unit setvariable [(_x select 0),nil,_x select 3];
			[format["RESETTING: %1",[(_x select 0),_unit, _x select 1, (_unit getvariable (_x select 0))]]] call cse_fnc_debug;
		};
	}foreach _sets;
} else {
	["No defaults have been set"] call cse_fnc_debug;
};
[[_unit],"resetToDefaults"] call cse_fnc_customEventHandler_F;