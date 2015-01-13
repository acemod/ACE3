/**
 * fn_broadcastSound3D_f.sqf
 * @Descr: Plays a sound in 3D
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, sound STRING]
 * @Return: void
 * @PublicAPI: true
 */



if (isDedicated) exitwith{};
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;
_sound = [_this, 1, "",[""]] call BIS_fnc_Param;
_unit say3D _sound;