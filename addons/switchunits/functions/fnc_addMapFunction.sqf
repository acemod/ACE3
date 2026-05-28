#include "..\script_component.hpp"
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

addMissionEventHandler ["MapSingleClick", {
    params ["", "_pos"];
    if (alive ACE_player && {GVAR(OriginalUnit) getVariable ["ACE_CanSwitchUnits", false]}) then {
        [GVAR(switchableSides), _pos] call FUNC(handleMapClick);
    };
}];
