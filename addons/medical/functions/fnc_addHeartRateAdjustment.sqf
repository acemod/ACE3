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
 * Public: Yes
 */

#include "script_component.hpp"


params [["_unit", objNull, [objNull]], ["_value", 0, [0]], ["_time", 1, [0]], ["_callBack", {}, [{}]]];

_adjustment = _unit getvariable [QGVAR(heartRateAdjustments), []];
_adjustment pushBack [_value, _time, _callBack];
_unit setvariable [QGVAR(heartRateAdjustments), _adjustment ];
["Medical_onHeartRateAdjustmentAdded", [_unit, _value, _time]] call EFUNC(common,localEvent);
