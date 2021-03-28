#include "script_component.hpp"
/*
 * Author: Glowbal
 * Enables the mine detector
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: detecter type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [UNIT, DETECTOR_CLASS_NAME] call ace_minedetector_fnc_enableDetector
 *
 * Public: No
 */

params ["_unit", "_detectorType"];

if !(local _unit) then {
    [QGVAR(enableDetector), [_unit, _detectorType], _unit] call CBA_fnc_targetEvent;
};

_unit setVariable [format[QGVAR(enable_%1), _detectorType], true, true];

if (_unit == ACE_player) then {
    playSound "ACE_Sound_Click";
};

[QGVAR(detectorEnabled), [_unit, _detectorType]] call CBA_fnc_localEvent;

private _config = [_detectorType] call FUNC(getDetectorConfig);
[FUNC(detectorLoop), 0.05, [_unit, _detectorType, _config, CBA_missionTime - 0.25]] call CBA_fnc_addPerFrameHandler;
