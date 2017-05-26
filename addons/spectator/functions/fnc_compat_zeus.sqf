/*
 * Author: SilentSpike
 * Handles compatibility with curator interface (i.e. re-opens spectator if applicable)
 *
 * Called from the RscDisplayCurator XEH
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

_display displayAddEventHandler ["Unload",{
    // Only re-open if still a spectator (and not remote-controlling)
    if (GVAR(isSet) && {isNull (GETMVAR(bis_fnc_moduleRemoteControl_unit,objNull))}) then {
        // Display must be opened next frame to prevent game crash
        [{ [true] call FUNC(ui) }] call CBA_fnc_execNextFrame;
    };
}];
