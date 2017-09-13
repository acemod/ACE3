/*
 * Author: 654wak654
 * Applies the current configuration of pylons to the aircraft
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_aircraft_fnc_onButtonApply
 *
 * Public: No
 */
#include "script_component.hpp"

{
    private _pylon = (_x select 0) lbData (lbCurSel (_x select 0));

    if (GVAR(makeNewPylonsEmpty)) then {
        private _pylonMagazines = getPylonMagazines GVAR(currentAircraft);
        if ((_pylonMagazines select _forEachIndex) != _pylon) then {
            GVAR(currentAircraft) setPylonLoadout [_forEachIndex + 1, _pylon, true];
            GVAR(currentAircraft) setAmmoOnPylon [_forEachIndex + 1, 0];
        };
    } else {
        private _count = [configFile >> "CfgMagazines" >> _pylon >> "count", "number", 0] call CBA_fnc_getConfigEntry;
        GVAR(currentAircraft) setPylonLoadout [_forEachIndex + 1, _pylon, true];
        GVAR(currentAircraft) setAmmoOnPylon [_forEachIndex + 1, _count];
    };
} forEach GVAR(comboBoxes);
