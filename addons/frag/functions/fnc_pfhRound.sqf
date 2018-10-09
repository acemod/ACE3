#include "script_component.hpp"
/*
 * Author: ACE-Team
 *
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_pfhRound
 *
 * Public: No
 */

params ["_round", "_lastPos", "_lastVel", "_shellType", "_firedFrame", "_gun", "_doSpall", "_spallTrack", "_foundObjectHPIds", "_skip", "_explosive", "_indirectRange", "_force", "_fragPower"];

if (_round in GVAR(blackList)) exitWith {
    false
};

if (!alive _round) exitWith {
    if ((diag_frameno - _firedFrame) > 1) then { //skip if deleted within a single frame
        if (_skip == 0) then {
            if ((_explosive > 0.5 && {_indirectRange >= 4.5} && {_fragPower >= 35}) || {_force == 1}) then {
                // shotbullet, shotShell don't seem to explode when touching water, so don't create frags
                if (((_lastPos select 2) < 0) && {(toLower getText (configFile >> "CfgAmmo" >> _shellType >> "simulation")) in ["shotbullet", "shotshell"]}) exitWith {};
                private _isArmed = true;
                if (!isNil "_gun") then {
                    private _fuseDist = getNumber(configFile >> "CfgAmmo" >> _shellType >> "fuseDistance");
                    _isArmed = ((getPosASL _gun) distance _lastPos > _fuseDist);
                    TRACE_2("",_fuseDist,_isArmed);
                };
                if (!_isArmed) exitWith {TRACE_1("round not armed",_this);};
                TRACE_3("Sending frag event to server",_lastPos,_lastVel,_shellType);
                [QGVAR(frag_eh), [_lastPos,_lastVel,_shellType]] call CBA_fnc_serverEvent;
            };
        };
    };
    if (_doSpall) then {
        DEC(GVAR(spallIsTrackingCount));
        TRACE_1("doSpall",_foundObjectHPIds);
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
