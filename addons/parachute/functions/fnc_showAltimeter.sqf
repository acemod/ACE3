#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Displays the altimeter on screen.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ACE_Parachute_fnc_showAltimeter
 *
 * Public: Yes
 */

params ["_unit"];

"ACE_Altimeter" cutRsc ["ACE_Altimeter", "PLAIN", 0, true];
if (isNull (uiNamespace getVariable ["ACE_Altimeter", displayNull])) exitWith {};

GVAR(AltimeterActive) = true;

private _display = uiNamespace getVariable ["ACE_Altimeter", displayNull];
private _HeightText = _display displayCtrl 1100;
private _DecendRate = _display displayCtrl 1000;
private _TimeText = _display displayCtrl 1001;

[{
    _this params ["_args", "_pfhID"];
    _args params ["_unit", "_oldHeight", "_prevTime", "_HeightText", "_DecendRate", "_TimeText"];

    if !(GVAR(AltimeterActive)) exitWith {
        _pfhID call CBA_fnc_removePerFrameEventHandler;
    };

    if !("ACE_Altimeter" in assignedItems _unit) exitWith {
        call FUNC(hideAltimeter);
        _pfhID call CBA_fnc_removePerFrameEventHandler;
    };

    private _hour = floor daytime;
    private _minute = floor ((daytime - _hour) * 60);
    private _curTime = CBA_missionTime;
    private _timeDiff = _curTime - _prevTime;

    private _height = ((getPosASL _unit) select 2) + EGVAR(common,mapAltitude);
    private _descentRate = if (_timeDiff > 0) then {
        floor((_oldHeight - _height) / _timeDiff)
    } else {
        0
    };

    _TimeText ctrlSetText (format ["%1:%2", [_hour, 2] call CBA_fnc_formatNumber, [_minute, 2] call CBA_fnc_formatNumber]);
    _HeightText ctrlSetText (format ["%1", floor _height]);
    _DecendRate ctrlSetText (format ["%1", _descentRate max 0]);

    (_this select 0) set [1, _height];
    (_this select 0) set [2, _curTime];
}, 0.2, [
    _unit,
    floor ((getPosASL _unit) select 2),
    CBA_missionTime,
    _HeightText,
    _DecendRate,
    _TimeText
]] call CBA_fnc_addPerFrameHandler;
