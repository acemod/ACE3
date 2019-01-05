#include "script_component.hpp"
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
 * Example:
 * [bob, [5, 6, 7], "bigmagazine"] call ace_zeus_fnc_moduleSuppressiveFireLocal
 *
 * Public: No
 */

params ["_unit", "_targetASL", "_artilleryMag"];
TRACE_4("moduleSuppressiveFireLocal",_unit,local _unit,_targetASL,_artilleryMag);

if (_artilleryMag != "") exitWith {
    (vehicle _unit) doArtilleryFire [ASLtoAGL _targetASL, _artilleryMag, 4];
    TRACE_3("doArtilleryFire",_unit,_targetASL,_artilleryMag);
};

[{
    params ["_unit", "_burstsLeft", "_nextRun", "_targetASL", "_artilleryMag"];
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
}, [_unit, 11, CBA_missionTime, _targetASL, _artilleryMag]] call CBA_fnc_waitUntilAndExecute;

