/*
 * Author: BaerMitUmlaut
 * Creates a tag on a wall that is on the closest surface within 2m on front of the player.
 *
 * Arguments:
 * 0: The colour of the tag (valid colours are black, red, green and blue) <STRING>
 * 
 * Return Value:
 * None
 *
 * Example:
 * ["blue"] call ace_tagging_fnc_tagWall
 *
 * Public: No
 */


#include "script_component.hpp"
private ["_posIntersect"];

params ["_color"];
if !((toLower _color) in ["black", "red", "green", "blue"]) exitWith {
    ["%1 is not a valid tag colour.", _color] call BIS_fnc_error;
};

_posIntersect = ACE_player modelToWorldVisual [0, 2, 0];
_posIntersect set [2, (eyepos ACE_player) select 2];
((lineIntersectsSurfaces [eyepos ACE_player, _posIntersect, ACE_player, objNull, true, 1, "FIRE", "GEOM"]) select 0) params ["_touchingPoint", "_surfaceNormal", "", "_object"];

ACE_player playActionNow "PutDown";

[{
    private ["_tag"];
    params ["_touchingPoint", "_surfaceNormal", "_color", "_object"];

    playSound3D [QUOTE(PATHTO_R(sounds\spray.ogg)), ACE_player, false, (eyePos ACE_player), 10, 1, 15];

    _tag = "UserTexture1m_F" createVehicle [0,0,0];
    _tag setObjectTextureGlobal [0, '\z\ace\addons\tagging\UI\tags\' + _color + '\' + str (floor (random 3)) + '.paa'];
    //Add 6cm so it doesn't get placed "into" the wall.
    //6cm works with most building surfaces, but not with all of them. The LODs precision varies between 1cm and around 8cm+.
    _tag setPosASL (_touchingPoint vectorAdd (_surfaceNormal vectorMultiply 0.06));
    _tag setVectorDirAndUp [(_surfaceNormal vectorMultiply -1), [0,0,1]];

    [[_tag, _object], QUOTE(FUNC(handleTagDestruction)), 1] call EFUNC(common,execRemoteFnc);
}, [_touchingPoint, _surfaceNormal, _color, _object], 0.6] call EFUNC(common,waitAndExecute);