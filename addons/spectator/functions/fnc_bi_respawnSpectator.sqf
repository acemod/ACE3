/*
 * Author: Bohemia Interactive
 * Part of the BI respawn framework
 * Opens BI spectator interface (default used by seagull respawn)
 * Edited to support ace_spectator integration
 *
 * Arguments:
 * 0: Corpse/New Unit <OBJECT>
 * 1: Killer/Old Unit <OBJECT>
 * 2: Respawn Type <NUMBER>
 * 3: Respawn Delay <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_unit",objNull,[objNull]], ["_killer",objNull,[objNull]], ["_respawn",-1,[0]]];
private ["_vision","_pos"];

if (isNull _killer) then {_killer = _unit};
_vision = [-2,-1] select (sunOrMoon < 1);
_pos = (getPosATL _unit) vectorAdd [0,0,5];

_layer = "BIS_fnc_respawnSpectator" call bis_fnc_rscLayer;

if (!alive _unit) then {
    if (GVAR(onDeath)) then {
        [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
        [_unit] call FUNC(setSpectator);
    } else {
        _layer cutrsc ["RscSpectator","plain"];
    };
} else {
    if (_respawn == 1) then {

        //--- Open
        waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true]};
        BIS_fnc_feedback_allowPP = false;
        //(["HealthPP_black"] call bis_fnc_rscLayer) cutText ["","BLACK IN",1];
        if (GVAR(onDeath)) then {
            [_unit,QGVAR(isSeagull)] call EFUNC(common,hideUnit);
            [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
            [_unit] call FUNC(setSpectator);
        } else {
            _layer cutrsc ["RscSpectator","plain"];
        };
    } else {
        if (GVAR(onDeath)) then {
            [_unit,false] call FUNC(setSpectator);
        };

        //--- Close
        _layer cuttext ["","plain"];
    };
};
