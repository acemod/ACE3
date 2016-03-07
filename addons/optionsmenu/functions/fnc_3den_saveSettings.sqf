/*
 * Author: PabstMirror
 * Saves settings when display closed (called on onUnLoad event)
 *
 * Arguments:
 * 0: Display <Display>
 * 1: Exit Code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display, 1] call ACE_optionsmenu_fnc_3den_saveSettings
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
params ["_display", "_exitCode"];
TRACE_2("params",_display,_exitCode);

if (isNull _display) exitWith {};
if (_exitCode != 1) exitWith {}; //Ignore cancel or escape

private _currentSavedSettings = QUOTE(ADDON) get3DENMissionAttribute "ACE_MissionSettings";
if (isNil "_currentSavedSettings") then { ACE_LOGERROR("_currentSavedSettings nil"); };

{
    private _varName = _x getVariable [QGVAR(varName), ""];
    if (_varName != "") then {

        private _check = _x controlsGroupCtrl 1000;
        if (cbChecked _check) then {

            private _value = _x controlsGroupCtrl 3000;
            private _class = ctrlClassName _x;

            private _value = switch (_class) do {
            case (QGVAR(scalar)): {
                    parseNumber (ctrlText _value);
                };
            case (QGVAR(bool)): {
                    [false, true] select (lbCurSel _value);
                };
            case (QGVAR(scalarCombo)): {
                    (lbCurSel _value);
                };
            };

            private _found = false;
            { //If it is already in array, just update value
                _x params ["_xVarName", "_xValue"];
                if (_xVarName == _varName) exitWith {
                    TRACE_2("updating",_varName,_value);
                    _x set [1, _value]; //update value
                    _found = true;
                };
            } forEach _currentSavedSettings;
            if (!_found) then {
                TRACE_2("adding new",_varName,_value);
                _currentSavedSettings pushBack [_varName, _value];
            };
        } else {
            //Unchecked, so if present delete from array if it exists
            private _foundIndex = -1;
            {
                _x params ["_xVarName"];
                if (_xVarName == _varName) exitWith {
                    TRACE_1("deleting",_varName);
                    _foundIndex = _forEachIndex;
                };
            } forEach _currentSavedSettings;
            if (_foundIndex != -1) then {
                _currentSavedSettings deleteAt _foundIndex;
            };
        };
    };
} forEach allControls _display;

QUOTE(ADDON) set3DENMissionAttribute ["ACE_MissionSettings", _currentSavedSettings];
systemChat "Saved";
