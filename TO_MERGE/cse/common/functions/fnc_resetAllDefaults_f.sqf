/**
 * fn_resetAllDefaults_f.sqf
 * @Descr: reset all variables that have been defined
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_oldUnit","_sets"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_oldUnit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

//_unit setvariable[QGVAR(unconscious_non_captive_f),nil];
if (missionNamespace getvariable [QGVAR(unconscious_non_captive_f),false]) then {
	_unit setCaptive false;
	missionNamespace setvariable[QGVAR(unconscious_non_captive_f),nil];
	[format["Detected unit as a non captive but in captive state. RESETTING"]] call FUNC(debug);
} else {
	[format["didn't trigger but unit is: %1 - %2", captive _unit, (missionNamespace getvariable [QGVAR(unconscious_non_captive_f),false])]] call FUNC(debug);
};

_unit setvariable [QGVAR(isDead),nil,true];
_unit setvariable [QGVAR(stateUnconscious), nil, true];

if (isPlayer _unit) then {
	[true] call FUNC(setVolume_f);
	[false] call FUNC(disableKeyInput_f);
	[false] call FUNC(effectBlackOut);
	[player, -1] call FUNC(limitSpeed);
	if (isnil QGVAR(DISABLE_USER_INPUT_COLLECTION_F)) then {
		GVAR(DISABLE_USER_INPUT_COLLECTION_F) = [];
	};
	{
		[_X, false] call FUNC(disableUserInput_f);
	}foreach GVAR(DISABLE_USER_INPUT_COLLECTION_F);
};
_sets = [_unit] call FUNC(getAllDefinedSetVariables);
[format["defaults for %1 : %2",_unit,_sets]] call FUNC(debug);
if ((count _sets) > 0) then {
	{
		if (!(_x select 4)) then {
			_unit setvariable [(_x select 0),nil,_x select 3];
			[format["RESETTING: %1",[(_x select 0),_unit, _x select 1, (_unit getvariable (_x select 0))]]] call FUNC(debug);
		};
	}foreach _sets;
} else {
	["No defaults have been set"] call FUNC(debug);
};
[[_unit],"resetToDefaults"] call FUNC(customEventHandler_F);