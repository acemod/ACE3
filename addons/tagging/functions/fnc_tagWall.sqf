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
 * ["blue"] call ace_tagging_fnc_tagWall
 *
 * Public: No
 */


#include "script_component.hpp"
private ["_color", "_eyepos", "_touchingPoints", "_pointCloser", "_pointFurther", "_posCheckCloser", "_posCheckFurther", "_touchingPoint"];

PARAMS_1(_color);
if !((toLower _color) in ["black", "red", "green", "blue"]) exitWith {
	["%1 is not a valid tag colour.", _color] call BIS_fnc_error;
};

//Cache eyepos in case player moves
_eyepos = eyePos ACE_player;
_touchingPoints = [];

{
	//When tagWall is called, we already know there is an object within 2m in front of us.
	//We define two points (or rather distances from the player) where the wall is always in between.

	_pointCloser = 0;
	_pointFurther = 2;

	for "_i" from 0 to 6 do {

		//We need to reduce the distance between those points until we get a very precise position.
		//This is done by checking if it is between the closer point and the point in between the two.

		_posCheckCloser = ACE_player modelToWorldVisual [_x, _pointCloser, 0];
		_posCheckCloser set [2, _eyepos select 2];

		_posCheckFurther = ACE_player modelToWorldVisual [_x, (_pointCloser + ((_pointFurther - _pointCloser) / 2)), 0];
		_posCheckFurther set [2, _eyepos select 2];

		if (lineIntersects [_posCheckCloser, _posCheckFurther, ACE_player, objNull]) then {
			//If it is, we move the further point to be closer to the closer point.
			_pointFurther = _pointCloser + ((_pointFurther - _pointCloser) / 2);
		} else {
			//If it isn't, we move the closer point towards the further point.
			_pointCloser = _pointCloser + ((_pointFurther - _pointCloser) / 2);
		};
	};

	//We do this 7 times each a bit to the left and right of the player - that's definitely precise enough.
	_touchingPoint = ACE_player modelToWorldVisual [_x, _pointCloser, 0];
	_touchingPoint set [2, _eyepos select 2];
	_touchingPoints pushBack (_touchingPoint);

} foreach [-0.5, 0.5];

ACE_player playActionNow "PutDown";

[{
	private ["_tag"];
	playSound3D [QUOTE(PATHTO_R(sounds\spray.ogg)), ACE_player, false, (getPosASL ACE_player), 10, 1, 15];
	_tag = "UserTexture1m_F" createVehicle [0,0,0];
	_tag setObjectTextureGlobal [0, '\z\ace\addons\tagging\UI\tags\' + (_this select 1) + '\' + str (floor (random 3)) + '.paa'];
	_tag setPosASL (((_this select 0 select 0) vectorAdd (_this select 0 select 1)) vectorMultiply 0.5);
	_tag setDir (((_this select 0) call BIS_fnc_dirTo) - 90);
}, [_touchingPoints, _color], 0.6] call EFUNC(common,waitAndExecute);