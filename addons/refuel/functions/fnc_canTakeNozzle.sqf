#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Check if a unit can take a fuel nozzle
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fuel Source or Nozzle <OBJECT>
 *
 * Return Value:
 * Can connect <BOOL>
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_canTakeNozzle
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_object", objNull, [objNull]]];

if (!alive _unit ||
    {!(_unit isKindOf "CAManBase")} ||
    {!local _unit} ||
    {!alive _object} ||
    {!isNull (_unit getVariable [QGVAR(nozzle), objNull])} || // Not already carrying a nozzle
    {
        if (_object getVariable [QGVAR(jerryCan), false]) then {
            // Prevent jerry cans from being picked up if they have a nozzle connected
            !isNull (_object getVariable [QGVAR(nozzle), objNull])
        } else {
            // Make sure fuel source is close enough
            private _source = _object getVariable [QGVAR(source), objNull];
        	(_source getVariable [QGVAR(hoseLength), GVAR(hoseLength)]) < _unit distance (_source modelToWorld (_object getVariable QGVAR(attachPos)))
        }
    } ||
    {!([_unit, _object, [INTERACT_EXCEPTIONS]] call EFUNC(common,canInteractWith))}) exitWith {false}; // Not carried by someone else

!(_object getVariable [QGVAR(isConnected), false]) && {!(_unit getVariable [QGVAR(isRefueling), false])}
