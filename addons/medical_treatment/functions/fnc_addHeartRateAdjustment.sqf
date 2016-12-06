/*
 * Author: Glowbal, KoffeinFlummi
 * Increase the heart rate target of a local unit by given number during the given amount of seconds.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: value <NUMBER>
 * 2: time until max. effect (seconds) <NUMBER>
 * 3: time in system (seconds) <NUMBER>
 * 4: callback <CODE>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_value", 0, [0]], ["_timeTillMaxEffect", 1, [0]], ["_timeInSystem", 1, [0]], ["_callBack", {}, [{}]]];

private _adjustment = _unit getVariable [QEGVAR(medical,heartRateAdjustments), []];
_adjustment pushBack [_value, _timeTillMaxEffect, _timeInSystem, 0, _callBack];
_unit setVariable [QEGVAR(medical,heartRateAdjustments), _adjustment];

["ace_heartRateAdjustmentAdded", [_unit, _value, _time]] call CBA_fnc_localEvent;
