#include "script_component.hpp"
private ["_round", "_lastPos", "_lastVel", "_type", "_time", "_doSpall", "_spallTrack", "_foundObjectHPIds", "_skip", "_explosive", "_indirectRange", "_force", "_fragPower"];
_round = _this select 0;
_lastPos = _this select 1;
_lastVel = _this select 2;
_type = _this select 3;
_time = _this select 4;
_doSpall = _this select 6;
_spallTrack = _this select 7;
_foundObjectHPIds = _this select 8;
_skip = _this select 9;
_explosive = _this select 10;
_indirectRange = _this select 11;
_force = _this select 12;
_fragPower = _this select 13;

if(_round in GVAR(blackList)) exitWith { 
    false
};

if (!alive _round) then {
    if(_time != time) then {
        if(_skip == 0) then {
            if((_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}) || {_force == 1} ) then {
                [QGVAR(frag_eh), _this] call ace_common_fnc_serverEvent;
            };
        };
    };
    if(_doSpall) then {
        GVAR(spallIsTrackingCount) = GVAR(spallIsTrackingCount) - 1;
        // diag_log text format["F: %1", _foundObjectHPIds];
        {
            if(!isNil "_x") then {
                _x removeEventHandler ["hitPart", _foundObjectHPIds select _forEachIndex];
            };
        } forEach _spallTrack;
    };
} else {

    _params set[1, (getPosASL _round)];
    _params set[2, (velocity _round)];
    if(_doSpall) then {
        private["_scale"];
        _scale = ( (count GVAR(objects)) / GVAR(MaxTrackPerFrame) ) max 0.1;
        [_round, _scale, _spallTrack, _foundObjectHPIds] call FUNC(spallTrack);
    };
};

true