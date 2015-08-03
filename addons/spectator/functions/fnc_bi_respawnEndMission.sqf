/*
 * Author: Bohemia Interactive (Karel Moricky)
 * Part of the BI respawn framework
 * Ends the mission when all players are dead
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

params [["_unit",objNull,[objNull]], ["_killer",objNull,[objNull]]];
private ["_vision","_pos"];

if (isNull _killer) then {_killer = _unit};
_vision = [-2,-1] select (sunOrMoon < 1);
_pos = (getPosATL _unit) vectorAdd [0,0,5];

if (ismultiplayer) then {

    _respawnType = 0 call bis_fnc_missionRespawnType;
    if (_respawnType in [0,1,4,5]) then {

        //--- No more respawn slots
        if ({isplayer _x && alive _x} count playableunits == 0) then {
            [["endDeath",false],"bis_fnc_endmission"] call bis_fnc_mp;
        } else {
            if (GVAR(onDeath) && (_respawnType in [0,1])) then {
                [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
                [_unit] call FUNC(setSpectator);
            };
        };

        //--- Don't end the script to prevent premature mission end
        waituntil {false};
    } else {

        if (!alive _unit) then {

            //--- No more respawn tickets
            if ([] call bis_fnc_respawntickets == 0 && {isplayer _x} count playableunits == 0) then {
                [["endDeath",false],"bis_fnc_endmission"] call bis_fnc_mp;
            } else {
                if (GVAR(onDeath)) then {
                    [2,_killer,_vision,_pos,getDir _unit] call FUNC(setCameraAttributes);
                    [_unit] call FUNC(setSpectator);
                };
            };
        } else {
            [_unit,false] call FUNC(setSpectator);
        };
    };
};
