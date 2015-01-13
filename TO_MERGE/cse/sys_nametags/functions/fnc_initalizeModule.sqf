/**
 * fnc_initalizeModule.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

if (!hasInterface) exitwith {}; // No need for this module on HC or dedicated server.

private ["_logic"];
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isNull _logic) then {
	// TODO default values should be defined somewhere through an include, so they are the same in CfgVehicles and here.
	GVAR(ENABLE_MODULE) = _logic getvariable ["enableModule", false];
	GVAR(INDIRECT_TAGS_DISTANCE) = _logic getvariable ["indirectDistance", 7.5];
	GVAR(DIRECT_TAG_DISTANCE) = _logic getvariable ["cursorTargetDistance", 20];
	GVAR(ALLOW_OWN_SIDE_ONLY) = !(_logic getvariable ["allowDifferentSides", false]);
	GVAR(ENABLE_SOUNDWAVES) = _logic getvariable ["enableSoundWaves", false];
};