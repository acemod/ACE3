/*
 * Author: aeroson
 * Sets the text on the dialog.
 *
 * Arguments:
 * 0: Text <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_nametags_fnc_setText
 *
 * Public: No
 */
#include "script_component.hpp"

#define TextIDC 11123

params ["_text"];

disableSerialization;

private _ctrl = (uiNamespace getVariable QGVAR(dialog)) displayCtrl TextIDC;
_ctrl ctrlSetStructuredText parseText _text;
_ctrl ctrlCommit 0;
