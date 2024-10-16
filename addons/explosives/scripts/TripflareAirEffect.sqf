/*
 * Author: VKing, MikeMF
 * Spawns a flare in the air for tripflare trigger
 *
 * Arguments:
 * 0: Position <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * beforeDestroyScript = "\z\ace\addons\explosives\scripts\TripflareAirEffect.sqf";
 *
 * Public: no
 */

// This is called from a CfgCloudlet's beforeDestroyScript config.
// It will be re-compiled each use, so avoid complex preProcessor includes and just call the prepared function.

_this set [2, ((_this select 2) + 200)];

[ace_explosives_fnc_spawnFlare, _this] call CBA_fnc_directCall;
