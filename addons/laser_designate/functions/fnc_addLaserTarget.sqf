/*
 * Author: esteldunedain
 * Adds a laser target to the tracker PFH
 *
 * Argument:
 * 0: _targetObject <OBJECT>
 * 1: _owner <OBJECT>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["_targetObject", "_owner"];

// Get the designator variables, or use defaults
private _laserCode = _owner getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _waveLength = _owner getVariable [QEGVAR(laser,waveLength), ACE_DEFAULT_LASER_WAVELENGTH];
private _beamSpread = _owner getVariable [QEGVAR(laser,beamSpread), ACE_DEFAULT_LASER_BEAMSPREAD];

// Laser method is the method ACE_Laser will use to determine from where to where it should project the designator cone
_owner setVariable [QGVAR(targetObject), _targetObject];
private _laserMethod = objNull;
if (_owner isKindOf "CAManBase") then {
    // For men,
    _laserMethod = QFUNC(findLaserSourceMan);
} else {
    _laserMethod = QFUNC(findLaserSourceGeneric);
};
_laserUuid = [_owner, _owner, _laserMethod, _waveLength, _laserCode, _beamSpread] call EFUNC(laser,laserOn);
TRACE_6("Laser on:", _laserUuid, _owner, _laserMethod, _waveLength, _laserCode, _beamSpread);

GVAR(trackedLaserTargets) pushBack [_targetObject, _owner, _laserUuid];

TRACE_1("GVAR(trackedLaserTargets):", GVAR(trackedLaserTargets));
if (isNil QGVAR(pfhuid)) then {
    GVAR(pfhuid) = [DFUNC(laserTargetPFH), 0, []] call CBA_fnc_addPerFrameHandler;
};
