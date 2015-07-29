/*
 * Author: Garth 'L-H' de Wet, SilentSpike
 * Turns 0-1 damage of explosion Event into a rating system of 0-3
 *
 * Arguments:
 * 0: The amount of damage <NUMBER>
 *
 * Return Value:
 * The rating [0-3] <NUMBER>
 *
 * Example:
 * [0.05] call ace_goggles_fnc_getExplosionIndex;
 *
 * Public: No
 */

params [["_damage",0,[0]]];

floor (linearConversion [0,0.1,_damage,0,3,true]);

