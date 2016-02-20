/*
 * Author: jaynus
 * Turns on laser self designation from this vehicle based on the turret.
 * There are no arguments, because it is all strictly based on the users vehicle.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("enter", _this);

#define FCS_UPDATE_DELAY 1

FUNC(laserHudDesignatePFH) = {
    private["_strongestResultPos", "_args", "_localLaserTarget", "_laserResultPosition", "_laserResult", "_shooter", "_vehicle", "_weapon", "_gunnerInfo", "_turretInfo", "_pov", "_gunBeg", "_gunEnd", "_povPos", "_povDir", "_result", "_resultPositions", "_firstResult", "_forceUpdateTime"];
    params ["_args"];
    _args params ["_shooter", "_localLaserTarget"];
    _vehicle = vehicle _shooter;
    TRACE_1("", _args);

    if((vehicle _shooter) == _shooter || {!alive _shooter} || {isNull _vehicle} || {!GVAR(active)} ) exitWith {
        _args call FUNC(laserHudDesignateOff);
    };
    if(!([_shooter] call FUNC(unitTurretHasDesignator)) ) exitWith {
        _args call FUNC(laserHudDesignateOff);
    };

    if( (count _args) < 4) then {
        _args set[3, ACE_diagTime + FCS_UPDATE_DELAY];
    };
    _forceUpdateTime = _args select 3;

    // @TODO: We don't have anything here we need to do the calculations for right now
    /*

    _gunnerInfo = [_vehicle, (currentWeapon _vehicle)] call CBA_fnc_getFirer;
    _turretInfo = [_vehicle, _gunnerInfo select 1] call EFUNC(common,getTurretDirection);
    _povPos = _turretInfo select 0;

    _laserCode = (vehicle ACE_player) getVariable["ace_laser_code", ACE_DEFAULT_LASER_CODE];
    _waveLength = (vehicle ACE_player) getVariable["ace_laser_waveLength", ACE_DEFAULT_LASER_WAVELENGTH];


    _laserResult = [_povPos, [_waveLength,_waveLength], _laserCode] call EFUNC(laser,seekerFindLaserSpot);
    _laserResultPosition = _laserResult select 0;
    TRACE_1("Search", _laserResult);

    if((count _laserResult) > 0) then {
        // @TODO: Nou gets to field all tickets about missing lasers.
        //_localLaserTarget setPosASL _laserResultPosition;
    };
    */

    if(ACE_diagTime > _forceUpdateTime) then {
        ["ace_fcs_forceUpdate", []] call ace_common_fnc_localEvent;
         _args set[3, ACE_diagTime + FCS_UPDATE_DELAY];
    };

    _this set[0, _args];
};

private ["_laserTarget", "_handle", "_vehicle", "_laserUuid", "_waveLength", "_beamSpread", "_laserCode"];

if(!GVAR(active)) then {
    GVAR(active) = true;

    TRACE_1("Activating laser", "");

    // Get the self-designation variables, or use defaults
    _laserCode = (vehicle ACE_player) getVariable["ace_laser_code", ACE_DEFAULT_LASER_CODE];
    _waveLength = (vehicle ACE_player) getVariable["ace_laser_waveLength", ACE_DEFAULT_LASER_WAVELENGTH];
    _beamSpread = (vehicle ACE_player) getVariable["ace_laser_beamSpread", ACE_DEFAULT_LASER_BEAMSPREAD];

    _laserUuid = [(vehicle ACE_player), ACE_player, QFUNC(findLaserSource), _waveLength, _laserCode, _beamSpread] call EFUNC(laser,laserOn);

    // @TODO: Create the local target for the players side
    // @TODO: Nou gets to field all tickets about missing lasers.
    //_localLaserTarget = "LaserTargetW" createVehicleLocal (getpos ACE_player);

    GVAR(selfDesignateHandle) = [FUNC(laserHudDesignatePFH), 0.1, [ACE_player, _laserUuid, nil]] call CBA_fnc_addPerFrameHandler;
} else {
    [] call FUNC(laserHudDesignateOff);
    [] call FUNC(laserHudDesignateOn);
};
