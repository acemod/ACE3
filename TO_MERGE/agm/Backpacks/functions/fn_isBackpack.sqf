/*
 * Author: commy2
 *
 * Check if the given backpack is an actual backpack that can store items. Parachute backpacks will return false for example.
 *
 * Argument:
 * 0: A backpack (Object or String)
 *
 * Return value:
 * Boolean (Bool)
 */

private ["_backpack", "_config"];

_backpack = _this select 0;

if (typeName _backpack == "OBJECT") then {
  _backpack = typeOf _backpack;
};

_config = configFile >> "CfgVehicles" >> _backpack;

getText (_config >> "vehicleClass") == "backpacks" && {getNumber (_config >> "maximumLoad") > 0}
