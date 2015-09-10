#include "script_component.hpp"

params ["_unit"];

// reset all variables. @todo GROUP respawn?
[_unit] call FUNC(init);

// Reset captive status for respawning unit
if (!(_unit getVariable ["ACE_isUnconscious", false])) then {
    [_unit, QGVAR(unconscious), false] call EFUNC(common,setCaptivityStatus);
};

// Remove maximum unconsciousness ACE_time handler
_maxUnconHandle = _unit getVariable [QGVAR(maxUnconTimeHandle), -1];
if (_maxUnconHandle > 0) then {
    [_maxUnconHandle] call CBA_fnc_removePerFrameHandler;
};
