/*
 * Author: TCVM
 * If the player changes away we drop the tripod and cancel the mount
 *
 * Arguments:
 * 0: New Unit <OBJECT>
 * 1: Old Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [oldPlayer, newPlayer] call ace_csw_fnc_handlePlayerChanged
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNull (GVAR(cswTripod))) exitWith {};

params["_newPlayer", "_oldPlayer"];

if (GVAR(cswTripod) in attachedObjects _newPlayer) then {
    [_newPlayer, 0] call FUNC(tripodDeploy);
};

