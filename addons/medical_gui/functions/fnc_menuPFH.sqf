#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles updating the Medical Menu UI for the current target.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_gui_fnc_menuPFH
 *
 * Public: No
 */

// Check if menu should stay open for target
if !([ACE_player, GVAR(target), ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith) && {[ACE_player, GVAR(target)] call FUNC(canOpenMenu)}) then {
    closeDialog 0;
    // Show hint if distance condition failed
    if ((ACE_player distance GVAR(target) > GVAR(maxDistance)) && {vehicle ACE_player != vehicle GVAR(target)}) then {
        [[ELSTRING(medical,DistanceToFar), GVAR(target) call EFUNC(common,getName)], 2] call EFUNC(common,displayTextStructured);
    };
};

// Get the Medical Menu display
private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
if (isNull _display) exitWith {};

// Update treatment category buttons
[_display] call FUNC(updateCategories);

// Update treatment actions for current category
[_display] call FUNC(updateActions);

// Update injury list
private _ctrlInjuries = _display displayCtrl IDC_INJURIES;
[_ctrlInjuries, GVAR(target), GVAR(selectedBodyPart)] call FUNC(updateInjuryList);

// Update body image
private _ctrlBodyImage = _display displayCtrl IDC_BODY_GROUP;
[_ctrlBodyImage, GVAR(target)] call FUNC(updateBodyImage);

// Update activity and quick view logs
private _ctrlActivityLog = _display displayCtrl IDC_ACTIVITY;
private _activityLog = GVAR(target) getVariable [MED_LOG_VARNAME("activity"), []];
[_ctrlActivityLog, _activityLog] call FUNC(updateLogList);

private _ctrlQuickView = _display displayCtrl IDC_QUICKVIEW;
private _quickView = GVAR(target) getVariable [MED_LOG_VARNAME("quick_view"), []];
[_ctrlQuickView, _quickView] call FUNC(updateLogList);

// Update triage status
[_display, GVAR(target)] call FUNC(updateTriageStatus);
