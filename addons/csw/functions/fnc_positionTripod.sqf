/*
 * Author: TCVM
 * Moves the tripod around with the player
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Tripod <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, tripod] call ace_csw_fnc_positionTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params["_player", "_tripod"];

[_player select 1, "forceWalk", "ACE_csw", true] call EFUNC(common,statusEffect_set);
_tripod attachTo [_player select 1, [0, 2, 0.5]];

GVAR(cswTripod) = _tripod;

[localize LSTRING(confirmDeployment_hint), ""] call EFUNC(interaction,showMouseHint);

(_player select 1) setVariable[QGVAR(canMoveTripod), false, true];
(_player select 1) setVariable[QGVAR(MoveTripod), [
    (_player select 1),"DefaultAction",
    {!isNull GVAR(cswTripod)},
    {[_this select 0, GVAR(cswTripod)] call FUNC(tripodDeploy)}
] call EFUNC(common,addActionEventHandler)]

