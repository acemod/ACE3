#include "script_component.hpp"
/*
 * Author: commy2
 * Check if the given backpack is an actual backpack that can store items. Parachute, static weapon packs, etc. will return false.
 *
 * Arguments:
 * 0: Backpack <OBJECT, STRING>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [bob] call ace_backpacks_fnc_isBackpack
 *
 * Public: Yes
 */

params [["_backpack", objNull, [objNull, ""]]];

private _config = if (_backpack isEqualType objNull) then {
    configOf _backpack
} else {
    configFile >> "CfgVehicles" >> _backpack
};

getText (_config >> "vehicleClass") == "backpacks" && {getNumber (_config >> "maximumLoad") > 0} // return
