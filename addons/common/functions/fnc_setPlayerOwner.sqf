/*
 * Author: PabstMirror
 * Sets the player's owner id as a variable on his player ojbect.
 * Should be called on all machines (including server)
 * Note: Needs to wait for CBA_clientID to be recieved from server.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_common_fnc_setPlayerOwner
 *
 * Public: No
 */

// #define DEBUG_MODE_FULL
#include "script_component.hpp"

if (missionNameSpace getVariable [QGVAR(setPlayerOwnerRunning), false]) exitWith {};
GVAR(setPlayerOwnerRunning) = true;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {
        params ["_dcPlayer"];
        TRACE_1("HandleDisconnect eh",_dcPlayer);
        if (!isNil {_dcPlayer getVariable QGVAR(playerOwner)}) then {
            _dcPlayer setVariable [QGVAR(playerOwner), nil, true];
        };
    }];
};

if (hasInterface) then {
    [{
        (!isNil "CBA_clientID") && {CBA_clientID > -1}
    }, {
        TRACE_1("CBA_clientID ready",CBA_clientID);

        ["unit", {
            params ["_newUnit", "_oldUnit"];
            TRACE_2("unit changed",_newUnit,_oldUnit);
            if ((_oldUnit getVariable [QGVAR(playerOwner), -1]) == CBA_clientID) then {
                _oldUnit setVariable [QGVAR(playerOwner), nil, true];
            };
            if (alive _newUnit) then {
                _newUnit setVariable [QGVAR(playerOwner), CBA_clientID, true];
            };
        }, true] call CBA_fnc_addPlayerEventHandler;

    }, []] call CBA_fnc_waitUntilAndExecute;
};

