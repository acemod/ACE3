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
 * [getPos groundFlare] call ace_explosives_fnc_spawnFlare
 *
 * Public: no
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_posX","_posY","_posZ"];
TRACE_3("Params",_posX,_posY,_posZ);

"F_40mm_White" createVehicle [_posX,_posY,_posZ];
