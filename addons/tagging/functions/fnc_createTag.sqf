/*
 * Author: BaerMitUmlaut and esteldunedain
 * Creates a tag and handle its destruction. Only execute on the server.
 *
 * Arguments:
 * 0: Position ASL <ARRAY>
 * 1: Vector dir and up <ARRAY>
 * 2: Colour of the tag (valid colours are black, red, green and blue) <STRING>
 * 3: Object it should be tied too <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [positionASL, vectorDirAndUp, "black", object] call ace_tagging_fnc_createTag
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_tagPosASL", "_vectorDirAndUp", "_color", "_object"];
TRACE_4("createTag:", _tagPosASL, _vectorDirAndUp, _color, _object);

if !((toLower _color) in ["black", "red", "green", "blue"]) exitWith {
    ACE_LOGERROR_1("%1 is not a valid tag colour.", _color);
};

private _tag = "UserTexture1m_F" createVehicle [0,0,0];
_tag setObjectTextureGlobal [0, '\z\ace\addons\tagging\UI\tags\' + _color + '\' + str (floor (random 3)) + '.paa'];
_tag setPosASL _tagPosASL;
_tag setVectorDirAndUp _vectorDirAndUp;

if (isNull _object) exitWith {};

// If the tag is applied to an object, handle its destruction
_object setVariable [QGVAR(testVar), true];
if (_object getVariable [QGVAR(testVar), false]) then {
    // The object supports variables and hence HandleDamage too
    // Use the cheaper alternative for handling destruction: HandleDamage

    // If the object already has tags attached, just add the new one to the list
    private _attachedTags = _object getVariable QGVAR(attachedTags);
    if !(isNil  "_attachedTags ") exitWith {
        _attachedTags pushBack _tag;
    };

    _attachedTags = [_tag];
    _object setVariable [QGVAR(attachedTags), _attachedTags];

    // If it's the first tag attached to that object, add a handledamage event handler
    _object addEventHandler ["HandleDamage", {
        params ["_object", "_selection", "_damage"];
        if (_selection == "" && _damage >= 1) then {
            {
                deleteVehicle _x;
            } foreach (_object getVariable [QGVAR(attachedTags), []]);
            _object setVariable [QGVAR(attachedTags), []];
        };
    }];
};

// Periodic test the tag:
// - For object that don't support handledamage
// - For object that do, to support doors opening/closing, etc
GVAR(tagsToTest) pushBack [_tag, _tagPosASL, _vectorDirAndUp];

// Run the test
if (!GVAR(testingThread)) then {
    call FUNC(tagTestingThread);
};
