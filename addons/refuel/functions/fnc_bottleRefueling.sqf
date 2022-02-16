#include "script_component.hpp"
/*
 * Author: Killerswin2
 * Picks up fuel bottle
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: fuel bottle class <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ACE_Fuel_Bottle_Item] call ace_refuel_bottleRefueling
 *
 * Public: No
 */

params["_unit","_fuelBottleItem"];



//remove item
_unit removeItem _fuelBottleItem;



[{
    params ["_unit"];

	//tripod placement code
	private _direction = getDir _unit;
	private _positionNearPlayer = getPosATL _unit vectorAdd [0.8 * sin _direction, 0.8 * cos _direction, 0.0];

	private _fuelBottle = "ACE_Fuel_Bottle" createVehicle [0, 0, 0];

	//move near player
	_fuelBottle setDir _direction;
	_fuelBottle setPosATL _positionNearPlayer;

	//create jerryCan
	[_fuelBottle, 1] call FUNC(makeJerryCan);

}, [_unit], 1] call CBA_fnc_waitAndExecute;
