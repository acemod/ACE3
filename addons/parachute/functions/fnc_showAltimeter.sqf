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
#include "script_component.hpp"

params ["_unit"];

"ACE_Altimeter" cutRsc ["ACE_Altimeter", "PLAIN", 0, true];
if (isNull (uiNamespace getVariable ["ACE_Altimeter", displayNull])) exitWith {};

GVAR(AltimeterActive) = true;

[{
    if (!GVAR(AltimeterActive)) exitWith {[_this select 1] call CBA_fnc_removePerFrameEventHandler};
    disableSerialization;
    (_this select 0) params ["_display", "_unit", "_oldHeight", "_prevTime"];
    if !("ACE_Altimeter" in assignedItems _unit) exitWith {[_this select 1] call CBA_fnc_removePerFrameEventHandler; call FUNC(hideAltimeter)};

    private _HeightText = _display displayCtrl 1100;
    private _DecendRate = _display displayCtrl 1000;
    private _TimeText = _display displayCtrl 1001;

    private _hour = floor daytime;
    private _minute = floor ((daytime - _hour) * 60);

    private _height = ((getPosASL _unit) select 2) + EGVAR(common,mapAltitude);
    private _curTime = CBA_missionTime;
    private _timeDiff = _curTime - _prevTime;
    private _descentRate = if (_timeDiff > 0) then {floor((_oldHeight - _height) / _timeDiff)} else {0};

    _TimeText ctrlSetText (format ["%1:%2",[_hour, 2] call EFUNC(common,numberToDigitsString),[_minute, 2] call EFUNC(common,numberToDigitsString)]);
    _HeightText ctrlSetText (format ["%1", floor _height]);
    _DecendRate ctrlSetText (format ["%1", _descentRate max 0]);

    (_this select 0) set [2, _height];
    (_this select 0) set [3, _curTime];
}, 0.2, [uiNamespace getVariable ["ACE_Altimeter", displayNull], _unit, floor ((getPosASL _unit) select 2), CBA_missionTime]] call CBA_fnc_addPerFrameHandler;
