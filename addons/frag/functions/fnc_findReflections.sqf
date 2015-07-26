//fnc_findReflections.sqf
#include "script_component.hpp"

private ["_split", "_radi", "_params", "_pos", "_explosiveInfo", "_los", "_nlos", "_zIndex", "_depth", "_indirectHitRange", "_indirectHit", "_distanceCount", "_lastPos", "_test", "_vec", "_testPos", "_buckets", "_excludes", "_bucketIndex", "_bucketPos", "_bucketList", "_c", "_index", "_blist", "_avgX", "_avgY", "_avgZ", "_bpos", "_distance", "_hitFactor", "_hit", "_range", "_refExp", "_rand", "_i", "_x", "_res", "_forEachIndex", "_explosions", "_can", "_dirvec", "_zAng"];

_params = _this select 0;
_pos = _params select 0;
_explosiveInfo = _params select 1;
_los = _params select 2;
_nlos = _params select 3;
_zIndex = _params select 4;
_depth = _params select 5;
_rand = _params select 6;

_split = 15;
_radi = (360/_split*_depth);

// player sideChat format["p: %1", _explosiveInfo];
_indirectHitRange = _explosiveInfo select 0;
_indirectHit = _explosiveInfo select 1;
_distanceCount = (floor _indirectHitRange*4) min 100;

if(_zIndex < 5) then {
    _lastPos = _pos;
    _zAng = _zIndex*20+2;
    if(_zAng > 80) then {
        _radi = 1;
        _zAng = 90;
    };
    for "_i" from 0 to _radi do {
        _test = true;
        _vec = [1, ((_i*_split)+_rand) mod 360, _zAng] call cba_fnc_polar2vect;
        for "_x" from 1 to _distanceCount do {
            _testPos = _pos vectorAdd (_vec vectorMultiply _x);
            // drop ["\a3\data_f\Cl_basic","","Billboard",1,15,ASLtoATL _testPos,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];
            _res = lineIntersectsWith [_pos, _testPos];
            if(count _res > 0) exitWith {
                _test = false;
                _nlos pushBack _lastPos;
                // {
                    // _x addEventHandler ["HandleDamage", { diag_log text format["this: %1", _this]; }];
                // } forEach _res;
                // drop ["\a3\data_f\Cl_basic","","Billboard",1,15,ASLtoATL _testPos,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];
                // TEST_PAIRS pushBack [_pos, _lastPos, [1,0,0,1]];

            };
            // if(terrainIntersectASL [_pos, _testPos]) exitWith {};
            _lastPos = _testPos;
        };
    };
    _params set[4, _zIndex+1];
} else {
    _depth = _depth + 1;
    _buckets = [];
    _excludes = [];
    _bucketIndex = 0;
    _bucketPos = nil;
    _bucketList = nil;
    _c = 0;
    while { count(_nlos) != count(_excludes) && _c < (count _nlos) } do {
        scopeName "mainSearch";
        {
            if(!(_forEachIndex in _excludes)) then {
                _index = _buckets pushBack [_x, [_x]];
                _excludes pushBack _forEachIndex;
                _bucketPos = _x;
                _bucketList = (_buckets select _index) select 1;
                breakTo "mainSearch";
            };
        } forEach _nlos;
        {
            if(!(_forEachIndex in _excludes)) then {
                _testPos = _x;
                if(_testPos vectorDistanceSqr _bucketPos <= 30) then {
                    _bucketList pushBack _x;
                    _excludes pushBack _forEachIndex;
                };
            };
        } forEach _nlos;
        _c = _c + 1;
    };

    // player sideChat format["c: %1", count _buckets];
    _explosions = [];
    {
        _blist = _x select 1;
        _avgX = 0;
        _avgY = 0;
        _avgZ = 0;

        {
            _avgX = _avgX + (_x select 0);
            _avgY = _avgY + (_x select 1);
            _avgZ = _avgZ + (_x select 2);
        } forEach _blist;
        _c = count _blist;
        _bpos = [_avgX/_c, _avgY/_c, _avgZ/_c];

        _distance = _pos vectorDistance _bpos;
        _hitFactor = 1-(((_distance/(_indirectHitRange*4)) min 1) max 0);
        // _hitFactor = 1/(_distance^2);
        _hit = _indirectHit*_hitFactor;
        _hit = (floor (_hit/4)) min 500;
        _hit = _hit - (_hit%10);
        _range = (floor (_indirectHitRange-(_distance/4))) min 100;
        _range = _range - (_range%2);

        if(_hit >= 10 && _range > 0) then {
            // TEST_ICONS pushBack [_bpos, format["h: %1, r: %2, hf: %3 d: %4 ihr: %5", _hit, _range, _hitFactor, _distance, _indirectHitRange*4]];
            // TEST_PAIRS pushBack [_pos, _bpos, [1,0,0,1]];
            _refExp = format["ace_explosion_reflection_%1_%2", _range, _hit];
            // _refExp createVehicle (ASLtoATL _bpos);
            // drop ["\a3\data_f\Cl_basic","","Billboard",1,15,ASLtoATL _bpos,[0,0,0],1,1.275,1.0,0.0,[1],[[1,0,0,1]],[0],0.0,2.0,"","",""];

            _explosions pushBack [_refExp, _bpos, _hit, _distance, _indirectHitRange/4, _depth];

        };
        if(count _explosions > (_radi*2)/_depth) exitWith {};
    } forEach _buckets;
    // _can = "Land_Bricks_V4_F" createVehicle (ASLtoATL _pos);
    // _dirvec = _pos vectorFromTo ((ATLtoASL (player modelToWorldVisual (player selectionPosition "Spine3"))));
    // _dirvec = _dirvec vectorMultiply 100;
    // _can setVelocity _dirvec;
    [DFUNC(doExplosions), 0, [_explosions, 0]] call cba_fnc_addPerFrameHandler;
    [(_this select 1)] call cba_fnc_removePerFrameHandler;
};
