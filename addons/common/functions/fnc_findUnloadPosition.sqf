/*
 * Author: PabstMirror
 * Find a safe place near a vehicle to unload something
 * Handles Normal Terrain, In Water or On Buildings (Pier, StaticShip)
 *
 * Arguments:
 * 0: Source Vehicle <OBJECT>
 * 1: Cargo Classname <STRING>
 * 2: Unloader (player) <OBJECT><OPTIONAL>
 * 3: Max Distance (meters) <NUMBER><OPTIONAL>
 *
 * Return Value:
 * Unload PositionAGL (Can Be [] if no valid pos found) <ARRAY>
 *
 * Example:
 * [theCar, "CAManBase", player] call ace_common_fnc_findUnloadPosition;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

//Number of tests run (findEmptyPosition and manual) note can run both if first doesn't give good results
#define MAX_TESTS 25
//Manual collision tests (count and radius):
#define COL_TEST_COUNT 8
#define COL_TEST_RANGE 0.6


params ["_vehicle", "_typeOfCargo", ["_theUnloader", objNull], ["_maxDistance", 10]];
TRACE_3("params",_vehicle,_typeOfCargo,_theUnloader,_maxDistance);

private["_aboveBuilding", "_angle", "_belowRoundArray", "_index", "_originAGL", "_rangeToCheck", "_returnAGL", "_roundAGL", "_roundPointIsValid", "_validVehiclestate"];

if (isNull _theUnloader) then {_theUnloader = _vehicle};

//Make sure vehicle is stable
_validVehiclestate = ((vectorMagnitude (velocity _vehicle)) < 1.5);

if (!(_vehicle isKindOf "Ship")) then {
    if ((!isTouchingGround _vehicle) && {((getPos _vehicle) select 2) > 1.5}) then {
        _validVehiclestate = false;
    };
};
if (!_validVehiclestate) exitWith {
    TRACE_1("bad vehicle state",_vehicle);
    []
};

//Ideal unload pos is halfway between unloader and vehicle (should be infront of player)
_originAGL = ASLtoAGL (((getPosASL _theUnloader) vectorAdd (getPosASL _vehicle)) vectorMultiply 0.5);
_returnAGL = [];

/*
//findEmptyPosition only works on ground level (not underwater/on buildings)
if ((abs ((getPosATL _theUnloader) select 2)) < 0.5) then {
    TRACE_1("Checking ground level (findEmptyPosition)", ((getPosATL _theUnloader) select 2));
    _rangeToCheck = 1;
    while {(_rangeToCheck < _maxDistance) && {_returnAGL isEqualTo []}} do {
        _roundAGL = _originAGL findEmptyPosition [0, _rangeToCheck, _typeOfCargo];
        TRACE_2("findEmptyPosition", _rangeToCheck, _roundAGL);
        if (!(_roundAGL isEqualTo [])) then {
            _returnAGL = _roundAGL;
        };
        _rangeToCheck = _rangeToCheck + (_maxDistance/MAX_TESTS);
    };
    TRACE_1("findEmptyPosition loop finished", _returnAGL);
};
 */

//If we haven't found anythign yet, or we're not on the ground
//Do a manual search for empty pos (handles underwater, buildings or piers)
if (_returnAGL isEqualTo []) then {
    TRACE_1("Checking manually for buildings/underwater", ((getPosATL _theUnloader) select 2));
    _rangeToCheck = 0.5;
    while {(_rangeToCheck < (sqrt _maxDistance)) && {_returnAGL isEqualTo []}} do {
        _roundAGL = _originAGL vectorAdd [
        (-1 * _rangeToCheck + (random 2 * _rangeToCheck)),
        (-1 * _rangeToCheck + (random 2 * _rangeToCheck)),
        0
        ];
        _belowRoundArray = lineIntersectsSurfaces [(AGLtoASL _roundAGL) vectorAdd [0,0,1], (AGLtoASL _roundAGL) vectorAdd [0,0,-3], _theUnloader, _vehicle, true, 1];
        TRACE_2("Testing Pos",_roundAGL,_belowRoundArray);
        if (!(_belowRoundArray isEqualTo [])) then {
            _aboveBuilding = (_belowRoundArray select 0) select 2;
            //Point is above something: Terrain(null) or Building
            if ((isNull _aboveBuilding) || {_aboveBuilding isKindOf "Building"}) then {
                //Get the real intersection point:
                _roundAGL = ASLtoAGL ((_belowRoundArray select 0) select 0);

                _roundPointIsValid = true;
                for "_index" from 0 to (COL_TEST_COUNT -1 ) do {
                    _angle = _index * (360 / COL_TEST_COUNT);
                    _point1ASL = (AGLtoASL _roundAGL) vectorAdd [COL_TEST_RANGE * cos _angle, COL_TEST_RANGE * sin _angle, 0.1];
                    _point2ASL = (AGLtoASL _roundAGL) vectorAdd [-COL_TEST_RANGE * cos _angle, -COL_TEST_RANGE * sin _angle, 2];
                    if (!((lineIntersectsSurfaces [_point1ASL, _point2ASL]) isEqualTo [])) exitWith {
                        _roundPointIsValid = false;
                    };
                };
                if (_roundPointIsValid) then {
                    TRACE_3("Valid point found", _rangeToCheck,_roundAGL, (_originAGL distance _roundAGL));
                    //Add just a little so we don't sink through the floor:
                    _returnAGL = _roundAGL vectorAdd [0,0,0.05];
                };
            };
        };
        _rangeToCheck = _rangeToCheck + ((sqrt _maxDistance) / MAX_TESTS);
    };
};

TRACE_1("returning",_returnAGL);
_returnAGL
