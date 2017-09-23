/*
 * Author: 654wak654
 * Shows a Zeus message through the BIS function, handles localization.
 * If multiple args are given, they get formatted.
 *
 * Arguments:
 * 0: Message <STRING>
 * N: Anything <ANY> (default: nil)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["something"] call ace_zeus_fnc_showMessage
 * ["something %1 in %2", "strange", getPos neighborhood] call ace_zeus_fnc_showMessage
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!(_this isEqualTypeParams [""])) exitWith {ERROR_1("First arg must be string [%1]",_this);};

private _message = _this apply {if ((_x isEqualType "") && {isLocalized _x}) then {localize _x} else {_x}};
[objNull, format _message] call BIS_fnc_showCuratorFeedbackMessage;
