#include "script_component.hpp"
/*
 * Author: Glowbal, drofseh
 * Places a dead body inside a body bag.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part (not used) <STRING>
 * 3: Treatment (not used) <STRING>
 * 4: Item User (not used) <OBJECT>
 * 5: Used Item (default: "ACE_bodyBag") <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "ACE_bodyBagObject"] call ace_medical_treatment_fnc_placeInBodyBagOrGrave
 *
 * Public: No
 */

params ["_medic", "_patient", "", "", "", ["_usedItem", "ACE_bodyBag"]];
TRACE_1("placeInBodyBagOrGrave",_patient);

private _alive = alive _patient;
private _restingPlace = "ACE_bodyBagObject";
private _restingPlaceIsBodyBag = _restingPlace == "ACE_bodyBagObject";

if (_alive && {!GVAR(allowBodyBagUnconscious) && {_restingPlaceIsBodyBag}}) exitWith {
    [_medic, "ACE_bodyBag"] call EFUNC(common,addToInventory); // re-add slighly used bodybag?
    [LSTRING(bodybagWhileStillAlive)] call EFUNC(common,displayTextStructured);
};

if (_usedItem == "ACE_EntrenchingTool") then {
    _restingPlace = "Land_Grave_dirt_F";
    _restingPlaceIsGrave = _restingPlace == "Land_Grave_dirt_F";
};
if (_alive && {!GVAR(allowGraveUnconscious) && {_restingPlaceIsGrave}}) exitWith {
    [LSTRING(bodybagWhileStillAlive)] call EFUNC(common,displayTextStructured);
};

if (!local _patient) exitWith {
    TRACE_1("Calling where local",local _patient);
    [QGVAR(placeInGrave), [nil, _patient], _patient] call CBA_fnc_targetEvent;
};

if (alive _patient) then {
    TRACE_1("Manually killing with setDead",_patient);
    [_patient, "buried_alive", _medic] call EFUNC(medical_status,setDead);
};

private _position = getPosASL _patient;
if (_restingPlaceIsBodyBag) then {
    //Body bag needs to be a little higher than grave
    _position = _position vectorAdd [0, 0, 0.2];
};

private _headPos = _patient modelToWorldVisual (_patient selectionPosition "head");
private _spinePos = _patient modelToWorldVisual (_patient selectionPosition "Spine3");
private _direction = (_headPos vectorFromTo _spinePos) call CBA_fnc_vectDir;
if (_restingPlaceIsGrave) then {
    _direction = _direction + 90;
};

// Move the body away so it won't collide with the body bag object
// This setPosASL seems to need to be called where the unit is local
_patient setPosASL [-5000, -5000, 0];

// Create the body bag object, set its position to prevent it from flipping
private _bodyBag = createVehicle [_restingPlace, [0, 0, 0], [], 0, "NONE"];
_bodyBag setPosASL _position;
_bodyBag setDir _direction;

// Server will handle hiding and deleting the body
//keep event name as body bag only to avoid breaking things for others
["ace_placedInBodyBag", [_patient, _bodyBag]] call CBA_fnc_globalEvent;
