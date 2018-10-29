#include "script_component.hpp"
/*
 * Author: Glowbal
 * Open the medical menu for target
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * If action was taken <BOOL>
 *
 * Example:
 * [some_player] call ace_medical_menu_fnc_openMenu
 *
 * Public: No
 */

params ["_interactionTarget"];

if (dialog || {isNull _interactionTarget}) exitWith {
    disableSerialization;

    private _display = uiNamespace getVariable QGVAR(medicalMenu);
    if (!isNil "_display") then {
        closeDialog 314412;
    };
};

GVAR(INTERACTION_TARGET) = _interactionTarget;

createDialog QGVAR(medicalMenu);
GVAR(lastOpenedOn) = CBA_missionTime;

true
