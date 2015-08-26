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
 * [some_player] call ace_medical_menu_openMenu
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_interactionTarget"];

if (dialog || isNull _interactionTarget) exitwith {
    disableSerialization;

    private ["_display", "_handled"];
    _handled = false;
    _display = uiNamespace getVariable QGVAR(medicalMenu);
    if (!isNil "_display") then {
        closeDialog 314412;
        _handled = true;
    };

    _handled
};

GVAR(INTERACTION_TARGET) = _interactionTarget;

createDialog QGVAR(medicalMenu);
GVAR(lastOpenedOn) = ACE_time;

true
