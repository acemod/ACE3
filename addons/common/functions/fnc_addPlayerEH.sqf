#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Adds event handler just to ACE_player
 * Can be removed after cba 3.18 is released for CBA_fnc_addBISPlayerEventHandler
 * This never was public in a release
 *
 * Arguments:
 * 0: Key <STRING>
 * 1: Event Type <STRING>
 * 2: Event Code <CODE>
 * 3: Ignore Virtual Units (spectators, virtual zeus, uav RC) <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["example", "FiredNear", {systemChat str _this}] call ace_common_fnc_addPlayerEH
 *
 * Public: No
*/
params [["_key", "", [""]], ["_type", "", [""]], ["_code", {}, [{}]], ["_ignoreVirtual", true, [true]]];
TRACE_3("addPlayerEH",_key,_type,_ignoreVirtual);

if (isNil QGVAR(playerEventsHash)) then { // first-run init
    GVAR(playerEventsHash) = createHashMap;
    ["unit", {
        params ["_newPlayer", "_oldPlayer"];
        // uav check only applies to direct controlling UAVs from zeus, no effect on normal UAV operation
        private _isVirutal = (unitIsUAV _newPlayer) || {getNumber (configOf _newPlayer >> "isPlayableLogic") == 1};

        TRACE_4("",_newPlayer,_oldPlayer,_isVirutal,count GVAR(playerEventsHash));
        {
            _y params ["_type", "_code", "_ignoreVirtual"];

            private _oldEH = _oldPlayer getVariable [_x, -1];
            if (_oldEH != -1) then { 
                _oldPlayer removeEventHandler [_type, _oldEH]; 
                _oldPlayer setVariable [_x, nil];
            };

            _oldEH = _newPlayer getVariable [_x, -1];
            if (_oldEH != -1) then { continue }; // if respawned then var and EH already exists
            if (_ignoreVirtual && _isVirutal) then { continue };

            private _newEH = _newPlayer addEventHandler [_type, _code];
            _newPlayer setVariable [_x, _newEH];
        } forEach GVAR(playerEventsHash);
    }, false] call CBA_fnc_addPlayerEventHandler;
};


_key = format [QGVAR(playerEvents_%1), toLower _key];
if (_key in GVAR(playerEventsHash)) exitWith { ERROR_1("bad key %1",_this); };

GVAR(playerEventsHash) set [_key, [_type, _code, _ignoreVirtual]];

if (isNull ACE_player) exitWith {};
if (_ignoreVirtual && {(unitIsUAV ACE_player) || {getNumber (configOf ACE_player >> "isPlayableLogic") == 1}}) exitWith {};

// Add event now
private _newEH = ACE_player addEventHandler [_type, _code];
ACE_player setVariable [_key, _newEH];
