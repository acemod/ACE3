#include "script_component.hpp"
/*
 * Author: Glowbal
 * Disables the mine detector
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: detecter type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [UNIT, DETECTOR_CLASS_NAME] call ace_minedetector_fnc_disableDetector
 *
 * Public: No
 */

params ["_unit", "_detectorType"];

if !(local _unit) then {
    [QGVAR(disableDetector), [_unit, _detectorType], _unit] call CBA_fnc_targetEvent;
};

_unit setVariable [format[QGVAR(enable_%1), _detectorType], false, true];

if (_unit == ACE_player && {alive _unit}) then {
    playSound "ACE_Sound_Click";
};

[QGVAR(detectorDisabled), [_unit, _detectorType]] call CBA_fnc_localEvent;
