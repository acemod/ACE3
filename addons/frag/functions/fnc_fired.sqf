#include "script_component.hpp"

private ["_enabled", "_gun", "_type", "_round", "_doFragTrack", "_doSpall", "_spallTrack", "_spallTrackID"];

if (!GVAR(enabled)) exitWith {};

_gun = _this select 0;
_type = _this select 4;
_round = _this select 6;

_enabled = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(enabled));
if(_enabled < 1) exitWith {};

if(_round in GVAR(blackList)) exitWith {
    GVAR(blackList) = GVAR(blackList) - [_round];
};


_doFragTrack = false;
if(_gun == ACE_player) then {
    _doFragTrack = true;
} else {
    if((gunner _gun) == ACE_player) then {
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
        // ACE_player sideChat "LIMT!";
        _doSpall = false;
    } else {
        GVAR(spallIsTrackingCount) = GVAR(spallIsTrackingCount) + 1;
    };
};
// ACE_player sideChat format["c: %1", GVAR(spallIsTrackingCount)];

#ifdef DEBUG_MODE_FULL
[ACE_player, _round, [1,0,0,1]] call FUNC(addTrack);
#endif

if(_doFragTrack && alive _round) then {
    GVAR(trackedObjects) pushBack _round;
    _spallTrack = [];
    _spallTrackID = [];
    [DFUNC(trackFragRound), 0, [_round, (getPosASL _round), (velocity _round), _type, ACE_time, _gun, _doSpall, _spallTrack, _spallTrackID]] call cba_fnc_addPerFrameHandler;
    if(_doSpall) then {
        [_round, 2, _spallTrack, _spallTrackID] call FUNC(spallTrack);
    };
    // ACE_player sideChat "WTF2";
};
