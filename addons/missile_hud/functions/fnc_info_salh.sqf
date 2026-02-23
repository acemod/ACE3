#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Generates HUD info for SALH seeker.
 *
 * Arguments:
 * 0: Idle display Text <STRING>
 * 1: Locked display text <STRING>
 * 2: Unit <OBJECT>
 * 3: Vehicle <OBJECT>
 * 4: Ammo Config <CONFIG>
 *
 * Return Value:
 * Element array <ARRAY>
 *
 * Example:
 * [["TEXT", "My Test", [1, 0.4, 5]]] call ace_missile_hud_fnc_info_salh
 *
 * Public: No
 */

params ["_idleText", "_lockedText", "_unit", "_vehicle", "_ammoConfig"];

private _turretPath = _vehicle unitTurret _unit;
private _turretConfig = [_vehicle, _turretPath] call CBA_fnc_getTurret;
private _laserSource = _vehicle modelToWorldWorld (_vehicle selectionPosition getText (_turretConfig >> "memoryPointGunnerOptics"));
private _laserCode = _vehicle getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _seekerAngle = getNumber (_ammoConfig >> "seekerAngle");
private _seekerMaxRange = getNumber (_ammoConfig >> "seekerMaxRange");

private _laserResult = [_laserSource, vectorDir _vehicle, _seekerAngle, _seekerMaxRange, [ACE_DEFAULT_LASER_WAVELENGTH,ACE_DEFAULT_LASER_WAVELENGTH], _laserCode, _vehicle] call EFUNC(laser,seekerFindLaserSpot);
private _foundTargetPos = _laserResult select 0;
private _haveLock = !isNil "_foundTargetPos";

private _displayText = [_idleText, _lockedText] select (_haveLock && _lockedText != "");
private _laserColor = [[1, 0, 0, 0.25], [1, 0, 0, 0.75]] select _haveLock;

if (_displayText == "") then {
    [
        ["SPACER", "", []],
        ["SPACER", "", []],
        ["SPACER", "", []],
        ["SPACER", "", []],
        ["TEXT", format ["CODE: %1", _laserCode], [1, 1, 1]],
        ["ICON", "\a3\Ui_F_Curator\Data\CfgCurator\laser_ca.paa", _laserColor]
    ]
} else {
    [
        ["TEXT", _displayText, [1, 1, 1]],
        ["SPACER", "", []],
        ["TEXT", format ["CODE: %1", _laserCode], [1, 1, 1]],
        ["ICON", "\a3\Ui_F_Curator\Data\CfgCurator\laser_ca.paa", _laserColor]
    ]
}
