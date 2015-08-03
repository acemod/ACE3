/*
 * Author: Bohemia Interactive
 * Part of the BI respawn framework
 * Correctly handles seagull respawn (not used by default)
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

_seagull = _this select 0;
_player = _this select 1;
_this call bis_fnc_log;

if (!isplayer _player && !isplayer _seagull) exitwith {["Attempting to use the function on AI unit %1, can be used only on players."] call bis_fnc_error;};

waituntil {missionnamespace getvariable ["BIS_fnc_feedback_allowDeathScreen",true]};
BIS_fnc_feedback_allowPP = false;
//(["HealthPP_black"] call bis_fnc_rscLayer) cutText ["","BLACK IN",8];

if (GVAR(onDeath)) exitWith {
    private ["_vision","_pos"];

    if (isNull _player) then {_player = _seagull};
    _vision = [-2,-1] select (sunOrMoon < 1);
    _pos = (getPosATL _player) vectorAdd [0,0,5];

    [_seagull,QGVAR(isSeagull)] call EFUNC(common,hideUnit);
    [2,_player,_vision,_pos,getDir _seagull] call FUNC(setCameraAttributes);
    [_seagull] call FUNC(setSpectator);
};

_camera = "camera" camCreate [(position _player select 0)-0.75, (position _player select 1)-0.75,(position _player select 2) + 0.5];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 0.800;
_camera camCommit 0;
waituntil {camCommitted _camera};

0 fadeMusic 0.5;
playMusic "Track06_Abandoned_Battlespace";

_camera camSetTarget vehicle _player;
_camera camSetRelPos [-0.82,-3.12,3.38];
_camera camSetFOV 0.800;
_camera camCommit 7;

sleep 1;
_preload = _player spawn {waitUntil {(preloadCamera getPos _this) && (2 preloadObject _this)}};
sleep 5;
waituntil {camCommitted _camera};

_camera camSetRelPos [1.17,-21.71,2.07];
_camera camSetFOV 0.400;
_camera camCommit 10;
sleep 2;
terminate _preload;
sleep 3;
_preload = _player spawn {waitUntil {(preloadCamera getPos _this) && (3 preloadObject _this)}};
waituntil {camCommitted _camera};

_camera camSetTarget vehicle _player;
_camera camSetRelPos [5.80,1.29,5.07];
_camera camSetFOV 0.300;
_camera camCommit 7;
sleep 2;
terminate _preload;
_preload = _seagull spawn {waitUntil {(preloadCamera getPos _this) && (4 preloadObject _this)}};
waituntil {camCommitted _camera};

_camera camSetRelPos [2.71,19.55,12.94];
_camera camSetFOV 0.700;
_camera camCommit 2;
waituntil {camCommitted _camera};

_camera camSetTarget _seagull;
_camera camSetRelPos [-6.66,18.99,2.59];
_camera camSetFOV 0.700;
_camera camCommit 3;
waituntil {camCommitted _camera};

3 fadeMusic 0;

_camera camSetRelPos [1.17,-21.71,-1.07];
_camera camSetFOV 0.300;
_camera camCommit 3;
waituntil {camCommitted _camera};
terminate _preload;

_seagull switchCamera "EXTERNAL";
_seagull cameraEffect ["terminate","back"];
camDestroy _camera;
