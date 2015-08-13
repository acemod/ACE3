/*
 * Author: commy2
 *
 * ?
 *
 * Arguments:
 * ?
 *
 * Return Value:
 * ?
 *
 * Public: ?
 */
#include "script_component.hpp"

params ["_unit"];

// setVariable is broken on JIP after respawn
_unit setVariable [QGVAR(muteUnitReasons), _unit getVariable [QGVAR(muteUnitReasons), []], true];

// fix mp issues with respawning and the speaker
["setSpeaker", [_unit, speaker _unit]] call FUNC(globalEvent);
