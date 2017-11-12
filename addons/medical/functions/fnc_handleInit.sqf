/*
 * Author: KoffeinFlummi
 * Called when a unit is initialized via XEH_init
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ACE_medical_fnc_handleInit
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];

if (local _unit) then {
    if (!EGVAR(common,settingsInitFinished)) exitWith {
        EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(init), [_unit]];
    };
    [_unit] call FUNC(init);
};
