#include "script_component.hpp"
/*
 * Author: Killerswin2
 * Picks up fuel bottle
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: fuel bottle <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ACE_Fuel_Bottle_Object] call ace_refuel_pickupFuelBottle
 *
 * Public: No
 */

params["_unit","_fuelBottle"];


// check fuel bottle
private _fuelAmount = [_fuelBottle] call FUNC(getFuel);
if(_fuelAmount isNotEqualTo 1) exitWith {
	[LSTRING(Fuel_Bottle_Not_Full)] call EFUNC(common,displayTextStructured);
};

//delete object and add item to inventory
[{
    params ["_unit", "_fuelBottle"];

    if (isNull _fuelBottle) exitWith {};

    deleteVehicle _fuelBottle;

    [_unit, QGVAR(Fuel_Bottle_Item)] call EFUNC(common,addToInventory);
}, [_unit, _fuelBottle], 1] call CBA_fnc_waitAndExecute;
