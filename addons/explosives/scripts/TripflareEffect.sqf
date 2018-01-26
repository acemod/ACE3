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

// This is called from a CfgCloudlet's beforeDestroyScript config.
// It will be re-compiled each use, so avoid complex preProcessor includes and just call the prepared function.

[ace_explosives_fnc_spawnFlare, _this] call CBA_fnc_directCall;
