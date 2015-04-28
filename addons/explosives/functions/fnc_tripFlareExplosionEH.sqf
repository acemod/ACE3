/*
 * Author: PabstMirror
 * Called when the defuse helper has a nearby explosion.
 * If it's attached to a trip flare class, then spawn the trip flare.
 *
 * Arguments:
 * 0: Defuse Helper <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [defuseHelper] call ace_explosives_fnc_tripFlareExplosionEH
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_defuseHelper);

private ["_explosive"];

//this seems to only fire on local, but just to be sure:
if (!local _defuseHelper) exitWith {};

_explosive = _defuseHelper getVariable [QGVAR(Explosive), objNull];
//Only explode if _explosive still exists and it took "lethal" damage
//So we know the ExplosionEH was triggered by the mine exploding
if ((isNull _explosive) || {(damage _explosive) < 1}) exitWith {};

//Only do stuff it's a trip flare
if (typeOf _explosive != "ACE_APERSTripFlare_Wire_Ammo") exitWith {};

TRACE_2("TripFlare Triggered",_defuseHelper,_explosive);

_flare = "ACE_TripFlare_FlareEffect" createVehicle (getpos _defuseHelper);

_flare setPosASL ((_defuseHelper modelToWorld [2, 0, 0]) call EFUNC(common,positionToASL));
