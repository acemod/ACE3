#define DEBUG_MODE_FULL
#include "script_component.hpp"
/*
 * PabstMirror
 * y
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

private _text = format ["%1 [%2]", LELSTRING(trenches,ConfirmDig), "+SHIFT to force"];
[_logic, {
    params ["_successful", "_logic", "_mousePosASL", "_shift"];
    TRACE_4("getModuleDestination",_successful,_logic,_mousePosASL,_shift);

    private _startPosASL = getPosASL _logic;
    deleteVehicle _logic;

    if (!_successful) exitWith { TRACE_1("bail",_successful); };

    [QGVAR(digTrenchHandler), [ace_player, [_startPosASL, _mousePosASL, _shift]]] call CBA_fnc_serverEvent;
}, _text, "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0, 1, 0, 1], 45] call FUNC(getModuleDestination);
