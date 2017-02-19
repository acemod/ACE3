#include "script_component.hpp"

params ["_round", "_lastPos", "_lastVel", "_type", "_firedFrame", "_gun", "_doSpall", "_spallTrack", "_foundObjectHPIds", "_skip", "_explosive", "_indirectRange", "_force", "_fragPower"];

if (_round in GVAR(blackList)) exitWith {
    false
};

if (!alive _round) exitWith {
    if ((diag_frameno - _firedFrame) > 1) then { //skip if deleted within a single frame
        if (_skip == 0) then {
            if ((_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}) || {_force == 1}) then {
                // shotbullet, shotShell don't seem to explode when touching water, so don't create frags
                if (((_lastPos select 2) < 0) && {(toLower getText (configFile >> "CfgAmmo" >> _type >> "simulation")) in ["shotbullet", "shotshell"]}) exitWith {};
                [QGVAR(frag_eh), _this] call CBA_fnc_serverEvent;
            };
        };
    };
    if (_doSpall) then {
        DEC(GVAR(spallIsTrackingCount));
        // diag_log text format ["F: %1", _foundObjectHPIds];
        {
            if (!isNil "_x") then {
                _x removeEventHandler ["hitPart", _foundObjectHPIds select _forEachIndex];
            };
        } forEach _spallTrack;
    };
    false
};

_this set [1, getPosASL _round];
_this set [2, velocity _round];

if (_doSpall) then {
    private _scale = ((count GVAR(objects)) / GVAR(maxTrackPerFrame)) max 0.1;
    [_round, _scale, _spallTrack, _foundObjectHPIds] call FUNC(spallTrack);
};

true
