/*
 * Author: PabstMirror
 * Handles returned ammo (either from unloading or leftovers from linking)
 *
 * Arguments:
 * 0: Unit (Player) <OBJECT>
 * 1: Vehicle Magazine <STRING>
 * 2: Ammo in magazine <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "ace_csw_100Rnd_127x99_mag", 70] call ace_csw_fnc_reload_handleReturnAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_carryMag", "_ammo"];
TRACE_3("reload_handleReturnAmmo",_unit,_carryMag,_ammo);

if (_unit canAdd _carryMag) then {
    _unit addMagazine [_carryMag, _ammo];
} else {
    // create ground..
};
