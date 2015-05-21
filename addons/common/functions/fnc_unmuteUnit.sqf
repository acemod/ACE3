/*
 * Author: commy2
 *
 * Unmutes the unit. Only unmutes if the last reason was removed.
 *
 * Argument:
 * 0: Unit (Object)
 * 1: Reason to unmute the unit. (String)
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

PARAMS_2(_unit,_reason);

if (isNull _unit) exitWith {};

// remove reason to mute to the unit
private "_muteUnitReasons";
_muteUnitReasons = _unit getVariable [QGVAR(muteUnitReasons), []];

if (_reason in _muteUnitReasons) then {
    _muteUnitReasons deleteAt (_muteUnitReasons find _reason);
    _unit setVariable [QGVAR(muteUnitReasons), _muteUnitReasons, true];
};

// don't unmute if there is another mute reason!
if (count _muteUnitReasons > 0) exitWith {};

private "_speaker";
_speaker = _unit getVariable ["ACE_OriginalSpeaker", ""];

if (_speaker == "") exitWith {};

["setSpeaker", _unit, [_unit, _speaker]] call FUNC(targetEvent);
