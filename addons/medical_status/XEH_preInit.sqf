#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

// Add vanilla killed EH to unit to set correct killer
["CAManBase", "init", {
    params ["_unit"];

    private _config = configOf _unit;
    if (getText (_config >> "simulation") == "UAVPilot") exitWith {TRACE_1("ignore UAV AI",typeOf _unit);};
    if (getNumber (_config >> "isPlayableLogic") == 1) exitWith {TRACE_1("ignore logic unit",typeOf _unit)};

    // Hopefully this EH gets added first as it can only effect other EH called after it
    private _ehIndex = _unit addEventHandler ["Killed", {_this call FUNC(handleKilled)}];
    #ifdef DEBUG_MODE_FULL
    if (_ehIndex != 0) then { WARNING_1("killed EH not first [%1]",_ehIndex); };
    #endif
}, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;

addMissionEventHandler ["EntityKilled", {_this call FUNC(handleKilledMission)}];

// Add inventory and open backpack actions to uncon units
if (hasInterface) then {
    ["CAManBase", "init", LINKFUNC(addInventoryActions), true, [], true] call CBA_fnc_addClassEventHandler;
};

// Respawn is called locally
["CAManBase", "respawn", {
    params ["_unit"];

    // Make sure to call function only once on respawn
    if (!local _unit) exitWith {};

    [QGVAR(addInventoryActions), _unit] call CBA_fnc_globalEvent;
}, true, [], true] call CBA_fnc_addClassEventHandler;

ADDON = true;
