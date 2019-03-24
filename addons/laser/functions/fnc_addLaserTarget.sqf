#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Adds a vanilla laser target to the tracker PFH and globaly turns it on
 *
 * Argument:
 * 0: TargetObject (vanilla laser) <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [laserTarget player, player] call ace_laser_fnc_addLaserTarget;
 *
 * Public: No
 */

params ["_targetObject", "_vehicle"];
TRACE_2("params",_targetObject,_vehicle);

// Get the designator variables, or use defaults
private _waveLength = _vehicle getVariable [QEGVAR(laser,waveLength), ACE_DEFAULT_LASER_WAVELENGTH];
private _laserCode = _vehicle getVariable [QEGVAR(laser,code), ACE_DEFAULT_LASER_CODE];
private _beamSpread = _vehicle getVariable [QEGVAR(laser,beamSpread), ACE_DEFAULT_LASER_BEAMSPREAD];
TRACE_3("codes",_waveLength,_laserCode,_beamSpread);

// Laser method is the method ACE_Laser will use to determine from where to where it should project the designator cone
_vehicle setVariable [QGVAR(targetObject), _targetObject, true];

private _laserMethod = QFUNC(findLaserSource);

private _vehicleSourceSelection = "";
if (_vehicle isKindOf "CaManBase") then {
    _vehicleSourceSelection = "pilot";
} else {
    { // Go through turrets on vehicle and find the laser
        private _turretPath = _x;
        {
            if ((getNumber (configFile >> "CfgWeapons" >> _x >> "laser")) > 0) exitWith {
                _vehicleSourceSelection = getText (([_vehicle, _turretPath] call CBA_fnc_getTurret) >> "memoryPointGunnerOptics");
                TRACE_3("",_turretPath,_x,_vehicleSourceSelection);
            };
        } forEach (_vehicle weaponsTurret _turretPath);
    } forEach (allTurrets [_vehicle, true]);
};

private _methodArgs = [_vehicleSourceSelection];

TRACE_6("Laser on:",_vehicle,_laserMethod,_waveLength,_laserCode,_beamSpread,_methodArgs);
private _laserUuid = [_vehicle, _vehicle, _laserMethod, _waveLength, _laserCode, _beamSpread, _methodArgs] call FUNC(laserOn);

GVAR(trackedLaserTargets) pushBack [_targetObject, _vehicle, _laserUuid, _laserCode];
TRACE_1("",GVAR(trackedLaserTargets));

if (GVAR(pfehID) == -1) then {
    TRACE_1("starting pfeh",count GVAR(trackedLaserTargets));
    GVAR(pfehID) = [DFUNC(laserTargetPFH), 0, []] call CBA_fnc_addPerFrameHandler;
};
