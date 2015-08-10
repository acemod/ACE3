/*
 * Author: Glowbal
 * Handle object being destroyed
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_vehicle"];

_loaded = _vehicle getvariable [QGVAR(loaded), []];
if (count _loaded == 0) exitwith {};

{
    // TODO deleteVehicle or just delete vehicle? Do we want to be able to recover destroyed equipment?
    deleteVehicle _x;
    //_x setDamage 1;
}foreach _loaded;

[_vehicle] call FUNC(validateCargoSpace);
