#include "script_component.hpp"

params ["_unit"];

_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];

if (local _unit) then {
    if (!CGVAR(settingsInitFinished)) exitWith {
        CGVAR(runAtSettingsInitialized) pushBack [FUNC(init), [_unit]];
    };
    [_unit] call FUNC(init);
};
