/*
 * Author: BaerMitUmlaut
 * Creates a tag on a wall that is within 2m on front of the player.
 *
 * Arguments:
 * 0: The colour of the tag (valid colours are black, red, green and blue) <STRING>
 * 
 * Return Value:
 * None
 *
 * Example:
 * ["blue"] call ace_tagging_fnc_tagGround
 *
 * Public: No
 */


#include "script_component.hpp"
private ["_color", "_tagPos", "_groundPos", "_vectorDirAndUp"];

PARAMS_1(_color);
if !((toLower _color) in ["black", "red", "green", "blue"]) exitWith {
    ["%1 is not a valid tag colour.", _color] call BIS_fnc_error;
};

_tagPos = player modelToWorld [0, 1.2, 0];
_vectorDirAndUp = [];

_groundPos = getPosATL ACE_player;
_groundPos set [2, 0];

//Check if we're in or on top of some object
if (lineIntersects [getPosASL ACE_player, ATLToASL _groundPos, ACE_player, objNull]) then {
    _tagPos set [2, (getPosATL ACE_player) select 2];
    _vectorDirAndUp = [[0,0,-1], vectorDir ACE_player];
} else {
    _tagPos set [2, 0];
    _vectorDirAndUp = [(surfaceNormal _tagPos) vectorMultiply -1, vectorDir ACE_player];
};

ACE_player playActionNow "PutDown";

[{
    private ["_tag"];
    playSound3D [QUOTE(PATHTO_R(sounds\spray.ogg)), ACE_player, false, (getPosASL ACE_player), 10, 1, 15];
    _tag = "UserTexture1m_F" createVehicle [0,0,0];
    _tag setObjectTextureGlobal [0, '\z\ace\addons\tagging\UI\tags\' + (_this select 2) + '\' + str (floor (random 3)) + '.paa'];
    _tag setPosATL (_this select 0);
    _tag setVectorDirAndUp (_this select 1);
}, [_tagPos, _vectorDirAndUp, _color], 0.6] call EFUNC(common,waitAndExecute);