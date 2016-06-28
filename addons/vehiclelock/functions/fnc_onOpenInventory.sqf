/*
 * Author: PabstMirror
 * Handles the inventory opening.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Container <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, car] call ACE_VehicleLock_fnc_onOpenInventory;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_container"];
TRACE_2("params",_unit,_container);

//Only check for player:
if (_unit != ace_player) exitWith {};

if (GVAR(LockVehicleInventory) && //if setting not enabled
        {(vehicle ace_player) == ace_player} && //Player dismounted
        {(_container isKindOf "Car") || (_container isKindOf "Tank") || (_container isKindOf "Helicopter")} && //container is a lockable veh
        {(locked _container) in [2,3]} && //Vehicle is locked
        {!([ace_player, _container] call FUNC(hasKeyForVehicle))} //player doesn't have key
        ) then {
    //Give feedback that vehicle is locked
    playSound "ACE_Sound_Click";

    //For compatibiltiy with ACRE, wait until the display is open, close it and then reopen the player's own inventory
    //ref: http://gitlab.idi-systems.com/idi-systems/acre2-public/issues/70
    [{
        !isNull (findDisplay 602)
    },
    {
        TRACE_1("car display open: closing", _this);
        (findDisplay 602) closeDisplay 0;
        [{
            TRACE_1("Opening Player Inventory", _this);
            ACE_player action ["Gear", objNull]
        }, []] call CBA_fnc_execNextFrame;
    },
    []] call CBA_fnc_waitUntilAndExecute;
};
