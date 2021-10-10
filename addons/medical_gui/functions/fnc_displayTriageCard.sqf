#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Displays the triage card for the target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_target] call ace_medical_gui_fnc_displayTriageCard
 *
 * Public: No
 */

params ["_target"];

createDialog QGVAR(RscTriageCard);
private _display = uiNamespace getVariable [QGVAR(RscTriageCard), displayNull];

// Set global target variable for triage buttons
GVAR(target) = _target;

// Initially hide the triage select buttons
[_display] call FUNC(toggleTriageSelect);

[{
    params ["_args", "_pfhID"];
    _args params ["_display", "_target"];

    if (isNull _display) exitWith {
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };

    // Update triage card
    private _ctrlTriageCard = _display displayCtrl IDC_TRIAGE_CARD;
    [_ctrlTriageCard, _target] call FUNC(updateTriageCard);

    // Update triage status
    [_display, _target] call FUNC(updateTriageStatus);
}, 0, [_display, _target]] call CBA_fnc_addPerFrameHandler;
