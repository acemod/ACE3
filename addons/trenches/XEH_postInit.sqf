#include "script_component.hpp"

if (isServer) then {
    // Cancel dig on hard disconnection. Function is identical to killed
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleKilled)}];

    // Wrapper for blockTrench_place, on failure send hint back to source
    [QGVAR(layTrenchline), {
        params [["_source", objNull, [objNull]], ["_args", [], [[]]]];
        private _return = _args call FUNC(blockTrench_place);
        TRACE_3("layTrenchline EH",_source,_args,_return);
        _return params ["_success", "_reason", ["_info", ""]];
        if ((!_success) && {!isNull _source}) then {
            [QEGVAR(common,displayTextStructured), [["%1:<br/>%2<br/>%3", "str_mis_state_failed", _reason, _info], 3], [_source]] call CBA_fnc_targetEvent;
        };
    }] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

GVAR(trenchId) = 0;
GVAR(trench) = objNull;
GVAR(digPFH) = -1;
GVAR(digDirection) = 0;

// Cancel dig sandbag if interact menu opened
["ace_interactMenuOpened", {[ACE_player] call FUNC(handleInteractMenuOpened)}] call CBA_fnc_addEventHandler;

// Cancel dig on player change. This does work when returning to lobby, but not when hard disconnecting.
["unit", LINKFUNC(handlePlayerChanged)] call CBA_fnc_addPlayerEventHandler;
["loadout", LINKFUNC(handlePlayerInventoryChanged)] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[ACE_player, objNull] call FUNC(handlePlayerChanged)}] call CBA_fnc_addPlayerEventHandler;

// handle waking up dragged unit and falling unconscious while dragging
["ace_unconscious", LINKFUNC(handleUnconscious)] call CBA_fnc_addEventHandler;

//@todo Captivity?
