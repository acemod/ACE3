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

params ["_nickname"];

if(!hasInterface || {_nickname == ""}) exitWith {};

(QGVAR(tag) call BIS_fnc_rscLayer) cutRsc [QGVAR(tag), "PLAIN", 1, true];

private _display = uiNamespace getvariable [QGVAR(tag), displayNull];
if(isNull _display) exitWith {};

private _control = _display displayCtrl 1001;
_control ctrlSetText _nickname;
