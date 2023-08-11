#include "script_component.hpp"
/*
 * Author: Glowbal, drofseh
 * Places a dead body inside a body bag.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * - 0: Medic <OBJECT>
 * - 1: Patient <OBJECT>
 * 1: Resting Place Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, cursorObject], "ACE_bodyBagObject"] call ace_medical_treatment_fnc_placeInBodyBagOrGrave
 *
 * Public: No
 */

params ["_args", "_restingPlaceObject"];
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
if (_restingPlaceObject == "Land_Grave_dirt_F") then {
    // Grave object needs to be rotated 90 degrees to line up with the body
    _direction = _direction + 90;
} else {
    // Body bag needs to be a little higher to prevent it from flipping
    _position = _position vectorAdd [0, 0, 0.2];
};

// Move the body away so it won't collide with the body bag object
// This setPosASL seems to need to be called where the unit is local
_patient setPosASL [-5000, -5000, 0];

// Create the body bag object, set its position to prevent it from flipping
private _restingPlace = createVehicle [_restingPlaceObject, [0, 0, 0], [], 0, "NONE"];
_restingPlace setPosASL _position;
_restingPlace setDir _direction;

// Server will handle hiding and deleting the body
// Keep event name as body bag only to avoid breaking things for others
["ace_placedInBodyBag", [_patient, _restingPlace]] call CBA_fnc_globalEvent;
