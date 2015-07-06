#include "script_component.hpp"
private ["_touchingPoints", "_pointCloser", "_pointFurther", "_posCheckCloser", "_posCheckFurther", "_touchingPoint", "_tag"];

_touchingPoints = [];

// _sphere1 = "Sign_Sphere10cm_F" createVehicle [0,0,0];
// _sphere2 = "Sign_Sphere10cm_F" createVehicle [0,0,0];

{
	//When tagWall is called, we already know there is an object within 2m in front of us.
	//We define two points (or rather distances from the player) where the wall is always in between.

	_pointCloser = 0;
	_pointFurther = 2;

	for "_i" from 0 to 6 do {

		//We need to reduce the distance between those points until we get a very precise position.
		//This is done by checking if it is between the closer point and the point in between the two.

		_posCheckCloser = ACE_player modelToWorldVisual [_x, _pointCloser, 0];
		_posCheckCloser set [2, (eyePos ACE_player) select 2];

		_posCheckFurther = ACE_player modelToWorldVisual [_x, (_pointCloser + ((_pointFurther - _pointCloser) / 2)), 0];
		_posCheckFurther set [2, (eyePos ACE_player) select 2];

		// _sphere1 setPosASL (_posCheckCloser);
		// _sphere2 setPosASL (_posCheckFurther);
		// sleep 0.5;

		if (lineIntersects [_posCheckCloser, _posCheckFurther, ACE_player, objNull]) then {
			//If it is, we move the further point to be closer to the closer point.
			_pointFurther = _pointCloser + ((_pointFurther - _pointCloser) / 2);
		} else {
			//If it isn't, we move the closer point towards the further point.
			_pointCloser = _pointCloser + ((_pointFurther - _pointCloser) / 2);
		};
	};

	//We do this 7 times each a bit to the left and right of the player - that's by definitely precise enough.
	_touchingPoint = ACE_player modelToWorldVisual [_x, _pointCloser, 0];
	_touchingPoint set [2, (eyePos ACE_player) select 2];
	_touchingPoints pushBack (_touchingPoint);

} foreach [-0.5, 0.5];

_tag = ("ACE_tagWall" + str (floor (random 5))) createVehicle [0,0,0];
_tag setPosASL (((_touchingPoints select 0) vectorAdd (_touchingPoints select 1)) vectorMultiply 0.5);
_tag setDir ((_touchingPoints call BIS_fnc_dirTo) - 90);

// deleteVehicle _sphere1;
// deleteVehicle _sphere2;