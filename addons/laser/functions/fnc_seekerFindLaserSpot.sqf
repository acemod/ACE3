#include "..\script_component.hpp"
/*
 * Author: Nou
 * Searches for a laser spot given a seekers params.
 * Provides the interface for Missile Guidance
 *
 * Arguments:
 * 0: Position of seeker (ASL) <ARRAY>
 * 1: Direction vector (will be normalized) <ARRAY>
 * 2: Seeker FOV in degrees <NUMBER>
 * 3: Seeker max distance in meters <NUMBER>
 * 4: Seeker wavelength sensitivity range, [1550,1550] is common <ARRAY>
 * 5: Seeker laser code. <NUMBER>
 * 6: Ignore 1 (e.g. Player's vehicle) <OBJECT> (default: objNull)
 * 7: Ignore 2 (e.g. Attached object) <OBJECT> (default: objNull)
 * 8: Owners to ignore (e.g. Player's vehicle) <ARRAY of OBJECTs> (default: [])
 *
 * Return Value:
 * [Strongest compatible laser spot ASL pos, owner object] Nil array values if nothing found <ARRAY>
 *
 * Example:
 * [getPosASL player, [0,1,0], 90, [1550, 1550], 1111, player] call ace_laser_fnc_seekerFindLaserSpot
 *
 * Public: No
 */

BEGIN_COUNTER(seekerFindLaserSpot);

params ["_posASL", "_dir", "_seekerFov", "_seekerMaxDistance", "_seekerWavelengths", "_seekerCode", ["_ignoreObj1", objNull], ["_ignoreObj2", objNull], ["_ignoreOwners", []]];

_dir = vectorNormalized _dir;
_seekerWavelengths params ["_seekerWavelengthMin", "_seekerWavelengthMax"];

private _seekerCos = cos _seekerFov;
private _seekerMaxDistSq = _seekerMaxDistance ^ 2;

TRACE_6("",_posASL,_dir,_seekerFov,_seekerMaxDistance,_seekerWavelengths,_seekerCode);

private _spots = [];
private _finalPos = nil;
private _finalOwner = objNull;

// Go through all lasers in GVAR(laserEmitters)
{
    _x params ["_obj", "_owner", "_laserMethod", "_emitterWavelength", "_laserCode", "_divergence"];
    TRACE_6("laser",_obj,_owner,_laserMethod,_emitterWavelength,_laserCode,_divergence);

    if (_owner in _ignoreOwners) then {continue};

    if (alive _obj && {_emitterWavelength >= _seekerWavelengthMin} && {_emitterWavelength <= _seekerWavelengthMax} && {_laserCode == _seekerCode}) then {

        private _laser = [];
        // Find laser pos and dir of the laser depending on type
        if (IS_STRING(_laserMethod)) then {
            _laser = _x call (missionNamespace getVariable [_laserMethod, []]);
        } else {
            if (IS_CODE(_laserMethod)) then {
                _laser = _x call _laserMethod;
            } else {

                if (IS_ARRAY(_laserMethod)) then {
                    if (count _laserMethod == 2) then { // [modelPosition, weaponName] for _obj
                        _laser = [_obj modelToWorldVisualWorld (_laserMethod select 0), _obj weaponDirection (_laserMethod select 1)];
                    } else {
                        if (count _laserMethod == 3) then {
                            _laser = [_obj modelToWorldVisualWorld (_laserMethod select 0), (_obj modelToWorldVisualWorld (_laserMethod select 1)) vectorFromTo (_obj modelToWorldVisualWorld (_laserMethod select 2))];
                        };
                    };
                };
            };
        };

        TRACE_1("",_laser);
        //Handle Weird Data Return - skips over this laser in the for loop
        if ((_laser isEqualTo []) || {_laser isEqualTo [-1, -1]}) exitWith {WARNING_1("Bad Laser Return %1",_laser);};
        _laser params [["_laserPos", [], [[]], 3], ["_laserDir", [], [[]], 3]];

        if (GVAR(dispersionCount) > 0) then {
            // Shoot a cone with dispersion
            ([_laserPos, _laserDir, _divergence, GVAR(dispersionCount), _obj] call FUNC(shootCone)) params ["", "", "_resultPositions"];
            {
                private _testPoint = _x select 0;
                private _testPointVector = _posASL vectorFromTo _testPoint;
                private _testDotProduct = _dir vectorDotProduct _testPointVector;
                if ((_testDotProduct > _seekerCos) && {(_testPoint vectorDistanceSqr _posASL) < _seekerMaxDistSq}) then {
                    _spots pushBack [_testPoint, _owner];
                };
            } forEach _resultPositions;
        } else {
            // Shoot a single perfect ray from source to target (note, increased chance to "miss" on weird objects like bushes / rocks)
            ([_laserPos, _laserDir, _obj] call FUNC(shootRay)) params ["_resultPos", "_distance"];
            TRACE_2("spot",_resultPos,_distance);
            if (_distance > 0) then {
                private _testPointVector = _posASL vectorFromTo _resultPos;
                private _testDotProduct = _dir vectorDotProduct _testPointVector;
                if ((_testDotProduct > _seekerCos) && {(_resultPos vectorDistanceSqr _posASL) < _seekerMaxDistSq}) then {
                    _spots pushBack [_resultPos, _owner];
                };
            };
        };
    };
} forEach (values GVAR(laserEmitters)); // Go through all values in hash

