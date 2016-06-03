/*
 * Author: PabstMirror, ViperMaul
 * Find a safe place near a vehicle to unload something
 * Handles Normal Terrain, In Water or On Buildings (Pier, StaticShip)
 *
 * Arguments:
 * 0: Source Vehicle <OBJECT>
 * 1: Cargo Classname <STRING>
 * 2: Unloader (player) <OBJECT><OPTIONAL>
 * 3: Max Distance (meters) <NUMBER><OPTIONAL>
 * 4: Check Vehicle is Stable <BOOL><OPTIONAL>
 *
 * Return Value:
 * Unload PositionAGL (Can Be [] if no valid pos found) <ARRAY>
 *
 * Example:
 * [theCar, "CAManBase", player, 10, true] call ace_common_fnc_findUnloadPosition;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

//Number of tests run (effects performance in worst case scenarior where nothing is found VERSUES reliably finding a pos):
#define MAX_TESTS 75

//Manual collision tests (count and radius):
#define COL_TEST_COUNT 12

params ["_vehicle", "_typeOfCargo", ["_theUnloader", objNull], ["_maxDistance", 10], ["_checkVehicleIsStable", true]];
TRACE_5("params",_vehicle,_typeOfCargo,_theUnloader,_maxDistance,_checkVehicleIsStable);

scopeName "main";

if (_checkVehicleIsStable) then {
    if (((vectorMagnitude (velocity _vehicle)) > 1.5) || {(!(_vehicle isKindOf "Ship")) && {(!isTouchingGround _vehicle) && {((getPos _vehicle) select 2) > 1.5}}}) then {
        TRACE_4("bad vehicle state",_vehicle,velocity _vehicle,isTouchingGround _vehicle,getPos _vehicle);
        [] breakOut "main";
    };
};

private _radiusOfItem = 1;
if (_typeOfCargo isKindOf "CAManBase") then {
    _radiusOfItem = 1.1;
} else {
    //`sizeOf` is unreliable, and does not work with object types that don't exist on map, so estimate size based on cargo size
    if (isNumber (configFile >> "CfgVehicles" >> _typeOfCargo >> QEGVAR(cargo,size))) then {
        _radiusOfItem = (((getNumber (configFile >> "CfgVehicles" >> _typeOfCargo >> QEGVAR(cargo,size))) ^ 0.35) max 0.75);
    };
};

if (isNull _theUnloader) then {_theUnloader = _vehicle;};

//Ideal unload pos is halfway between unloader and vehicle (at the unloader's height)
private _originASL = ((getPosASL _theUnloader) vectorAdd (getPosASL _vehicle)) vectorMultiply 0.5;
_originASL set [2, (getPosASL _theUnloader) select 2];
private _originAGL = ASLtoAGL _originASL;

//Do a manual search for empty pos (handles underwater, buildings or piers)
TRACE_2("Checking for unload",_originAGL,_radiusOfItem);
private _rangeToCheck = 0;
while {_rangeToCheck < _maxDistance} do {
    private _roundDistance = random _rangeToCheck;
    private _roundAngle = random 360;
    private _roundAGL = _originAGL vectorAdd [(cos _roundAngle) * _roundDistance, (sin _roundAngle) * _roundDistance, 0];

    private _roundPointIsValid = false;
    if (((AGLtoASL _roundAGL) select 2) > 0) then {
        //Shoot a ray down, and make sure we hit something solid like a building or the ground:
        private _belowRoundArray = lineIntersectsSurfaces [(AGLtoASL _roundAGL) vectorAdd [0,0,0.5], (AGLtoASL _roundAGL) vectorAdd [0,0,-1]];
        TRACE_4("Testing for solid",_roundDistance,_roundAngle,_roundAGL,_belowRoundArray);
        if (!(_belowRoundArray isEqualTo [])) then {
            private _aboveBuilding = (_belowRoundArray select 0) select 2;
            //Point is above something: Terrain(null) or Building
            if ((isNull _aboveBuilding) || {_aboveBuilding isKindOf "Building"}) then {
                //Get the real intersection point:
                _roundAGL = ASLtoAGL ((_belowRoundArray select 0) select 0);
                _roundPointIsValid = true;
            };
        };
    } else {
        //Underwater, just unload anywhere
        TRACE_3("Under the sea",_roundDistance,_roundAngle,_roundAGL);
        _roundPointIsValid = true;
    };

    //Make sure point is valid and do a fast check for people in the way (which sometimes aren't caught by line scaning)
    if (_roundPointIsValid && {(_roundAGL nearEntities ["Man", _radiusOfItem]) isEqualTo []}) then {
        for "_index" from 0 to (COL_TEST_COUNT -1) do {
            //Scan for colisions with objects with lineIntersectsSurfaces
            private _angle = _index * (360 / COL_TEST_COUNT);
            private _point1ASL = (AGLtoASL _roundAGL) vectorAdd [_radiusOfItem * cos _angle, _radiusOfItem * sin _angle, 0.1];
            private _point2ASL = (AGLtoASL _roundAGL) vectorAdd [-_radiusOfItem * cos _angle, -_radiusOfItem * sin _angle, (_radiusOfItem + 0.5)];
            private _testIntersections = lineIntersectsSurfaces [_point1ASL, _point2ASL];
            if (((count _testIntersections) == 1) && {isNull ((_testIntersections select 0) select 2)}) then {
                private _hitGroundASL = (_testIntersections select 0) select 0;
                private _hitHeightOffset = ((AGLtoASL _roundAGL) select 2) - (_hitGroundASL select 2);
                private _hit2dOffset = _roundAGL distance2D _hitGroundASL;
                private _slope = _hitHeightOffset atan2 _hit2dOffset;
                if (_slope < 25) then { //Ignore ground hit if slope is reasonable
                    _testIntersections = [];
                };
            };
            if (!(_testIntersections isEqualTo [])) exitWith {
                TRACE_2("collision low/high",_roundAGL,_testIntersections);
                _roundPointIsValid = false;
            };
            _point1ASL = (AGLtoASL _roundAGL) vectorAdd [_radiusOfItem * cos _angle, _radiusOfItem * sin _angle, 0.5];
            _point2ASL = (AGLtoASL _roundAGL) vectorAdd [-_radiusOfItem * cos _angle, -_radiusOfItem * sin _angle, 1];
            _testIntersections = lineIntersectsSurfaces [_point1ASL, _point2ASL];
            if (!(_testIntersections isEqualTo [])) exitWith {
                TRACE_2("collision mid",_roundAGL,_testIntersections);
                _roundPointIsValid = false;
            };
        };
        if (_roundPointIsValid) then {
            TRACE_3("Valid point found", _rangeToCheck,_roundAGL, (_originAGL distance _roundAGL));
            //Raise it slightly so we don't sink through the floor:
            (_roundAGL vectorAdd [0,0,0.05]) breakOut "main";
        };
    };
    _rangeToCheck = _rangeToCheck + (_maxDistance / MAX_TESTS);
};

TRACE_1("no valid spots found",_rangeToCheck);
[] //return empty array
