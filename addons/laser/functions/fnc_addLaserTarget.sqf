/*
 * Author: esteldunedain
 * Adds a laser target to the tracker PFH
 *
 * Argument:
 * 0: TargetObject (laser) <OBJECT>
 * 1: Owner (vehicle) <OBJECT>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

params ["_targetObject", "_owner"];
TRACE_2("params",_targetObject,_owner);

// Get the designator variables, or use defaults
private _laserCode = _owner getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _waveLength = _owner getVariable [QEGVAR(laser,waveLength), ACE_DEFAULT_LASER_WAVELENGTH];
private _beamSpread = _owner getVariable [QEGVAR(laser,beamSpread), ACE_DEFAULT_LASER_BEAMSPREAD];
TRACE_3("codes",_laserCode,_waveLength,_beamSpread);

// Laser method is the method ACE_Laser will use to determine from where to where it should project the designator cone
_owner setVariable [QGVAR(targetObject), _targetObject, true];

private _laserMethod = "";
if (_owner isKindOf "CAManBase") then {
    // For men,
    _laserMethod = QFUNC(findLaserSourceMan);
} else {
    _laserMethod = QFUNC(findLaserSourceGeneric);
};

TRACE_6("Laser on:", _laserUuid, _owner, _laserMethod, _waveLength, _laserCode, _beamSpread);
private _laserUuid = [_owner, _owner, _laserMethod, _waveLength, _laserCode, _beamSpread] call FUNC(laserOn);

GVAR(trackedLaserTargets) pushBack [_targetObject, _owner, _laserUuid];
TRACE_1("",GVAR(trackedLaserTargets));

if (GVAR(pfehID) == -1) then {
    TRACE_1("starting pfeh",count GVAR(trackedLaserTargets));
    GVAR(pfehID) = [DFUNC(laserTargetPFH), 0, []] call CBA_fnc_addPerFrameHandler;
};
