/*
 * Author: Garth 'L-H' de Wet
 * Checks whether the unit should preform landing.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_Parachute_fnc_onEachFrame;
 *
 * Public: No
 */
#include "script_component.hpp"
private _player = ACE_player;
if (!GVAR(PFH)) exitWith {[(_this select 1)] call CALLSTACK(CBA_fnc_removePerFrameHandler);};
if (isNull _player) exitWith {[(_this select 1)] call CALLSTACK(CBA_fnc_removePerFrameHandler);GVAR(PFH) = false;};
if !((vehicle _player) isKindOf "ParachuteBase") exitWith {[(_this select 1)] call CALLSTACK(CBA_fnc_removePerFrameHandler);GVAR(PFH) = false;};
if (isTouchingGround _player) exitWith {[(_this select 1)] call CALLSTACK(CBA_fnc_removePerFrameHandler);GVAR(PFH) = false;};

private ["_pos"];
_pos = getPosASL (vehicle _player);

if ((lineIntersects [_pos, _pos vectorAdd [0,0,-0.5], vehicle _player, _player]) || {((ASLtoATL _pos) select 2) < 0.75}) then {
    [(_this select 1)] call CALLSTACK(CBA_fnc_removePerFrameHandler);
    GVAR(PFH) = false;
// I believe this will not work for Zeus units.
    deleteVehicle (vehicle _player);
    [_player] call FUNC(doLanding);
};
