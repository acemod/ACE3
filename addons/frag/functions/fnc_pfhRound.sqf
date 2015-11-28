#include "script_component.hpp"

params [
    "_round",
    "",
    "",
    "",
    "_firedFrame",
    "",
    "_doSpall",
    "_spallTrack",
    "_foundObjectHPIds",
    "_skip",
    "_explosive",
    "_indirectRange",
    "_force",
    "_fragPower"
];

if(_round in GVAR(blackList)) exitWith {
    false
};

if (!alive _round) exitWith {
    if((diag_frameno - _firedFrame) > 1) then { //skip if deleted within a single frame
        if(_skip == 0) then {
            if((_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}) || {_force == 1} ) then {
                [QGVAR(frag_eh), _this] call EFUNC(common,serverEvent);
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
    false
};

_this set[1, (getPosASL _round)];
_this set[2, (velocity _round)];

if(_doSpall) then {
    private["_scale"];
    _scale = ( (count GVAR(objects)) / GVAR(MaxTrackPerFrame) ) max 0.1;
    [_round, _scale, _spallTrack, _foundObjectHPIds] call FUNC(spallTrack);
};

true
