/*
 * Author: TCVM
 * If the player is killed we drop the tripod and cancel the mount
 *
 * Arguments:
 * 0: Unit who died <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [deadPlayer] call ace_csw_fnc_handleKilled
 *
 * Public: No
 */
#include "script_component.hpp"

params["_unit"];

if (!isNull (missionNamespace getVariable[QGVAR(cswTripod), objNull]) && {GVAR(cswTripod) in attachedObjects _unit}) then {
    [_unit, 0] call FUNC(tripodDeploy);
};

