#include "script_component.hpp"

params ["_unit"];

// reset all variables. @todo GROUP respawn?
[_unit] call FUNC(init);

// Reset captive status for respawning unit
if (!(_unit getVariable ["ACE_isUnconscious", false])) then {
    [_unit, "setCaptive", "ace_unconscious", false] call EFUNC(common,statusEffect_set);
};

// Remove maximum unconsciousness time handler
_maxUnconHandle = _unit getVariable [QGVAR(maxUnconTimeHandle), -1];
if (_maxUnconHandle > 0) then {
    [_maxUnconHandle] call CBA_fnc_removePerFrameHandler;
};
