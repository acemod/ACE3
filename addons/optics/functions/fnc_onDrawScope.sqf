#include "..\script_component.hpp"
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
private _sizeY = _sizeX * safeZoneW / safeZoneH;

_control ctrlSetPosition [
    safeZoneX + 0.5 * safeZoneW - 0.5 * _sizeX,
    safeZoneY + 0.5 * safeZoneH - 0.5 * _sizeY,
    _sizeX,
    _sizeY
];

_control ctrlCommit 0;
_control ctrlShow true;
