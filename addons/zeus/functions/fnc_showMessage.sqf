/*
 * Author: 654wak654
 * Shows a zeus message through the BIS function, handles localization.
 * If multiple args are given, they get formatted.
 *
 * Arguments:
 * The message <STRING>...
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * ["something"] call ace_zeus_fnc_showMessage
 * ["something %1", "strange"] call ace_zeus_fnc_showMessage
 *
 * Public: Yes
 */

#include "script_component.hpp"

private _message = _this apply {if (isLocalized _x) then {localize _x} else {_x}};
[objNull, format _message] call BIS_fnc_showCuratorFeedbackMessage;
