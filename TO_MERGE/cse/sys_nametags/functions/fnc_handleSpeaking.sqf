/**
 * fn_handleSpeaking_TAGS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

// TODO Implement a check mod loaded function
#define ACTION_PUSH_TO_TALK_PRESSED (inputAction "PushToTalk" > 0)
#define ACTION_TFAR_RADIO_ACTIVE	false // [] call {if (["task_force_radio"] call FUNC(isModLoaded_F)) then {player call TFAR_fnc_isSpeaking} else { false };}
#define ACTION_ACRE_RADIO_ACTIVE	false // [] call {if (["acre_api"] call FUNC(isModLoaded_F)) then {[player] call ACRE_api_fnc_isBroadcasting} else { false };}

private ["_unit"];
_unit = _this select 0;

if (_unit != player /* _unit != ACE_Player */) exitwith {};

// TODO check mod loaded function
/*if (["task_force_radio"] call FUNC(isModLoaded_F)) then {
	waituntil {!isnil "TF_tangent_lr_pressed"};
};*/

waituntil {
	if (ACTION_TFAR_RADIO_ACTIVE || ACTION_PUSH_TO_TALK_PRESSED || ACTION_ACRE_RADIO_ACTIVE) then {
		if !(_unit getvariable [QGVAR(isSpeaking), false]) then {
			_unit setvariable [QGVAR(isSpeaking), true, true];
		};
	} else {
		if (_unit getvariable [QGVAR(isSpeaking), false]) then {
			_unit setvariable [QGVAR(isSpeaking), false, true];
		};
	};
	!(alive _unit) /* _unit != ACE_Player */
};

_unit setvariable [QGVAR(isSpeaking),nil,true];