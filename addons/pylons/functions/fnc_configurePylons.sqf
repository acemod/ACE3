/*
 * Author: 654wak654
 * Recursively shows the progress bar for each configured pylon.
 *
 * Arguments:
 * 0: Indexes of pylons to configure <ARRAY>
 * 1: The current index <NUMBER>
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

// TODO: Remove empty weapons
// TODO: Animation and sound
[
    GVAR(timePerPylon),
    _this,
    {
        (_this select 0) params ["_pylonsToConfigure", "_currentPylon"];
        private _pylonIndex = _pylonsToConfigure select _currentPylon;
        private _combo = GVAR(comboBoxes) select _pylonIndex select 0;
        private _pylon = _combo lbData (lbCurSel _combo);

        [
            QGVAR(setPylonLoadOutEvent),
            [GVAR(currentAircraft), _pylonIndex + 1, _pylon],
            GVAR(currentAircraft)
        ] call CBA_fnc_targetEvent;

        if (GVAR(rearmNewPylons)) then {
            private _count = getNumber (configFile >> "CfgMagazines" >> _pylon >> "count");
            [
                QGVAR(setAmmoOnPylonEvent),
                [GVAR(currentAircraft), _pylonIndex + 1, _count],
                GVAR(currentAircraft)
            ] call CBA_fnc_targetEvent;
        };

        [_pylonsToConfigure, _currentPylon + 1] call FUNC(configurePylons);
    },
    {
        (_this select 0) params ["", "_currentPylon"];
        [format [localize LSTRING(Stopped), _currentPylon], false, 5] call EFUNC(common,displayText);
    },
    format [localize LSTRING(ReplacingPylon), _currentPylon + 1, count _pylonsToConfigure]
] call EFUNC(common,progressBar);
