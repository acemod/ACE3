/*
 * Author: commy2
 * Mutes the unit. It won't trigger auto generated chat messages either.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason to mute the unit <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_reason"];

if (isNull _unit) exitWith {};

private ["_muteUnitReasons", "_speaker"];

// add reason to mute to the unit
_muteUnitReasons = _unit getVariable [QGVAR(muteUnitReasons), []];

if !(_reason in _muteUnitReasons) then {
    _muteUnitReasons pushBack _reason;
    _unit setVariable [QGVAR(muteUnitReasons), _muteUnitReasons, true];
};

_speaker = speaker _unit;

if (_speaker == "ACE_NoVoice") exitWith {};

["setSpeaker", [_unit, "ACE_NoVoice"]] call FUNC(globalEvent);

_unit setVariable ["ACE_OriginalSpeaker", _speaker, true];
