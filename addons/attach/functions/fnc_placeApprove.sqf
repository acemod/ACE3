/*
 * Author: Pabst Mirror (based on Explosive attach by Garth de Wet (LH))
 * Approves placement of the lightObject, scans for an appropriate location and attaches
 * A player can release the attachObject with it floating in mid-air.
 * This will use lineIntersectsWith to scan towards the center of the vehicle to find a collision
 * ArmA's collision detection is of couse terrible and often misses collisions (difference between what we see and collision LOD)
 * So it does multiple scans at slighly different angles
 * This is VERY computationaly intensive, but doesn't happen that often.
 *
 * Arguments:
 * 0: Unit (player) <OBJECT>
 * 1: attachToVehicle <OBJECT>
 * 2: Item Classname (CfgWeapon/CfgMagazine) <STRING>
 * 3: Light Vehicle Classname <STRING>
 * 4: On Attach Text <STRING>
 * 5: Starting Pos of dummy item <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * No
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_startingOffset", "_startDistanceFromCenter", "_closeInUnitVector", "_closeInMax", "_closeInMin", "_closeInDistance", "_endPosTestOffset", "_endPosTest", "_doesIntersect", "_startingPosShifted", "_startASL", "_endPosShifted", "_endASL", "_attachedObject", "_attachList"];

params ["_unit", "_attachToVehicle", "_itemClassname", "_itemVehClass", "_onAtachText", "_startingPosition"];
TRACE_6("params",_unit,_attachToVehicle,_itemClassname,_itemVehClass,_onAtachText,_startingPosition);

_startingOffset = _attachToVehicle worldToModel _startingPosition;

_startDistanceFromCenter = vectorMagnitude _startingOffset;
_closeInUnitVector = vectorNormalized (_startingOffset vectorFromTo [0,0,0]);

_closeInMax = _startDistanceFromCenter;
_closeInMin = 0;

while {(_closeInMax - _closeInMin) > 0.01} do {
    _closeInDistance = (_closeInMax + _closeInMin) / 2;
    // systemChat format ["Trying %1 from %2 start %3", _closeInDistance, [_closeInMax, _closeInMin], _startDistanceFromCenter];
    _endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
    _endPosTestOffset set [2, (_startingOffset select 2)];
    _endPosTest = _attachToVehicle modelToWorldVisual _endPosTestOffset;

    _doesIntersect = false;
    {
        if (_doesIntersect) exitWith {};
        _startingPosShifted = _startingPosition vectorAdd _x;
        _startASL = if (surfaceIsWater _startingPosShifted) then {_startingPosShifted} else {ATLtoASL _startingPosShifted};
        {
            _endPosShifted = _endPosTest vectorAdd _x;
            _endASL = if (surfaceIsWater _startingPosShifted) then {_endPosShifted} else {ATLtoASL _endPosShifted};

            //Uncomment to see the lazor show, and see how the scanning works:
            // drawLine3D [_startingPosShifted, _endPosShifted, [1,0,0,1]];
            if (_attachToVehicle in lineIntersectsWith [_startASL, _endASL, _unit]) exitWith {_doesIntersect = true};
        } forEach [[0,0,0.045], [0,0,-0.045], [0,0.045,0], [0,-0.045,0], [0.045,0,0], [-0.045,0,0]];
    } forEach [[0,0,0], [0,0,0.05], [0,0,-0.05]];

    if (_doesIntersect) then {
        _closeInMax = _closeInDistance;
    } else {
        _closeInMin = _closeInDistance;
    };
};

_closeInDistance = (_closeInMax + _closeInMin) / 2;

//Checks (too close to center or can't attach)
if (((_startDistanceFromCenter - _closeInDistance) < 0.1) || {!([_attachToVehicle, _unit, _itemClassname] call FUNC(canAttach))}) exitWith {
    TRACE_2("no valid spot found",_closeInDistance,_startDistanceFromCenter);
    [localize LSTRING(Failed)] call EFUNC(common,displayTextStructured);
};

//Move it out slightly, for visability sake (better to look a little funny than be embedded//sunk in the hull and be useless)
_closeInDistance = (_closeInDistance - 0.0085);

//Create New 'real' Object
_endPosTestOffset = _startingOffset vectorAdd (_closeInUnitVector vectorMultiply _closeInDistance);
_endPosTestOffset set [2, (_startingOffset select 2)];
_attachedObject = _itemVehClass createVehicle (getPos _unit);
_attachedObject attachTo [_attachToVehicle, _endPosTestOffset];

//Remove Item from inventory
_unit removeItem _itemClassname;

//Add Object to attached array
_attachList = _attachToVehicle getVariable [QGVAR(attached), []];
_attachList pushBack [_attachedObject, _itemClassname];
_attachToVehicle setVariable [QGVAR(attached), _attachList, true];

[_onAtachText] call EFUNC(common,displayTextStructured);
