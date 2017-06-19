/*
 * Author: commy2
 * Applies speaker changes on init post. Used because setSpeaker is broken on init.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_muteUnitHandleInitPost
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// setSpeaker gets overwritten after init on remote units; if unit is muted, setSpeaker again
if (count (_unit getVariable [QGVAR(muteUnitReasons), []]) > 0) then {
    [QGVAR(setSpeaker), [_unit, "ACE_NoVoice"]] call CBA_fnc_localEvent;
};
