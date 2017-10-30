/*
 * Author: TCVM
 * If the player opens the interact menu we drop the tripod and cancel the mount
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_handleInteractMenu
 *
 * Public: No
 */
#include "script_component.hpp"

params["_unit"];

if (!isNull (missionNamespace getVariable[QGVAR(cswTripod), objNull]) && {GVAR(cswTripod) in attachedObjects _unit}) then {
    [_unit, 0] call FUNC(tripodDeploy);
};

