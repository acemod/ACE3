/*
 * Author: bux, PabstMirror
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fire Pos ASL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_targetASL"];
TRACE_3("moduleSuppressiveFireLocal",_unit,local _unit,_targetASL);

[{
    params ["_unit", "_burstsLeft", "_nextRun", "_targetASL"];
    if (!alive _unit) exitWith {true};
    if (CBA_missionTime >= _nextRun) then {
        _burstsLeft = _burstsLeft - 1;
        _this set [1, _burstsLeft];
        _this set [2, _nextRun + 4];
        _unit doSuppressiveFire _targetASL;
        TRACE_2("doSuppressiveFire",_unit,_targetASL);
    };
    (_burstsLeft <= 0)
}, {
    TRACE_1("Done",_this);
}, [_unit, (40/4), CBA_missionTime, _targetASL]] call CBA_fnc_waitUntilAndExecute; // 40 seconds total
