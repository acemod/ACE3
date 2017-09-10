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
 * [] call ace_pylons_fnc_onButtonApply
 *
 * Public: No
 */
#include "script_component.hpp"

{
    _x params ["_combo", "_mirroredIndex", "_icon", "_originalIndex"];
    // TODO: Progress bar for each changed pylon
    private _pylon = _combo lbData (lbCurSel _combo);

    if (GVAR(rearmNewPylons)) then {
        // TODO: Rearm airplane, remove ace_rearm supply if it's enabled
        private _count = getNumber (configFile >> "CfgMagazines" >> _pylon >> "count");
        GVAR(currentAircraft) setPylonLoadout [_forEachIndex + 1, _pylon, true];
        GVAR(currentAircraft) setAmmoOnPylon [_forEachIndex + 1, _count];
    } else {
        if ((lbCurSel _combo) == _originalIndex) exitWith {}; // Don't touch pylons that weren't changed
        private _pylonMagazines = getPylonMagazines GVAR(currentAircraft);
        if ((_pylonMagazines select _forEachIndex) != _pylon) then {
            GVAR(currentAircraft) setPylonLoadout [_forEachIndex + 1, _pylon, true];
            GVAR(currentAircraft) setAmmoOnPylon [_forEachIndex + 1, 0];
        };
    };
} forEach GVAR(comboBoxes);
