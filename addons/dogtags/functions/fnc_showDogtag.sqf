/*
 * Author: SzwedzikPL
 * Shows dogtag
 *
 * Arguments:
 * 0: Dog tag data <ARRAY>
 * 1: Display as double tag <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;

params ["_dogtagData", ["_doubleTags", false, [false]]];

if (!hasInterface || {_dogtagData isEqualTo []}) exitWith {};

if (_doubleTags) then {
    (QGVAR(tag) call BIS_fnc_rscLayer) cutRsc [QGVAR(doubleTag), "PLAIN", 1, true];
} else {
    (QGVAR(tag) call BIS_fnc_rscLayer) cutRsc [QGVAR(singleTag), "PLAIN", 1, true];
};
private _display = uiNamespace getvariable [QGVAR(tag), displayNull];
if(isNull _display) exitWith {};

private _control = _display displayCtrl 1001;
_dogtagData params ["_nickName", "_code", "_bloodType"];
_control ctrlSetStructuredText parseText format ["%1<br/>%2<br/>%3", toUpper _nickName, _code, _bloodType];
