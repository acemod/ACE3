/*
 * Author: PabstMirror
 * Shows multiple watched variables on the main display (for easy debugging).
 *
 * Arguments:
 * 0: Title (var name) <STRING> (default: "")
 * 1: Code to generate result (passed nothing, can return any) <CODE> (default: {})
 * 2: Array containing modifiers <ARRAY> (default: [])
 * For Numbers:
 *      0: Show Delta change <BOOL> (default: true)
 *      1: Slider Min Value <NUMBER> (default: 0)
 *      1: Slider Max Value <NUMBER> (default: 0)
 * For Anything else:
 *      0: Number of structured text lines <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["CBA_missionTime"] call ace_common_fnc_watchVariable // Uses title as code
 * ["diag_frameNo", {diag_frameNo}, [false]] call ace_common_fnc_watchVariable // Won't show delta
 * ["blood", {player getVariable "ace_medical_bloodVolume"}, [true, 0, 100]] call ace_common_fnc_watchVariable // Shows slider
 * ["multiLine text", {"Line 1 <br/>Line 2"}, [2]] call ace_common_fnc_watchVariable
 * ["player names", {allPlayers apply {name _x}}, [5]] call ace_common_fnc_watchVariable // handles any data types
 *
 * Public: Yes
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

#define TEXT_HEIGHT 16

params [["_name", "", [""]],["_code", {}, [{}]], ["_mods", [], [[]]]];
TRACE_3("params",_name,_code,_mods);

if (!hasInterface) exitWith {};

if (canSuspend) exitWith { // Ensure atomic - (fix `disableSerialization` error when called from init.sqf)
    [FUNC(watchVariable), _this] call CBA_fnc_directCall;
};

if (isNull (findDisplay 46)) exitWith {
    TRACE_1("waiting for main display to be ready",isNull (findDisplay 46));
    [{!isNull (findDisplay 46)}, {_this call FUNC(watchVariable);}, _this] call CBA_fnc_waitUntilAndExecute;
};

if (_code isEqualTo {}) then {TRACE_1("using title as code",_title); _code = compile _name;};

private _trackedDisplay = uiNamespace getVariable [QGVAR(watchVariableUI), displayNull];
if (isNull _trackedDisplay) then {
    TRACE_1("creating display and adding PFEH",time);
    QGVAR(watchVariableUI) cutRsc [QGVAR(watchVariableUI), "PLAIN", 1, true];

    [{
        private _trackedDisplay = uiNamespace getVariable [QGVAR(watchVariableUI), displayNull];
        private _varArray = _trackedDisplay getVariable [QGVAR(vars), []];
        TRACE_1("updating watched variables",count _varArray);
        {
            _x params ["_ctrlGroup", "_code", "_showDelta", "_lastNumber", "_barMin", "_barMax"];
            private _result = [] call _code;
            if (isNil "_result") then {
                (_ctrlGroup controlsGroupCtrl 1) ctrlSetStructuredText parseText format ["<t color='#FFFF00'>NIL</t>"];
            } else {
                if (_result isEqualType 0) then {
                    (_ctrlGroup controlsGroupCtrl 2) progressSetPosition linearConversion [_barMin, _barMax, _result, 0, 1, true];
                    if (_showDelta) then {
                        private _delta = _result - _lastNumber;
                        _x set [3, _result];
                        if (_delta < 0) then {
                            (_ctrlGroup controlsGroupCtrl 1) ctrlSetStructuredText parseText format ["%1 (<t color='#FF0000'>%2</t>)", _result, _delta];
                        } else {
                            (_ctrlGroup controlsGroupCtrl 1) ctrlSetStructuredText parseText format ["%1 (<t color='#00FF00'>%2</t>)", _result, _delta];
                        };
                    } else {
                        (_ctrlGroup controlsGroupCtrl 1) ctrlSetStructuredText parseText format ["%1", _result];
                    };
                } else {
                    (_ctrlGroup controlsGroupCtrl 1) ctrlSetStructuredText parseText format ["%1", _result];
                };
            };
        } forEach _varArray;
    }, 1, []] call CBA_fnc_addPerFrameHandler;
};

// Add curent call:

private _trackedDisplay = uiNamespace getVariable [QGVAR(watchVariableUI), displayNull];
private _varArray = _trackedDisplay getVariable [QGVAR(vars), []];
private _freePositionY = _trackedDisplay getVariable [QGVAR(freePosition), safeZoneY + 100 * pixelH];

private _height = 2 * TEXT_HEIGHT * pixelH;

private _ctrlGroup = _trackedDisplay ctrlCreate ["ctrlControlsGroupNoScrollbars", -1];

private _ctrlBackground = (_trackedDisplay ctrlCreate ["ctrlStaticBackground", -1, _ctrlGroup]);
_ctrlBackground ctrlSetBackgroundColor [0.2, 0.2, 0.2, 0.5];

private _ctrlTitle = (_trackedDisplay ctrlCreate ["ctrlStatic", -1, _ctrlGroup]);
_ctrlTitle ctrlSetFontHeight (TEXT_HEIGHT * pixelH);
_ctrlTitle ctrlSetFont "EtelkaMonospacePro";
_ctrlTitle ctrlSetPosition [0, 0, 300 * pixelW, TEXT_HEIGHT * pixelW];
_ctrlTitle ctrlCommit 0;
_ctrlTitle ctrlSetText _name;

if ((_mods param [0, true, [0, false]]) isEqualType false) then {
    _mods params [["_showDelta", true, [false]], ["_barMin", 0, [0]], ["_barMax", 0, [0]]];
    TRACE_3("adding number",_barMin,_barMax,_showDelta);

    if (_barMin != _barMax) then {
        TRACE_2("creating bar",_barMin,_barMax);
        private _ctrlSlider = _trackedDisplay ctrlCreate ["RscProgress", 2, _ctrlGroup];
        _ctrlSlider ctrlSetPosition [0 * pixelW, TEXT_HEIGHT * pixelH, 300 * pixelW, TEXT_HEIGHT * pixelH];
        _ctrlSlider ctrlSetFade 0.25;
        _ctrlSlider ctrlSetTextColor [0, 0, 0.2, 1];
        _ctrlSlider ctrlCommit 0;
    };

    private _ctrlResultText = _trackedDisplay ctrlCreate [QGVAR(debug_structuredText), 1, _ctrlGroup];
    _ctrlResultText ctrlSetPosition [25 * pixelW, TEXT_HEIGHT * pixelH, 275 * pixelW, TEXT_HEIGHT * pixelH];
    _ctrlResultText ctrlCommit 0;

    _varArray pushBack [_ctrlGroup, _code, _showDelta, 0, _barMin, _barMax];

} else {
    _mods params [["_lines", 1, [1]]];
    _lines = _lines max 1;
    TRACE_1("adding text",_lines);

    private _ctrlResultText = _trackedDisplay ctrlCreate [QGVAR(debug_structuredText), 1, _ctrlGroup];
    _ctrlResultText ctrlSetPosition [25 * pixelW, TEXT_HEIGHT * pixelH, 275 * pixelW, _lines * TEXT_HEIGHT * pixelH];
    _ctrlResultText ctrlCommit 0;

    _height = (1 + _lines) * TEXT_HEIGHT * pixelH;

    _varArray pushBack [_ctrlGroup, _code, false, -1, 0, 0];
};

_trackedDisplay setVariable [QGVAR(vars), _varArray];

_ctrlGroup ctrlSetPosition [safeZoneX, _freePositionY, 300 * pixelW, _height];
_ctrlGroup ctrlCommit 0;
_ctrlBackground ctrlSetPosition [0, 0, 300 * pixelW, _height];
_ctrlBackground ctrlCommit 0;


_freePositionY = _freePositionY + _height + 5 * pixelH;
_trackedDisplay setVariable [QGVAR(freePosition), _freePositionY];

nil
