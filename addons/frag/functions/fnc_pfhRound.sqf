#include "script_component.hpp"
private ["_params", "_round", "_lastPos", "_lastVel", "_type", "_time", "_doSpall", "_spallTrack", "_foundObjectHPIds", "_skip", "_explosive", "_indirectRange", "_force", "_fragPower"];
_params = _this select 0;
_round = _params select 0;
_lastPos = _params select 1;
_lastVel = _params select 2;
_type = _params select 3;
_time = _params select 4;
_doSpall = _params select 6;
_spallTrack = _params select 7;
_foundObjectHPIds = _params select 8;
_skip = _params select 9;
_explosive = _params select 10;
_indirectRange = _params select 11;
_force = _params select 12;
_fragPower = _params select 13;

if (!alive _round) then {
    if(_time != time && {!(_round in GVAR(blackList))}) then {
        if(_skip == 0) then {
            if((_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}) || {_force == 1} ) then {
                [QGVAR(frag_eh), _params] call ace_common_fnc_serverEvent;
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
    if(_round in GVAR(blackList)) exitWith { 
        [_round] call FUNC(removePfhRound);
    };
    
    _params set[1, (getPosASL _round)];
    _params set[2, (velocity _round)];
    if(_doSpall) then {
        [_round, 1, _spallTrack, _foundObjectHPIds] call FUNC(spallTrack);
    };
};
