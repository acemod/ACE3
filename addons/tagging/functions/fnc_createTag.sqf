#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, esteldunedain, Zorn
 * Creates a tag and handle its destruction. Only execute on the server.
 *
 * Arguments:
 * 0: Position ASL <ARRAY>
 * 1: Vector dir and up <ARRAY>
 * 2: Color of the tag (valid colors are black, red, green and blue or full path to custom texture) <STRING>
 * 3: Object it should be tied to <OBJECT>
 * 4: Unit that created the tag <OBJECT>
 * 5: Material of the tag <STRING> (default: "")
 * 6: Model of the tag <STRING> (default: "ace_tagging_texture1m")
 * 7: Vehicle Tag <BOOL> (default: false)
 * 8: Sound <STRING or NIL> (default: nil)
 *
 * Return Value:
 * Tag created <BOOL>
 *
 * Example:
 * [positionASL, vectorDirAndUp, "z\ace\addons\tagging\UI\tags\black\0.paa", object] call ace_tagging_fnc_createTag
 *
 * Public: No
 */

params ["_tagPosASL", "_vectorDirAndUp", "_texture", "_object", "_unit", ["_material","",[""]], ["_tagModel", QGVAR(texture1m), [""]], ["_isVehicleTag", false, [false]], "_sound"];
TRACE_5("createTag:",_tagPosASL,_vectorDirAndUp,_texture,_object,_unit);

if (_texture == "") exitWith {
    ERROR_1("%1 is not a valid tag texture.",_texture);
    false
};

if (_isVehicleTag) exitWith {
    TRACE_3("tagging vehicle",_object,typeOf _object,_texture);
    _object setObjectTextureGlobal [getText (configOf _object >> "selectionClan"), _texture];
    _object setVariable [QGVAR(hasTag), true, true];
    ["ace_tagCreated", [objNull, _texture, _object, _unit]] call CBA_fnc_globalEvent;

    // Sound, use unit as soundsource
    if (!isNil "_sound") then { [ _unit, _sound, nil, false, false, RND_PITCH ] call CBA_fnc_globalSay3D; };

    true
};

// Create Tag Object
private _tag = createSimpleObject [_tagModel, _tagPosASL];
_tag setObjectTextureGlobal [0, _texture];
if (_material != "") then { _tag setObjectMaterialGlobal [0, _material] };
_tag setVectorDirAndUp _vectorDirAndUp;

// Sound, use tag object as sound source
if (!isNil "_sound") then { [ _tag, _sound, nil, false, false, RND_PITCH ] call CBA_fnc_globalSay3D; };

// Throw a global event for mission makers
["ace_tagCreated", [_tag, _texture, _object, _unit]] call CBA_fnc_globalEvent;

if (isNull _object) exitWith {true};

// If the tag is applied to an object, handle its destruction
_object setVariable [QGVAR(testVar), true];
if (_object getVariable [QGVAR(testVar), false]) then {
    // The object supports variables and hence HandleDamage too
    // Use the cheaper alternative for handling destruction: HandleDamage

    // If the object already has tags attached, just add the new one to the list
    private _attachedTags = _object getVariable QGVAR(attachedTags);
    if (!isNil "_attachedTags") exitWith {
        _attachedTags pushBack _tag;
    };

    _attachedTags = [_tag];
    _object setVariable [QGVAR(attachedTags), _attachedTags];

    // If it's the first tag attached to that object, add a handledamage event handler
    _object addEventHandler ["HandleDamage", {
        params ["_object", "_selection", "_damage"];
        if (_selection == "" && _damage >= 1) then {
            deleteVehicle (_object getVariable [QGVAR(attachedTags), []]);
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

true
