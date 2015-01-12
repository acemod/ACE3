/*
 * Author: commy2
 *
 * Mutes the unit. It won't trigger auto generated chat messages either.
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Nothing
 */
#include "\z\ace\addons\core\script_component.hpp"

private ["_unit", "_speaker"];

_unit = _this select 0;

if (isNull _unit) exitWith {};

_speaker = speaker _unit;
if (_speaker == "ACE_NoVoice") exitWith {};

[0, "{(_this select 1) setSpeaker 'ACE_NoVoice'}", _unit, "ACE_Speaker"] call FUNC(execPersistentFnc);

_unit setVariable ["ACE_OriginalSpeaker", _speaker, true];
