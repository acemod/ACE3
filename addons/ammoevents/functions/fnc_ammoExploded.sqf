/*
 * Author: esteldunedain
 *
 * Arguments:
 * 0: Position AGL <ARRAY>
 * 1: Ammo <STRING>
 *
 * Return Value:
 * Nothing
 *
 *
 * Public: No
 */
#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_posAGL", "_ammo"];
TRACE_2("GrenadeExploded:",_posAGL,_ammo);
[{
    ["AmmoExploded", _this] call EFUNC(common,localEvent);
}, _this] call EFUNC(common,execNextFrame);
