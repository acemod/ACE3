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

// Kill the PFH if script moves player out of chute
if (
    isNull player ||
    {isTouchingGround _player} ||
    {!((vehicle _player) isKindOf "ParachuteBase")}
) exitWith {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
    GVAR(PFH) = false;
};

private _pos = getPosASL (vehicle _player);

// On landing, reset the cut chute and PFH variables
if ((lineIntersects [_pos, _pos vectorAdd [0,0,-0.5], vehicle _player, _player]) || {((ASLtoATL _pos) select 2) < 0.75}) then {
    [_this select 1] call CBA_fnc_removePerFrameHandler;

    GVAR(PFH) = false;
    _unit setVariable [QGVAR(chuteIsCut), false, true];
};
