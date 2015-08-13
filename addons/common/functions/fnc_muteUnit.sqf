/*
 * Author: commy2
 *
 * Mutes the unit. It won't trigger auto generated chat messages either.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reason to mute the unit (String)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_reason"];

if (isNull _unit) exitWith {};

// add reason to mute to the unit
private ["_muteUnitReasons", "_speaker"];
_muteUnitReasons = _unit getVariable [QGVAR(muteUnitReasons), []];

if !(_reason in _muteUnitReasons) then {
    _muteUnitReasons pushBack _reason;
    _unit setVariable [QGVAR(muteUnitReasons), _muteUnitReasons, true];
};

_speaker = speaker _unit;

if (_speaker == "ACE_NoVoice") exitWith {};

["setSpeaker", [_unit, "ACE_NoVoice"]] call FUNC(globalEvent);

_unit setVariable ["ACE_OriginalSpeaker", _speaker, true];
