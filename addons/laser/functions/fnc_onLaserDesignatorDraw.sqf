#include "script_component.hpp"
/*
 * Author: Nou
 * Update distance when rangefinder laser is on
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_laser_fnc_onLaserDesignatorDraw
 *
 * Public: No
 */

params ["_ctrl"];

private _display = ctrlParent _ctrl;

private _laserCode = ACE_player getVariable QGVAR(code);
if (!isNil "_laserCode") then {
    private _ctrlLaserCode = _display displayCtrl IDC_LASERDESIGNATOR_LASERCODE;
    _ctrlLaserCode ctrlSetText format ["Code: %1", [_laserCode, 4, 0, false] call CBA_fnc_formatNumber];
};

private _ctrlDistanceACE = _display displayCtrl IDC_LASERDESIGNATOR_ACEDISTANCE;
if !(isLaserOn ACE_player) exitWith {
    _ctrlDistanceACE ctrlSetText "----";
};

_ctrlDistanceACE ctrlSetText (ctrlText (_display displayCtrl IDC_LASERDESIGNATOR_DISTANCE));
