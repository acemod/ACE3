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
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_speaker", "_muteUnitReasons"];
params ["_unit", "_reason"];

if (isNull _unit) exitWith {};

// remove reason to mute to the unit
_muteUnitReasons = _unit getVariable [QGVAR(muteUnitReasons), []];

if (_reason in _muteUnitReasons) then {
    _muteUnitReasons deleteAt (_muteUnitReasons find _reason);
    _unit setVariable [QGVAR(muteUnitReasons), _muteUnitReasons, true];
};

// don't unmute if there is another mute reason!
if (count _muteUnitReasons > 0) exitWith {};

_speaker = _unit getVariable ["ACE_OriginalSpeaker", ""];

if (_speaker == "") exitWith {};

["setSpeaker", _unit, _this] call FUNC(targetEvent);
