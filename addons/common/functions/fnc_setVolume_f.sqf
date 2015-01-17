/**
 * fn_setVolume_f.sqf
 * @Descr: Sets the volume of the game, including third party radio modifications such as TFAR and ACRE.
 * @Author: Glowbal
 *
 * @Arguments: [setVolume BOOL]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

#define MUTED_LEVEL 0.2
#define NORMAL_LEVEL 1
#define NO_SOUND	0

private ["_setVolume"];
_setVolume = [_this, 0, false, [false]] call BIS_fnc_Param;

if (_setVolume) then {
	// Vanilla Game
	2 fadeSound NORMAL_LEVEL;

	// TFAR
	player setVariable ["tf_voiceVolume", NORMAL_LEVEL, true];
	player setVariable ["tf_globalVolume", NORMAL_LEVEL];
	player setVariable ["tf_unable_to_use_radio", false];

	// ACRE2
	player setVariable ["acre_sys_core_globalVolume", NORMAL_LEVEL];
 	player setVariable ["acre_sys_core_isDisabled", false, true];

} else {
	// Vanilla Game
	2 fadeSound MUTED_LEVEL;

	// TFAR
	player setVariable ["tf_voiceVolume", NO_SOUND, true];
	player setVariable ["tf_globalVolume", MUTED_LEVEL];
	player setVariable ["tf_unable_to_use_radio", true];

	// ACRE2
	player setVariable ["acre_sys_core_globalVolume", MUTED_LEVEL];
	player setVariable ["acre_sys_core_isDisabled", true, true];

};

[[_setVolume],"setVolume"] call FUNC(raiseScriptedEvent_f);