#define DEBUG_MODE_FULL
#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Helper for adding event handlers code to maps. Save/Load compatible.
 *
 * Arguments:
 * 0: Event Type <STRING>
 * 1: Code for a draw EH (map ctrl will be arg 0) <CODE>
 * 2: Draw on Main Map <BOOL><OPTIONAL>
 * 3: Draw on Briefing Map <BOOL><OPTIONAL>
 * 4: Draw on GPS Maps (ItemGPS and MicroDagr) <BOOL><OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Draw", {}, true] call ace_common_fnc_addMapEventHandler
 *
 * Public: Yes
 */

if (!hasInterface) exitWith {};

params [["_type", "", [""]], ["_func", {}, [{}]], ["_drawOnMainMap", false, [false]], ["_drawOnBriefingMap", false, [false]],["_drawOnGPS", false, [false]]];
TRACE_5("addMapEventHandler",_type,_func isEqualTo {},_drawOnMainMap,_drawOnBriefingMap,_drawOnGPS);

if ((ADDMAPEVENTHANDLER_EVENTS findIf {_x == _type}) == -1) exitWith { ERROR_1("amEH enum - %1",_this); };

private _mapVarNames = [];

if (_drawOnMainMap) then { _mapVarNames pushBack QEGVAR(mapEventHandlers,main); };
if (_drawOnBriefingMap) then { _mapVarNames pushBack QEGVAR(mapEventHandlers,briefing); };
if (_drawOnGPS) then { _mapVarNames pushBack QEGVAR(mapEventHandlers,gps); };

{
    private _varName = format ["%1%2", _x, _type];
    private _array = missionNamespace getVariable [_varName, []];
    _array pushBack _func;
    missionNamespace setVariable [_varName, _array];
} forEach _mapVarNames;
