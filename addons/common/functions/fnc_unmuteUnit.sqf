/*
 * Author: commy2
 *
 * Unmutes the unit.
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Nothing
 */
#include "\z\ace\addons\common\script_component.hpp"

private ["_unit", "_speaker"];

_unit = _this select 0;

if (isNull _unit) exitWith {};

_speaker = _unit getVariable ["ACE_OriginalSpeaker", ""];
if (_speaker == "") exitWith {};

[0, format ["{(_this select 1) setSpeaker '%1'}", _speaker], _unit, "ACE_Speaker"] call FUNC(execPersistentFnc);
