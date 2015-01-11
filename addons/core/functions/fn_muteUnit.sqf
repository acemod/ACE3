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

private ["_unit", "_speaker"];

_unit = _this select 0;

if (isNull _unit) exitWith {};

_speaker = speaker _unit;
if (_speaker == "AGM_NoVoice") exitWith {};

[0, "{(_this select 1) setSpeaker 'AGM_NoVoice'}", _unit, "AGM_Speaker"] call GVAR(fnc_execPersistentFnc);

_unit setVariable ["AGM_OriginalSpeaker", _speaker, true];
