#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Checks if a unit can interact with the vehicle crew inside.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * Unit can interact with vehicle crew <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_interaction_fnc_canInteractWithVehicleCrew
 *
 * Public: No
 */

params ["_player", "_vehicle"];

private _sidePlayer = side _player;

((crew _vehicle) select {_x != _player && {!unitIsUAV _x}}) findIf { // ignore player and UAV units
    // Units must all be unconscious, captive or friendly (side group is used in case unit is captive/unconscious) for actions to show up
    !captive _x && {lifeState _x in ["HEALTHY", "INJURED"]} && {[_sidePlayer, side group _x] call BIS_fnc_sideIsEnemy}
} == -1
