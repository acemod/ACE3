#include "script_component.hpp"
/*
 * Author: Glowbal
 * Places a dead body inside a body bag.
 *
 * Arguments:
 * 0: Medic (not used) <OBJECT>
 * 1: Patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_medical_treatment_fnc_placeInBodyBag
 *
 * Public: No
 */

params ["", "_patient"];
TRACE_1("placeInBodyBag",_patient);

if (!local _patient) exitWith {
    TRACE_1("Calling where local",local _patient);
    [QGVAR(placeInBodyBag), [nil, _patient], _patient] call CBA_fnc_targetEvent;
};

if (alive _patient) then {
    TRACE_1("Manually killing with setDead",_patient);
    [_patient, "buried_alive"] call EFUNC(medical_status,setDead);
};

private _position = (getPosASL _patient) vectorAdd [0, 0, 0.2];

private _headPos = _patient modelToWorldVisual (_patient selectionPosition "head");
private _spinePos = _patient modelToWorldVisual (_patient selectionPosition "Spine3");
private _direction = (_headPos vectorFromTo _spinePos) call CBA_fnc_vectDir;

// Move the body away so it won't collide with the body bag object
// This setPosASL seems to need to be called where the unit is local
_patient setPosASL [-5000, -5000, 0];

// Create the body bag object, set its position to prevent it from flipping
private _bodyBag = createVehicle ["ACE_bodyBagObject", [0, 0, 0], [], 0, "NONE"];
_bodyBag setPosASL _position;
_bodyBag setDir _direction;

// Server will handle hiding and deleting the body
["ace_placedInBodyBag", [_patient, _bodyBag]] call CBA_fnc_globalEvent;
