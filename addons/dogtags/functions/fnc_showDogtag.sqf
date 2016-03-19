/*
 * Author: SzwedzikPL
 * Shows dogtag
 *
 * Arguments:
 * 0: Nickname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_nickname", ["_doubleTags", false, [false]]];

if (!hasInterface || {_nickname == ""}) exitWith {};

if (_doubleTags) then {
    (QGVAR(tag) call BIS_fnc_rscLayer) cutRsc [QGVAR(doubleTag), "PLAIN", 1, true];
} else {
    (QGVAR(tag) call BIS_fnc_rscLayer) cutRsc [QGVAR(singleTag), "PLAIN", 1, true];
};
private _display = uiNamespace getvariable [QGVAR(tag), displayNull];
if(isNull _display) exitWith {};

private _control = _display displayCtrl 1001;
_control ctrlSetText _nickname;
