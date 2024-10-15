#include "..\script_component.hpp"
/*
 * Author: VKing, MikeMF
 * Spawns a flare for tripflare trigger
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

params ["_posX","_posY","_posZ"];
TRACE_3("Params",_posX,_posY,_posZ);

if (GVAR(tripFlareAirMode)) then {
    _posZ = _posZ + 200;
};

private _flareClass = ["F_40mm_White", "F_40mm_Red", "F_40mm_Green"] select GVAR(tripflareColour);
private _flare = createVehicle [_flareClass, [_posX, _posY, _posZ], [], 0, "CAN_COLLIDE"];
_flare setVelocity [0, 0, -1]; // Used for air mode, does nothing if already on the ground.

TRACE_1("",_flare);

["ace_tripflareTriggered", [_flare, [_posX,_posY,_posZ]]] call CBA_fnc_globalEvent;
