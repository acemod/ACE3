#include "script_component.hpp"
private ["_gun", "_type", "_round", "_doFragTrack", "_doSpall"];
if !(isNil QGVAR(enabled) && {GVAR(enabled)}) exitWith {};

_gun = _this select 0;
_type = _this select 4;
_round = _this select 6;

if(_round in GVAR(blackList)) exitWith {
    GVAR(blackList) = GVAR(blackList) - [_round];
};

_doFragTrack = false;
if(_gun == player) then {
    _doFragTrack = true;
} else {
    if((gunner _gun) == player) then {
        _doFragTrack = true;
    } else {
        if(local _gun && {!(isPlayer (gunner _gun))} && {!(isPlayer _gun)}) then {
            _doFragTrack = true;
        };
    };
};
_doSpall = false;
if(_doSpall) then {
    if(GVAR(spallIsTrackingCount) <= 0) then {
        GVAR(spallHPData) = [];
    };
    if(GVAR(spallIsTrackingCount) > 5) then {
        // player sideChat "LIMT!";
        _doSpall = false;
    } else {
        GVAR(spallIsTrackingCount) = GVAR(spallIsTrackingCount) + 1;
    };
};
// player sideChat format["c: %1", GVAR(spallIsTrackingCount)];
[player, _round, [1,0,0,1]] call nou_fnc_addTrack;
if(_doFragTrack && alive _round) then {
    GVAR(trackedObjects) pushBack _round;
    _spallTrack = [];
    _spallTrackID = [];
    [DFUNC(trackFragRound), 0, [_round, (getPosASL _round), (velocity _round), _type, time, _gun, _doSpall, _spallTrack, _spallTrackID]] call cba_fnc_addPerFrameHandler;
    if(_doSpall) then {
        [_round, 2, _spallTrack, _spallTrackID] call FUNC(spallTrack);
    };
    // player sideChat "WTF2";
};
