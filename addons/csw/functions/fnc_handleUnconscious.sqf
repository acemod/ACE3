/*
 * Author: TCVM
 * Stops moving the tripod or stops mounting the weapon if the player is uncon
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_handleUnconscious
 *
 * Public: No
 */
#include "script_component.hpp"

params["_unit"];

if (!local _unit) exitWith {};

if (!isNull (missionNamespace getVariable[QGVAR(cswTripod), objNull]) && {GVAR(cswTripod) in attachedObjects _unit}) then {
    [_unit, 0] call FUNC(tripodDeploy);
};

