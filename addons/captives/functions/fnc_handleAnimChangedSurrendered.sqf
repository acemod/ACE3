#include "script_component.hpp"
/*
 * Author: Nic547, commy2
 * Restart the surrendering animation if it got interrupted. Called from a AnimChanged EH.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: New animation <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "movearm"] call ACE_captives_fnc_handleAnimChangedSurrendered
 *
 * Public: No
 */

params ["_unit", "_newAnimation"];

TRACE_2("AnimChanged",_unit,_newAnimation);
if ((_newAnimation != "ACE_AmovPercMstpSsurWnonDnon") && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
    TRACE_1("Surrender animation interrupted",_newAnimation);
    [_unit, "ACE_AmovPercMstpSsurWnonDnon", 1] call EFUNC(common,doAnimation);
};
