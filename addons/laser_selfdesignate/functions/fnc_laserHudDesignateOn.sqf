//#define DEBUG_MODE_FULL
#include "script_component.hpp"

TRACE_1("enter", _this);

#define FCS_UPDATE_DELAY 1

FUNC(laserHudDesignatePFH) = {
    private["_strongestResultPos", "_args", "_localLaserTarget", "_laserResultPosition", "_laserResult", "_shooter", "_vehicle", "_weapon", "_gunnerInfo", "_turretInfo", "_pov", "_gunBeg", "_gunEnd", "_povPos", "_povDir", "_result", "_resultPositions", "_firstResult", "_forceUpdateTime"];
    _args = _this select 0;
    
    _shooter = _args select 0;
    _localLaserTarget = _args select 2;
    _vehicle = vehicle _shooter;
    TRACE_1("", _args);
   
    if((vehicle _shooter) == _shooter || !alive _shooter || isNull _vehicle || !GVAR(active) ) exitWith { 
        _args call FUNC(laserHudDesignateOff);
    };
    if(!([_shooter] call FUNC(unitTurretHasDesignator)) ) exitWith {
        _args call FUNC(laserHudDesignateOff);
    };
   
    if( (count _args) < 4) then {
        _args set[3, diag_tickTime + FCS_UPDATE_DELAY];
    };
    _forceUpdateTime = _args select 3;

    _gunnerInfo = [_vehicle, (currentWeapon _vehicle)] call CBA_fnc_getFirer;
    _turretInfo = [_vehicle, _gunnerInfo select 1] call EFUNC(common,getTurretDirection);
    _povPos = _turretInfo select 0;
    
    _laserResult = [_povPos, [1550,1550], 1001] call EFUNC(laser,seekerFindLaserSpot);
    _laserResultPosition = _laserResult select 0;
    TRACE_1("Search", _laserResult);

    if((count _laserResult) > 0) then {
        // If the laser has moved less than a half meter, then dont move it.
        // Just regular use of lasers will commonly make them move this much,
        // but not across multiple close frames.
        // This loses accuracy a little, but saves position updates per frame.
        TRACE_4("", diag_tickTime, _forceUpdateTime, _laserResultPosition, (_laserResultPosition vectorDistance _pos));

        if(diag_tickTime > _forceUpdateTime) then {
            TRACE_1("FCS Update", "");
            ["ace_fcs_forceUpdate", []] call ace_common_fnc_localEvent;
        };

        if(diag_tickTime > _forceUpdateTime) then {
             _args set[3, diag_tickTime + FCS_UPDATE_DELAY];
        };
        
        _localLaserTarget setPosASL _laserResultPosition;
        
#ifdef DEBUG_MODE_FULL
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], _laserResultPosition, 0.75, 0.75, 0, "", 0.5, 0.025, "TahomaB"];
        drawLine3d [ASLToATL _povPos, ASLToATL _laserResultPosition, [0,0,1,1] ];
#endif
    };
    _this set[0, _args];
};

private ["_laserTarget", "_handle", "_vehicle", "_laserUuid"];

if(!GVAR(active)) then {
    GVAR(active) = true;
    
    TRACE_1("Activating laser", "");
    _laserUuid = [(vehicle ACE_player), ACE_player, FUNC(findLaserSource), 1550, 1001, 1] call EFUNC(laser,laserOn);
    
    // @TODO: Create the local target for the players side
    _localLaserTarget = "LaserTargetW" createVehicleLocal (getpos ACE_player);
         
    _handle = [FUNC(laserHudDesignatePFH), 0.25, [ACE_player, _laserUuid, _localLaserTarget]] call cba_fnc_addPerFrameHandler;
} else {
    [] call FUNC(laserHudDesignateOff);
    [] call FUNC(laserHudDesignateOn);
};

