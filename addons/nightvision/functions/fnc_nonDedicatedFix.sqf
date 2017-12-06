/*
 * Author: PabstMirror
 * Handles the client who is the non-dedicated server turning on the fog effects.
 *
 * Arguments:
 * 0: Module <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_nightvision_fnc_nonDedicatedFix
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("Starting PFEH to handling non-dedicated server running effect",GVAR(serverPriorFog));

if (isServer) exitWith {};

[{
    if (isNil QGVAR(serverPriorFog)) exitWith {
        TRACE_1("Ending PFEH to handling non-dedicated server running effect",_this);
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };
    if (!GVAR(running)) then { // If we aren't running the effect ourselves, then use the server's old fog value
        0 setFog GVAR(serverPriorFog);
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
