#include "script_component.hpp"

params ["_unit"];

//_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}];
_unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamageNew)}];

if (local _unit) then {
    if (!EGVAR(common,settingsInitFinished)) exitWith {
        EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(init), [_unit]];
    };
    [_unit] call FUNC(init);
};