TRACE_2("",count _spots,_spots);

if (_spots isNotEqualTo []) then {
    private _bucketList = nil;
    private _bucketPos = nil;
    private _c = 0;
    private _buckets = [];
    private _excludes = [];

    // Put close points together into buckets
    while { count(_spots) != count(_excludes) && _c < (count _spots) } do {
        scopeName "mainSearch";
        {
            if !(_forEachIndex in _excludes) then {
                private _index = _buckets pushBack [_x, [_x]];
                _excludes pushBack _forEachIndex;
                _bucketPos = _x select 0;
                _bucketList = (_buckets select _index) select 1;
                breakTo "mainSearch";
            };
        } forEach _spots;
        {
            if !(_forEachIndex in _excludes) then {
                private _testPos = (_x select 0);
                if ((_testPos vectorDistanceSqr _bucketPos) <= 100) then {
                    _bucketList pushBack _x;
                    _excludes pushBack _forEachIndex;
                };
            };
        } forEach _spots;
        _c = _c + 1;
    };

    TRACE_1("",_buckets);

    private _finalBuckets = [];
    private _largest = -1;
    private _largestIndex = 0;
    {
        // find bucket with largest number of points we can see
        private _index = _finalBuckets pushBack [];
        _bucketList = _finalBuckets select _index;
        {
            private _testPos = (_x select 0) vectorAdd [0,0,0.05];
            private _testIntersections = lineIntersectsSurfaces [_posASL, _testPos, _ignoreObj1, _ignoreObj2];

            // Ignore intersections near the spot to avoid false LOS blocks from vehicle surfaces
            _testIntersections = _testIntersections select { 
                _x params ["_intersectPosASL"];
                (_intersectPosASL vectorDistanceSqr _testPos) > 0.01;
            };

            if ([] isEqualTo _testIntersections) then {
                _bucketList pushBack _x;
            };
        } forEach (_x select 1);
        if ((count _bucketList) > _largest) then {
            _largest = (count _bucketList);
            _largestIndex = _index;
        };
    } forEach _buckets;

    private _finalBucket = _finalBuckets select _largestIndex;
    private _ownersHash = createHashMap;

    TRACE_2("",_finalBucket,_finalBuckets);

    if (count _finalBucket > 0) then {
        // merge all points in the best bucket into an average point and find effective owner
        _finalPos = [0,0,0];
        {
            _x params ["_xPos", "_owner"];
            _finalPos = _finalPos vectorAdd _xPos;
            private _value = _ownersHash getOrDefault [hashValue _owner, [0, _owner]];
            _value set [0, 1 + _value#0];
            _ownersHash set [hashValue _owner, _value];
        } forEach _finalBucket;

        _finalPos = _finalPos vectorMultiply (1 / (count _finalBucket));

        private _maxOwnerCount = -1;

        {
            _y params ["_count", "_owner"];
            if (_count > _maxOwnerCount) then {
                _maxOwnerCount = _count;
                _finalOwner = _owner;
            };
        } forEach _ownersHash;
    };
};

END_COUNTER(seekerFindLaserSpot);

#ifdef DRAW_LASER_INFO
if (isNil "_finalPos") then {
    drawIcon3D ["\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa", [0.9,1,0,1], (ASLToAGL _posASL), 1, 1, 0, format ["Seeker: %1", _seekerCode], 0.5, 0.025, "TahomaB"];
} else {
    drawIcon3D ["\A3\ui_f\data\map\vehicleicons\iconManAT_ca.paa", [0.5,1,0,1], (ASLToAGL _posASL), 1, 1, 0, format ["Seeker: %1", _seekerCode], 0.5, 0.025, "TahomaB"];
    drawLine3D [ASLToAGL _posASL, ASLToAGL _finalPos, [0.5,1,0,1]];
};
#endif

TRACE_2("return",_finalPos,_finalOwner);
if (isNil "_finalPos") exitWith {[nil, _finalOwner]};
[_finalPos, _finalOwner];
