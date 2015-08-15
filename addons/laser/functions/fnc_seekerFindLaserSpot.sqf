/*
 * Author: Nou
 * Turn a laser designator on.
 *
 * Arguments:
 * 0: Position of seeker (ASL) <POSITION>
 * 1: Direction vector (will be normalized) <VECTOR>
 * 2: Seeker FOV in degrees <NUMBER>
 * 3: Seeker wavelength sensitivity range, [1550,1550] is common eye safe. <ARRAY>
 * 4: Seeker laser code. <NUMBER>
 *
 * Return value:
 * Array, [Strongest compatible laser spot ASL pos, owner object] Nil array values if nothing found.
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_spots", "_buckets", "_excludes", "_bucketIndex", "_finalPos", "_laser",
    "_res", "_bucketPos", "_bucketList", "_c", "_forEachIndex", "_index", "_testPos",
    "_finalBuckets", "_largest", "_largestIndex", "_finalBucket", "_owners",
    "_avgX", "_avgY", "_avgZ", "_count", "_maxOwner", "_maxOwnerIndex", "_finalOwner",
    "_dir", "_seekerCos", "_testDotProduct", "_testPoint", "_testPointVector"
];

param ["_pos", "_dir", "_seekerFov", "_seekerWavelengths", "_seekerCode"];
_dir = vectorNormalized _dir;

_seekerCos = cos _seekerFov;

_spots = [];
_buckets = [];
_excludes = [];
_bucketIndex = 0;
_finalPos = nil;
_finalOwner = nil;

{
    _x params ["_obj", "_owner", "_method", "_emitterWavelength", "_laserCode", "_divergence"];
    if(alive _obj && {_emitterWavelength >= (_seekerWavelengths select 0)} && {_emitterWavelength <= (_seekerWavelengths select 1)} && {_laserCode == _seekerCode}) then {
        _laser = [];
        if(IS_CODE(_method)) then {
            _laser = _x call _method;
        } else {
            if(IS_STRING(_method)) then {
                _laser = _x call (missionNamespace getVariable [_method, {}]);
            } else {
                if(IS_ARRAY(_method)) then {
                    if(count _method == 2) then {
                        _laser = [ATLtoASL (_obj modelToWorldVisual (_method select 0)), _obj weaponDirection (_method select 1)];
                    } else {
                        if(count _method == 3) then {
                            _laser = [ATLtoASL (_obj modelToWorldVisual (_method select 0)), (ATLtoASL (_obj modelToWorldVisual (_method select 1))) vectorFromTo (ATLtoASL (_obj modelToWorldVisual (_method select 2)))];
                        };
                    };
                };
            };
        };

        //Handle Weird Data Return
        if (_laser params [["_laserPos", [], [[]], 3], ["_laserDir", [], [[]], 3]]) then {
            _res = [_laserPos, _laserDir, _divergence] call FUNC(shootCone);
            {
                _testPoint = _x select 0;
                _testPointVector = vectorNormalized (_testPoint vectorDiff _pos);
                _testDotProduct = _dir vectorDotProduct _testPointVector;
                if(_testDotProduct > _seekerCos) then {
                    _spots pushBack [_testPoint, _owner];
                };
            } forEach (_res select 2);
        };
    };
} forEach (GVAR(laserEmitters) select 1);

if((count _spots) > 0) then {
    _bucketPos = nil;
    _bucketList = nil;
    _c = 0;
    while { count(_spots) != count(_excludes) && _c < (count _spots) } do {
        scopeName "mainSearch";
        {
            if(!(_forEachIndex in _excludes)) then {
                _index = _buckets pushBack [_x, [_x]];
                _excludes pushBack _forEachIndex;
                _bucketPos = _x select 0;
                _bucketList = (_buckets select _index) select 1;
                breakTo "mainSearch";
            };
        } forEach _spots;
        {
            if(!(_forEachIndex in _excludes)) then {
                _testPos = (_x select 0);
                if(_testPos vectorDistanceSqr _bucketPos <= 100) then {
                    _bucketList pushBack _x;
                    _excludes pushBack _forEachIndex;
                };
            };
        } forEach _spots;
        _c = _c + 1;
    };
    _finalBuckets = [];
    _largest = -1;
    _largestIndex = 0;
    {
        _index = _finalBuckets pushBack [];
        _bucketList = _finalBuckets select _index;
        {
            _testPos = (_x select 0);
            if(!terrainIntersectASL [_pos, _testPos] && {!lineIntersects [_pos, _testPos]}) then {
                _bucketList pushBack _x;
            };
        } forEach (_x select 1);
        if((count _bucketList) > _largest) then {
            _largest = (count _bucketList);
            _largestIndex = _index;
        };
    } forEach _buckets;

    _finalBucket = _finalBuckets select _largestIndex;
    _owners = HASH_CREATE;

    if(count _finalBucket > 0) then {
        _avgX = 0;
        _avgY = 0;
        _avgZ = 0;
        {
            //player sideChat format["x: %1", _x];
            _avgX = _avgX + ((_x select 0) select 0);
            _avgY = _avgY + ((_x select 0) select 1);
            _avgZ = _avgZ + ((_x select 0) select 2);
            _owner = _x select 1;
            if(HASH_HASKEY(_owners, _owner)) then {
                _count = HASH_GET(_owners, _owner);
                HASH_SET(_owners, _owner, _count+1);
            } else {
                HASH_SET(_owners, _owner, 1);
            };
        } forEach _finalBucket;
        _count = count _finalBucket;
        _finalPos = [_avgX/_count, _avgY/_count, _avgZ/_count];
        _maxOwner = -1;
        _maxOwnerIndex = 0;
        {
            if((_owners select 1) select _forEachIndex > _maxOwner) then {
                _maxOwner = (_owners select 1) select _forEachIndex;
                _maxOwnerIndex = _forEachIndex;
            };
        } forEach (_owners select 0);
        _finalOwner = (_owners select 0) select _maxOwnerIndex;
    };
};
[_finalPos, _owner];
