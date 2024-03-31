#include "script_component.hpp"

// Only handle loadout change when on map or have open controls
["loadout", {
    if (!visibleMap && {GVAR(controlsGroups) isEqualTo []}) exitWith {};
    call FUNC(handleLoadout);
}, true] call CBA_fnc_addPlayerEventHandler;

// Check loadout when map is opened
["visibleMap", {
    params ["", "_visibleMap"];
    if (_visibleMap) then {call FUNC(handleLoadout)};
}, true] call CBA_fnc_addPlayerEventHandler;
