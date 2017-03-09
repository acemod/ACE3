/*
 * Author: bux, PabstMirror
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Fire Pos ASL <ARRAY>
 * 2: Artiller Magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_targetASL", "_artilleryMag"];
TRACE_4("moduleSuppressiveFireLocal",_unit,local _unit,_targetASL,_artilleryMag);

private _bursts = if (_artilleryMag == "") then {11} else {4};

[{
    params ["_unit", "_burstsLeft", "_nextRun", "_targetASL", "_artilleryMag"];
    if (!alive _unit) exitWith {true};
    if (CBA_missionTime >= _nextRun) then {
        _burstsLeft = _burstsLeft - 1;
        _this set [1, _burstsLeft];
        if (_artilleryMag == "") then {
            _unit doSuppressiveFire _targetASL;
            TRACE_2("doSuppressiveFire",_unit,_targetASL);
            _this set [2, _nextRun + 4];
        } else {
            (vehicle _unit) doArtilleryFire [ASLtoAGL _targetASL, _artilleryMag, 1]; // note, using value greater than 1 does not always work
            TRACE_3("doArtilleryFire",_unit,_targetASL,_artilleryMag);
            _this set [2, _nextRun + 7];
        };
    };
    (_burstsLeft <= 0)
}, {
    TRACE_1("Done",_this);
}, [_unit, _bursts, CBA_missionTime, _targetASL, _artilleryMag]] call CBA_fnc_waitUntilAndExecute;

