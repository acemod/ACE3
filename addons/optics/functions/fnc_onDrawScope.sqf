#include "script_component.hpp"
/*
 * Author: commy2
 *
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY] call ace_optics_fnc_onDrawScope
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

private _control = _display displayCtrl 1713154;

if (!ctrlShown (_display displayCtrl 154)) exitWith {
    _control ctrlShow false;
};

private _sizeX = (call EFUNC(common,getZoom)) / 4;
private _sizeY = _sizeX * safezoneW / safezoneH;

_control ctrlSetPosition [
    safezoneX + 0.5 * safezoneW - 0.5 * _sizeX,
    safezoneY + 0.5 * safezoneH - 0.5 * _sizeY,
    _sizeX,
    _sizeY
];

_control ctrlCommit 0;
_control ctrlShow true;
