#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Adds event handler just to ace_player
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Event Type <STRING>
 * 2: Event Code <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["example", "FiredNear", {systemChat str _this}] call ace_common_fnc_addPlayerEH
 *
 * Public: Yes
*/
params [["_key", "", [""]], ["_type", "", [""]], ["_code", {}, [{}]]];

if (isNil QGVAR(playerEventsHash)) then { // init
    GVAR(playerEventsHash) = createHashMap;
    ["unit", {
        params ["_newPlayer", "_oldPlayer"];
        TRACE_3("",_newPlayer,_oldPlayer,count GVAR(playerEventsHash));
        {
            private _var = format [QGVAR(playerEvents_%1), _x];
            private _oldEH = _oldPlayer getVariable [_var, -1];
            _oldPlayer removeEventHandler [_y#0, _oldEH];
            _oldPlayer setVariable [_var, nil];

            private _newEH = _newPlayer addEventHandler _y;
            _newPlayer setVariable [_var, _newEH];
        } forEach GVAR(playerEventsHash);
    }, false] call CBA_fnc_addPlayerEventHandler;
};

private _event = [_type, _code];
GVAR(playerEventsHash) set [_key, _event];

if (isNull ACE_player) exitWith {};
private _var = format [QGVAR(playerEvents_%1), _key];
private _newEH = ACE_player addEventHandler _event;
ACE_player setVariable [_var, _newEH];
