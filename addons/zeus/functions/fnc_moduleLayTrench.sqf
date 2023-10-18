#include "..\script_component.hpp"
/*
 * PabstMirror
 * Dig trenchline
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [], true] call ace_zeus_fnc_moduleLayTrench
 *
 * Public: No
 */
if (canSuspend) exitWith {[FUNC(moduleLayTrench), _this] call CBA_fnc_directCall;};

params ["_logic", "_units", "_activated"];
if !(_activated && {local _logic}) exitWith {};
TRACE_1("",_logic);

if !(["ace_trenches"] call EFUNC(common,isModLoaded)) exitWith {
    deleteVehicle _logic;
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
};

if (_logic getVariable [QGVAR(ran), false]) exitWith {};
_logic setVariable [QGVAR(ran), true];

private _drawCode = {
    params ["_object", "_mousePos"];
    private _startPos = getPos _object;
    ([_startPos, _mousePos, false, false, true] call EFUNC(trenches,blockTrench_place)) params ["_valid", "_reason", "_extra"];
    if (_valid) then {
        {
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0,0,1,1], (_x select [0,2]) + [0], 1.5, 1.5, 0, ""];
        } forEach _extra;
    } else {
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (_startPos select [0,2]) + [0], 1.5, 1.5, 0, ""];
        drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,1,1], (_mousePos select [0,2]) + [0], 1.5, 1.5, 0, ""];
    };
};

private _text = format ["%1 %2", LELSTRING(trenches,ConfirmDig), LLSTRING(ModuleLayTrenchline_Tooltip)];
[_logic, {
    params ["_successful", "_logic", "_mousePosASL", "_shift"];
    TRACE_4("getModuleDestination",_successful,_logic,_mousePosASL,_shift);

    if (isNull _logic) exitWith { WARNING("logic missing"); };
    private _startPosASL = getPosASL _logic;
    deleteVehicle _logic;
    if (!_successful) exitWith { TRACE_1("exit",_successful); };

    private _args = [_startPosASL, _mousePosASL, _shift];
    TRACE_1("sending event",_args);
    [QEGVAR(trenches,layTrenchline), [ace_player, _args]] call CBA_fnc_serverEvent;
}, _text, "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0, 1, 0, 1], 45, _drawCode] call FUNC(getModuleDestination);
