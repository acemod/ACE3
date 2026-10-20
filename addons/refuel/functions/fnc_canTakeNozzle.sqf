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
 * [player, cursorObject] call ace_refuel_fnc_canTakeNozzle
 *
 * Public: No
 */

params ["_unit", "_object"];

(alive _unit) &&
{_unit isKindOf "CAManBase"} &&
{alive _object} &&
{isNull (_unit getVariable [QGVAR(nozzle), objNull])} && // Not already carrying a nozzle
{[_unit, _object, [INTERACT_EXCEPTIONS]] call EFUNC(common,canInteractWith)} && // Not carried by someone else
{!(_object getVariable [QGVAR(isConnected), false])} &&
{!(_unit getVariable [QGVAR(isRefueling), false])} &&
{typeOf _object isEqualTo QGVAR(fuelNozzle) ||
    {
        if (_object getVariable [QGVAR(jerryCan), false]) then {
            // Prevent jerry cans from being picked up if they have a nozzle connected
            isNull (_object getVariable [QGVAR(nozzle), objNull])
        } else {
            // Make sure fuel source is close enough
            private _attachPos = _object getVariable [QGVAR(hooks), getArray (configOf _object >> QGVAR(hooks))];

            if (_attachPos isEqualTo []) then {
                _attachPos = [[0, 0, 0]];
            };

            private _distance = if (count _attachPos == 1) then {
                _unit distance (_object modelToWorld (_attachPos select 0))
            } else {
                // Select closest hook
                selectMin (_attachPos apply {_unit distance (_object modelToWorld _x)})
            };

        	(_object getVariable [QGVAR(hoseLength), GVAR(hoseLength)]) >= _distance
        }
    }
} // return
