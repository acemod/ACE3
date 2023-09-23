#include "script_component.hpp"

{
    TRACE_1("blocking switching to unsupported laser mode",_x);
    [_x, { false }] call CBA_fnc_addAttachmentCondition;
} forEach (keys (uiNamespace getVariable QGVAR(oldLasers)));

ADDON = true;
