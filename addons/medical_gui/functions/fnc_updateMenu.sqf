#include "script_component.hpp"
/*
 * Author: mharis001
 * Updates the Medical Menu UI for given target.
 *
 * Arguments:
 * 0: Medical Menu display <DISPLAY>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, _target] call ace_medical_gui_fnc_updateMenu
 *
 * Public: No
 */

// Get the Medical Menu display
private _display = uiNamespace getVariable [QGVAR(menuDisplay), displayNull];
if (isNull _display) exitWith {};

// Update treatment category buttons
[_display] call FUNC(updateCategories);

// Update injury list
private _ctrlInjuries = _display displayCtrl IDC_INJURIES;
[_ctrlInjuries, GVAR(target), GVAR(selectedBodyPart)] call FUNC(updateInjuryList);

// Update body image
private _ctrlBodyImage = _display displayCtrl IDC_BODY_GROUP;
[_ctrlBodyImage, GVAR(target)] call FUNC(updateBodyImage);
