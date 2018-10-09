#include "script_component.hpp"
/*
 * Author: Glowbal, KoffeinFlummi
 * Increase the Heart Rate of a local unit by given number within given amount of seconds.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: value <NUMBER>
 * 2: time in seconds <NUMBER>
 * 3: callback <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 1, 5, {callback}] call ace_medical_fnc_addHeartRateAdjustment
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_value", 0, [0]], ["_time", 1, [0]], ["_callBack", {}, [{}]]];

private _adjustment = _unit getVariable [QGVAR(heartRateAdjustments), []];
_adjustment pushBack [_value, _time, _callBack];
_unit setVariable [QGVAR(heartRateAdjustments), _adjustment];

["ace_heartRateAdjustmentAdded", [_unit, _value, _time]] call CBA_fnc_localEvent;
