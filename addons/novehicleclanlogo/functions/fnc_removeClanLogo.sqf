#include "script_component.hpp"
/*
 * Author: veteran29
 * Replaces the vehicle clan logo with an empty texture.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle player] call ace_novehicleclanlogo_fnc_removeClanLogo
 *
 * Public: Yes
 */

params ["_vehicle"];

if !("clan" in selectionNames _vehicle) exitWith {
    TRACE_1("vehicle does not have 'clan' selection",_vehicle);
};

TRACE_1("replacing clan logo with empty texture",_vehicle);
_vehicle setObjectTextureGlobal ["clan", "#(argb,1,1,1)color(0,0,0,0)"] // return
