/*
 * Author: Glowbal, KoffeinFlummi
 * Increase the Heart Rate of a local unit by given number within given amount of seconds.
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: value <NUMBER>
 * 2: ACE_time in seconds <NUMBER>
 * 3: callback <CODE>
 *
 * Return Value:
 * nil
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_unit", "_value", "_time", "_adjustment", "_callBack"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_value = [_this, 1, 0, [0]] call BIS_fnc_Param;
_time = [_this, 2, 1, [0]] call BIS_fnc_Param;
_callBack = [_this, 3, {}, [{}]] call BIS_fnc_Param;

_adjustment = _unit getvariable [QGVAR(heartRateAdjustments), []];
_adjustment pushback [_value, _time, _callBack];
_unit setvariable [QGVAR(heartRateAdjustments), _adjustment ];
["Medical_onHeartRateAdjustmentAdded", [_unit, _value, _time]] call ace_common_fnc_localEvent;
