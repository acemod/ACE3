#include "..\script_component.hpp"
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

private _currentShooter = ACE_controlledUAV param [0, objNull];
if (isNull _currentShooter) then {
    if (ACE_player call CBA_fnc_canUseWeapon) then {
        _currentShooter = ACE_player;
    } else {
        _currentShooter = objectParent ACE_player;
    };
};

private _laserCode = _currentShooter getVariable [QGVAR(code), ACE_DEFAULT_LASER_CODE];
private _ctrlLaserCode = _display displayCtrl IDC_LASERDESIGNATOR_LASERCODE;
_ctrlLaserCode ctrlSetText format ["Code: %1", [_laserCode, 4, 0, false] call CBA_fnc_formatNumber];

private _ctrlDistanceACE = _display displayCtrl IDC_LASERDESIGNATOR_ACEDISTANCE;
if (!isLaserOn _currentShooter) exitWith {
    _ctrlDistanceACE ctrlSetText "----";
};

_ctrlDistanceACE ctrlSetText (ctrlText (_display displayCtrl IDC_LASERDESIGNATOR_DISTANCE));
