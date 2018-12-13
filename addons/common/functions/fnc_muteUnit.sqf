#include "script_component.hpp"
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
 * Example:
 * [bob, "because"] call ace_common_fnc_muteUnit
 *
 * Public: Yes
 */

params ["_unit", "_reason"];

if (isNull _unit) exitWith {};

// add reason to mute to the unit
private _muteUnitReasons = _unit getVariable [QGVAR(muteUnitReasons), []];

if !(_reason in _muteUnitReasons) then {
    _muteUnitReasons pushBack _reason;
    _unit setVariable [QGVAR(muteUnitReasons), _muteUnitReasons, true];
};

private _speaker = speaker _unit;

if (_speaker == "ACE_NoVoice") exitWith {};

[QGVAR(setSpeaker), [_unit, "ACE_NoVoice"]] call CBA_fnc_globalEvent;

_unit setVariable ["ACE_OriginalSpeaker", _speaker, true];
