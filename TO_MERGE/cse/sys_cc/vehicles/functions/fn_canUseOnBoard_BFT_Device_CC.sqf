/**
 * fn_canUseOnBoard_BFT_Device_CC.sqf
 * @Descr: Check if unit can use on board BFT device from given vehicle.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, vehicle OBJECT]
 * @Return: BOOL True if unit can use on Board BFT Device from vehicle
 * @PublicAPI: true
 */

private ["_unit", "_vehicle", "_info"];
_unit = _this select 0;
_vehicle = _this select 1;

if (_vehicle isKindOf "CAManBase") exitwith {false};
if !([_unit] call cse_fnc_canInteract) exitwith {false};
if !([_vehicle] call cse_fnc_hasFlightDisplay_CC) exitwith {false};
if !(isEngineOn _vehicle) exitwith {false};

(vehicle _unit == _vehicle && {!(_unit in assignedCargo _vehicle)});