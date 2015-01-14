/**
 * fn_addHeartRateAdjustment_CMS.sqf
 * @Descr: Increase the Heart Rate of a local unit by given number within given amount of seconds.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT, value NUMBER, time NUMBER (Amount of seconds), callBack CODE (Called when adjustment is completed)]
 * @Return:	void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit", "_value", "_time", "_adjustment", "_callBack"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_Param;
_value = [_this, 1, 0, [0]] call BIS_fnc_Param;
_time = [_this, 2, 1, [0]] call BIS_fnc_Param;
_callBack = [_this, 3, {}, [{}]] call BIS_fnc_Param;

_adjustment = [_unit, QGVAR(heartRateAdjustments)] call EFUNC(common,getDefinedVariable);
_adjustment pushback [_value, _time, _callBack];
_unit setvariable [QGVAR(heartRateAdjustments), _adjustment ];