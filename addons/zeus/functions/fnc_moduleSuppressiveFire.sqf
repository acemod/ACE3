/*
 * Author: bux
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#define DRAW_ZEUS_INFO
#include "script_component.hpp"

if (canSuspend) exitWith {[FUNC(moduleSuppressiveFire), _this] call CBA_fnc_directCall;};

params ["_logic", "_units", "_activated"];

if !(_activated && local _logic) exitWith {};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
TRACE_3("moduleSuppressiveFire placed",_unit,typeOf _unit,_logic);

private _displayName = getText (configFile >> "CfgVehicles" >> (typeOf _logic) >> "displayName");
deleteVehicle _logic;

if (isNull _unit) exitWith {
    [objnull, LSTRING(NothingSelected)] call bis_fnc_showCuratorFeedbackMessage;
};
if (!alive _unit) exitWith {
    [objnull, LSTRING(OnlyAlive)] call bis_fnc_showCuratorFeedbackMessage;
};
if ([_unit] call EFUNC(common,isPlayer)) exitWith {
    [objnull, localize "str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call bis_fnc_showCuratorFeedbackMessage;
};

[_unit, {
    params ["_successful", "_unit", "_mousePosASL"];
    TRACE_3("sup fire place return",_successful,_unit,_mousePosASL);
    if (!_successful) exitWith {};
    if (!alive _unit) exitWith {};
    private _vehicle = vehicle _unit;

    _mousePosASL = _mousePosASL vectorAdd [0,0,0.5];
    private _lis = lineIntersectsSurfaces [eyePos _unit, _mousePosASL, _unit, _vehicle];
    private _targetASL = _mousePosASL;
    if ((count _lis) > 0) then {
        _targetASL = ((_lis select 0) select 0);
    };

    systemChat format ["Distance %1", _targetASL vectorDistance eyePos _unit];

#ifdef DRAW_ZEUS_INFO
    [eyePos _unit, _mousePosASL, [0,0,1,1]] call ace_common_fnc_addLineToDebugDraw;
    [eyePos _unit, _targetASL, [1,0,0,1]] call ace_common_fnc_addLineToDebugDraw;
    if (!(_vehicle getVariable [QGVAR(debugFiredAdded), false])) then {
        _vehicle setVariable [QGVAR(debugFiredAdded), true];
        _vehicle addEventHandler ["Fired", {
            private _proj = _this select 6;
            [(getPosASL _proj), (getPosASL _proj) vectorAdd ((vectorDir _proj) vectorMultiply 1000), [0,1,0,1]] call ace_common_fnc_addLineToDebugDraw;
        }];
    };
#endif

    [{
        params ["_unit", "_burstsLeft", "_nextRun", "_targetASL"];
        if (!alive _unit) exitWith {true};
        if (CBA_missionTime >= _nextRun) then {
            _burstsLeft = _burstsLeft - 1;
            _this set [1, _burstsLeft];
            _this set [2, _nextRun + 2];
            // systemChat format ["[%1] %2",CBA_missionTime,_this];
            _unit doSuppressiveFire _targetASL;
        };
        (_burstsLeft <= 0)
    }, {
        systemChat "done";
    }, [_unit, (40 / 2), CBA_missionTime, _targetASL]] call CBA_fnc_waitUntilAndExecute;

}, _displayName] call FUNC(getModuleDestination);
