/**
 * fn_playGesture.sqf
 * @Descr: Plays a gesture and executes orders for group AI, if setting has been enabled.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that plays the gesture), gesture STRING (Classname of the gesture animation being played)]
 * @Return: void
 * @PublicAPI: true
 */


private ["_unit", "_gesture", "_groupUnits"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_gesture = [_this, 1, "", [""]] call BIS_fnc_Param;


_unit playactionnow _gesture;
_groupUnits = units group _unit;

if (leader (group _unit) == _unit && CSE_SYS_GESTURES_ALLOW_AI_CONTROL) then {
	switch (_gesture) do {
		case ("gestureCeaseFire"): {
		};
		case ("gestureCover"): {
		};
		case ("gestureFreeze"): {
			{_x stop true;} count _groupUnits;
		};
		case ("gestureFollow"): {
			{_x dofollow _unit;} count _groupUnits;
		};
		case ("gestureGo"):	{
			{_x stop false;} count _groupUnits;
		};
		case ("gesturePoint"): {
		};
	};
};
/*
_unit setvariable ["cse_playGesture_GRP", _gesture, true];
_handle = _this spawn {
	uisleep 3;
	if (((_this select 0) getvariable ["cse_playGesture_GRP", ""]) == (_this select 1)) then {
		(_this select 0) setvariable ["cse_playGesture_GRP", nil, true];
	};
};
*/