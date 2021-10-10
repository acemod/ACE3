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
 * call ace_frag_fnc_findReflections
 *
 * Public: No
 */

BEGIN_COUNTER(fnc_findReflections);
params ["_args", "_pfhID"];
_args params ["_pos", "_explosiveInfo", "_los", "_nlos", "_zIndex", "_depth", "_rand"];

private _split = 15;
private _radi = 360 / _split * _depth;

// player sideChat format ["p: %1", _explosiveInfo];
_explosiveInfo params ["_indirectHitRange", "_indirectHit"];
private _distanceCount = (floor _indirectHitRange * 4) min 100;

if (_zIndex < 5) then {
    private _lastPos = _pos;
    private _zAng = _zIndex * 20 + 2;
    if (_zAng > 80) then {
        _radi = 1;
        _zAng = 90;
    };
    for "_i" from 0 to _radi do {
        private _test = true;
        private _vec = [1, ((_i * _split) + _rand) % 360, _zAng] call CBA_fnc_polar2vect;
        for "_x" from 1 to _distanceCount do {
            private _testPos = _pos vectorAdd (_vec vectorMultiply _x);
            // drop ["\a3\data_f\Cl_basic","","Billboard",1,15,ASLtoATL _testPos,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];
            private _res = lineIntersectsWith [_pos, _testPos];
            if (count _res > 0) exitWith {
                _test = false;
                _nlos pushBack _lastPos;
                // {
                    // _x addEventHandler ["HandleDamage", { diag_log text format ["this: %1", _this]; }];
                // } forEach _res;
                // drop ["\a3\data_f\Cl_basic","","Billboard",1,15,ASLtoATL _testPos,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];
                // TEST_PAIRS pushBack [_pos, _lastPos, [1,0,0,1]];

            };
            // if (terrainIntersectASL [_pos, _testPos]) exitWith {};
            _lastPos = _testPos;
        };
    };
    _args set [4, _zIndex + 1];
} else {
    INC(_depth);
    private _buckets = [];
    private _excludes = [];
    private _bucketPos = nil;
    private _bucketList = nil;
    private _c = 0;
    while {count _nlos != count _excludes && {_c < (count _nlos)}} do {
        scopeName "mainSearch";
        {
            if (!(_forEachIndex in _excludes)) then {
                private _index = _buckets pushBack [_x, [_x]];
                _excludes pushBack _forEachIndex;
                _bucketPos = _x;
                _bucketList = (_buckets select _index) select 1;
                breakTo "mainSearch";
            };
        } forEach _nlos;
        {
            if (!(_forEachIndex in _excludes)) then {
                _testPos = _x;
                if (_testPos vectorDistanceSqr _bucketPos <= 30) then {
                    _bucketList pushBack _x;
                    _excludes pushBack _forEachIndex;
                };
            };
        } forEach _nlos;
        INC(_c);
    };

    // player sideChat format ["c: %1", count _buckets];
    private _explosions = [];
    {
        private _blist = _x select 1;
        private _avg = [0, 0, 0];

        {
            _avg = _avg vectorAdd _x;
        } forEach _blist;
        _c = count _blist;
        private _bpos = _avg vectorMultiply (1 / _c);

        private _distance = _pos vectorDistance _bpos;
        private _hitFactor = 1 - (((_distance / (_indirectHitRange * 4)) min 1) max 0);
        // _hitFactor = 1 / (_distance ^ 2);
        private _hit = (floor (_indirectHit * _hitFactor / 4)) min 500;
        SUB(_hit,_hit % 10);
        private _range = (floor (_indirectHitRange - (_distance / 4))) min 100;
        SUB(_range,_range % 2);

        if (_hit >= 10 && {_range > 0}) then {
            // TEST_ICONS pushBack [_bpos, format ["h: %1, r: %2, hf: %3 d: %4 ihr: %5", _hit, _range, _hitFactor, _distance, _indirectHitRange*4]];
            // TEST_PAIRS pushBack [_pos, _bpos, [1,0,0,1]];
            private _refExp = format ["ace_explosion_reflection_%1_%2", _range, _hit];
            // _refExp createVehicle (ASLtoATL _bpos);
            // drop ["\a3\data_f\Cl_basic","","Billboard",1,15,ASLtoATL _bpos,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];

            _explosions pushBack [_refExp, _bpos, _hit, _distance, _indirectHitRange / 4, _depth];
        };
        if (count _explosions > (_radi * 2) / _depth) exitWith {};
    } forEach _buckets;
    // _can = "Land_Bricks_V4_F" createVehicle (ASLtoATL _pos);
    // _dirvec = _pos vectorFromTo ((player modelToWorldVisualWorld (player selectionPosition "Spine3")));
    // _dirvec = _dirvec vectorMultiply 100;
    // _can setVelocity _dirvec;
    [DFUNC(doExplosions), 0, [_explosions, 0]] call CBA_fnc_addPerFrameHandler;
    [_pfhID] call CBA_fnc_removePerFrameHandler;
};
END_COUNTER(fnc_findReflections);
