#include "script_component.hpp"
/*
 * Author: Glowbal, drofseh
 * Places a dead body inside a body bag.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Medic <OBJECT>
 * - 1: Patient <OBJECT>
 * 1: Resting Place Classname <STRING>
 * 2: Offset <ARRAY> (default: [0,0,0])
 * 3: Rotation <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, cursorObject], "ACE_bodyBagObject"] call ace_medical_treatment_fnc_placeInBodyBagOrGrave
 *
 * Public: No
 */

params ["_args", "_restingPlaceClass", ["_offset", [0,0,0]], ["_rotation", 0]];
_args params ["_medic", "_patient"];
TRACE_1("placeInBodyBagOrGrave",_patient);

if (!local _patient) exitWith {
    TRACE_1("Calling where local",local _patient);
    [QGVAR(placeInBodyBagOrGrave), _this, _patient] call CBA_fnc_targetEvent;
};

if (alive _patient) then {
    TRACE_1("Manually killing with setDead",_patient);
    [_patient, "buried_alive", _medic] call EFUNC(medical_status,setDead);
};

private _headPos = _patient modelToWorldVisual (_patient selectionPosition "head");
private _spinePos = _patient modelToWorldVisual (_patient selectionPosition "Spine3");
private _direction = (_headPos vectorFromTo _spinePos) call CBA_fnc_vectDir;
private _position = getPosASL _patient;
// apply adjustments
_position = _position vectorAdd _offset;
_direction = _direction + _rotation;


// Move the body away so it won't collide with the body bag object
// This setPosASL seems to need to be called where the unit is local
_patient setPosASL [-5000, -5000, 0];

// Create the body bag object, set its position to prevent it from flipping
private _restingPlace = createVehicle [_restingPlaceClass, [0, 0, 0], [], 0, "NONE"];
_restingPlace setPosASL _position;
_restingPlace setDir _direction;

// Server will handle hiding and deleting the body
// Keep event name as body bag only to avoid breaking things for others
["ace_placedInBodyBag", [_patient, _restingPlace]] call CBA_fnc_globalEvent;
