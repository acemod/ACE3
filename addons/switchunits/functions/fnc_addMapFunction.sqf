/*
 * Author: bux578
 * Adds a mapClick Eventhandler
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_switchunits_fnc_addMapFunction
 *
 * Public: No
 */
#include "script_component.hpp"

addMissionEventHandler ["MapSingleClick", {
    params ["", "_pos", "_alt", "_shift"];
    if (alive ACE_player && {GVAR(OriginalUnit) getVariable ["ACE_CanSwitchUnits", false]}) then {
        [[GVAR(OriginalUnit), GVAR(switchableSides)], _pos, _shift, _alt] call FUNC(handleMapClick);
    };
}];
