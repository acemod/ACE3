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
#include "script_component.hpp"

params ["_posX","_posY","_posZ"];
TRACE_3("Params",_posX,_posY,_posZ);

private _flare = "ACE_TripFlare_FlareEffect" createVehicle [_posX,_posY,_posZ];

TRACE_1("",_flare);

nil
