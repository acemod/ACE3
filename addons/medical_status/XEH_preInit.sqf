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

if (hasInterface) then {
    //Add Inventory action to uncon units
    ["CAManBase", "init", {
        params ["_unit"];

        private _id = _unit addAction ["", {
            params ["_target", "_caller", "_actionId", "_arguments"];

            _caller action ["Gear", _target];
        }, nil, 5.1, true, true, "gear", "_target getVariable ['ACE_isUnconscious',false] && {alive _target}", 3.5];

        _unit setUserActionText [_id, localize "STR_ACTION_GEAR", "<img image='\A3\ui_f\data\igui\cfg\actions\gear_ca.paa' size='2.5' shadow=2 />"];

    }, nil, nil, true] call CBA_fnc_addClassEventHandler;
};

ADDON = true;
