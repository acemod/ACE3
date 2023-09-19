#include "script_component.hpp"
/*
 * Author: veteran29
 * Handle placement of bike mine object.
 *
 * Arguments:
 * 0: Bike mine <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bikeMine] call ace_compat_sog_fnc_handleBikeMinePlace
 *
 * Public: No
 */

params ["_mine"];

if (!local _mine) exitWith {};

// change COM to have the bike upright like the placed mine
_mine setCenterOfMass [0,0, -0.5];

// prevent the object from swinging left and right
[{isTouchingGround _this}, {
    _this setVelocity [0,0,0]
}, _mine, 3]  call CBA_fnc_waitUntilAndExecute;
