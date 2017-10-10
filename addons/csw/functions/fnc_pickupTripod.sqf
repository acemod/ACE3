/*
 * Author: TCVM
 * Picks up the tripod and adds it to the player launcher slot
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tripod, player] call ace_csw_fnc_pickupTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params["_tripod", "_player"];

deleteVehicle _tripod;

(_player select 1) addWeaponGlobal QGVAR(carryTripod);
[(_player select 1), "PutDown"] call EFUNC(common,doGesture);