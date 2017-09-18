/*
 * Author: 654wak654
 * Recursively shows the progress bar for each configured pylon.
 *
 * Arguments:
 * 0: Indexes of pylons to configure <ARRAY>
 * 1: Current index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_pylonsToConfigure, 0] call ace_pylons_fnc_configurePylons
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_pylonsToConfigure", "_currentPylon"];

if (_currentPylon == count _pylonsToConfigure) exitWith {};

// TODO: Animation and sound
[
    GVAR(timePerPylon),
    _this,
    {
        (_this select 0) params ["_pylonsToConfigure", "_currentPylon"];
        private _pylonIndex = _pylonsToConfigure select _currentPylon;
        private _combo = GVAR(comboBoxes) select _pylonIndex select 0;
        private _pylonMagazine = _combo lbData (lbCurSel _combo);

        // Remove the weapon of current pylon from aircraft IF weapon is only on this pylon
        private _currentPylonMagazine = (getPylonMagazines GVAR(currentAircraft)) select _pylonIndex;
        if (_currentPylonMagazine != "") then {
            private _allPylonWeapons = (getPylonMagazines GVAR(currentAircraft)) apply {
                getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon")
            };
            private _pylonWeapon = _allPylonWeapons select _pylonIndex;
            if (({_x == _pylonWeapon} count _allPylonWeapons) == 1) then {
                GVAR(currentAircraft) removeWeaponGlobal _pylonWeapon;
            };
        };

        [
            QGVAR(setPylonLoadOutEvent),
            [GVAR(currentAircraft), _pylonIndex + 1, _pylonMagazine],
            GVAR(currentAircraft)
        ] call CBA_fnc_targetEvent;

        private _count = if (GVAR(rearmNewPylons)) then {
            getNumber (configFile >> "CfgMagazines" >> _pylonMagazine >> "count")
        } else {
            0
        };

        [
            QGVAR(setAmmoOnPylonEvent),
            [GVAR(currentAircraft), _pylonIndex + 1, _count],
            GVAR(currentAircraft)
        ] call CBA_fnc_targetEvent;

        [_pylonsToConfigure, _currentPylon + 1] call FUNC(configurePylons);
    },
    {
        (_this select 0) params ["", "_currentPylon"];
        [format [localize LSTRING(Stopped), _currentPylon + 1], false, 5] call EFUNC(common,displayText);
    },
    format [localize LSTRING(ReplacingPylon), _currentPylon + 1, count _pylonsToConfigure]
] call EFUNC(common,progressBar);
