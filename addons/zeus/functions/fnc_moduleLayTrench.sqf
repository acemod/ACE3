#define DEBUG_MODE_FULL
#include "script_component.hpp"
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

private _startPos = getPosASL _logic; // change position of logic to be aligned with grid
getTerrainInfo params ["", "", "_cellsize"];
_startPos = (_startPos select [0,2]) apply {_cellsize * round (_x / _cellsize)};
_logic setPos _startPos;


// todo: it would be nice to show visually that trenches can only be dug north/south or east/west
private _text = format ["%1 [%2]", LELSTRING(trenches,ConfirmDig), "+SHIFT to force"];
[_logic, {
    params ["_successful", "_logic", "_mousePosASL", "_shift"];
    TRACE_4("getModuleDestination",_successful,_logic,_mousePosASL,_shift);

    private _startPosASL = getPosASL _logic;
    deleteVehicle _logic;
    if (isNull _logic) exitWith { TRACE_1("exit",isNull _logic); };
    if (!_successful) exitWith { TRACE_1("exit",_successful); };

    private _args = [_startPosASL, _mousePosASL, _shift];
    TRACE_1("sending event",_args);
    [QEGVAR(trenches,layTrenchline), [ace_player, _args]] call CBA_fnc_serverEvent;
}, _text, "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0, 1, 0, 1], 45] call FUNC(getModuleDestination);
