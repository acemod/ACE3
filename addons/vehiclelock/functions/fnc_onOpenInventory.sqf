/*
 * Author: PabstMirror
 * Handles the inventory opening.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Container <OBJECT>
 *
 * Return Value:
 * Handeled <BOOL>
 *
 * Example:
 * [player, car] call ACE_VehicleLock_fnc_onOpenInventory;
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_container);

//Only check for player:
if (_unit != ace_player) exitWith {false};

private "_handeled";
_handeled = false;

if (GVAR(LockVehicleInventory) && //if setting not enabled
        {(vehicle ace_player) == ace_player} && //Player dismounted
        {(_container isKindOf "Car") || (_container isKindOf "Tank") || (_container isKindOf "Helicopter")} && //container is a lockable veh
        {(locked _container) in [2,3]} && //Vehicle is locked
        {!([ace_player, _container] call FUNC(hasKeyForVehicle))} //player doesn't have key
        ) then {
    //Give feedback that vehicle is locked
    playSound "ACE_Sound_Click";
    //don't open the vehicles inventory
    _handeled = true;
    //Just opens a dummy groundContainer (so the player can still see their own inventory)
    ACE_player action ["Gear", objNull];
};

_handeled
