/*
 * Author: Glowbal
 * Update the category icons
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_menu_fnc_updateIcons
 *
 * Public: No
 */
#include "script_component.hpp"

#define START_IDC 111
#define END_IDC 118

disableSerialization;

private _display = uiNamespace getVariable QGVAR(medicalMenu);
private _options = ["triage" , "examine", "bandage", "medication", "airway", "advanced", "drag", "toggle"];

for "_idc" from START_IDC to END_IDC step 1 do {
    private _amount = [ACE_player, GVAR(INTERACTION_TARGET), _options select (_idc - START_IDC)] call FUNC(getTreatmentOptions);
    if ((count _amount) > 0 || _idc == START_IDC || _idc == END_IDC) then {
        (_display displayCtrl _idc) ctrlSettextColor [1, 1, 1, 1];
    } else {
        (_display displayCtrl _idc) ctrlSettextColor [0.4, 0.4, 0.4, 1];
    };
};
