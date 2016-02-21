/*
 * Author: esteldunedain
 *
 * Arguments:
 * Particle position
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_frag_fnc_fired
 *
 * Public: No
 */
// #define DEBUG_ENABLED_FRAG
#define DEBUG_MODE_FULL
#include "script_component.hpp"

hintSilent "Exploded";
TRACE_1("GrenadeExploded:",_this);
[{
    ["GrenadeExploded", _this] call EFUNC(common,localEvent);
}, _this] call EFUNC(common,execNextFrame);
