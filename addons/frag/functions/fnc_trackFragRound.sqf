//fnc_trackFragRound.sqf
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

if (!alive _round) then {
    [_this select 1] call cba_fnc_removePerFrameHandler;
    if(_time != ACE_time && {_round in GVAR(trackedObjects)} && {!(_round in GVAR(blackList))}) then {
        GVAR(trackedObjects) = GVAR(trackedObjects) - [_round];
        _skip = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(skip));
        if(_skip == 0) then {
            _explosive = getNumber (configFile >> "CfgAmmo" >> _type >> "explosive");
            _indirectRange = getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange");
            _force = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(force));
            _fragPower = getNumber(configFile >> "CfgAmmo" >> _type >> "indirecthit")*(sqrt(_indirectRange));
            if((_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}) || {_force == 1} ) then {
                [QGVAR(frag_eh), _params] call ace_common_fnc_serverEvent;
                GVAR(trackedObjects) = GVAR(trackedObjects) - [_round];
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
    if(!(_round in GVAR(trackedObjects)) || {_round in GVAR(blackList)}) then {
        [_this select 1] call cba_fnc_removePerFrameHandler;
        if(_round in GVAR(blackList)) then {
            GVAR(blackList) = GVAR(blackList) - [_round];
        };
    };
    
    _params set[1, (getPosASL _round)];
    _params set[2, (velocity _round)];
    if(_doSpall) then {
        [_round, 1, _spallTrack, _foundObjectHPIds] call FUNC(spallTrack);
    };
};
