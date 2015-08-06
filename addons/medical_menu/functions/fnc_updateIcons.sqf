/*
 * Author: Glowbal
 * Update the category icons
 *
 * Arguments:
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_display","_startIDC","_idc","_options","_name","_amount"];
disableSerialization;
_display = uiNamespace getVariable QGVAR(medicalMenu);

_startIDC = 111;

_options = ["triage" , "examine", "bandage", "medication", "airway", "advanced", "drag", "toggle"];
for "_idc" from _startIDC to 118 step 1 do {
    _amount = [ACE_player, GVAR(INTERACTION_TARGET), _options select (_idc - 111)] call FUNC(getTreatmentOptions);
    if ((count _amount) > 0 || _idc == 111 || _idc == 118) then {
        (_display displayCtrl _idc) ctrlSettextColor [1,1,1,1];
    } else {
        (_display displayCtrl _idc) ctrlSettextColor [0.4,0.4,0.4,1];
    };
};