/*
 * Author: VKing
 * Spawns a flare on the ground for tripflare trigger
 *
 * Arguments:
 * 0: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * beforeDestroyScript = "\z\ace\addons\explosives\scripts\TripflareEffect.sqf;
 *
 * Public: no
 */

//This needs to be a script file, so it will be re-compiled each use.
//Avoid complex preProcessor includes and just call the prepared function.
 
_this call ace_explosives_fnc_spawnFlare;
