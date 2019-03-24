#include "script_component.hpp"
/*
 * Author: Glowbal
 * Opens the Medical Menu for given target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_medical_gui_fnc_openMenu
 *
 * Public: No
 */

params ["_target"];

if (dialog || {isNull _target}) exitWith {
    private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
    if (!isNull _display) then {closeDialog 0};
};

// Store current target
GVAR(target) = _target;

// Create the menu display
createDialog "ACE_Medical_Menu";
GVAR(lastOpenedOn) = CBA_missionTime;
