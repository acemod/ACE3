#include "..\script_component.hpp"
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

params ["_pylonsToConfigure", "_currentPylon"];

if (_currentPylon == count _pylonsToConfigure) exitWith {};

// TODO: Animation and sound
[
    [GVAR(timePerPylon), 0] select GVAR(isCurator),
    _this,
    {
        (_this select 0) params ["_pylonsToConfigure", "_currentPylon"];
        private _pylonIndex = _pylonsToConfigure select _currentPylon;
        TRACE_2("",_currentPylon,_pylonIndex);

        // Check for unused weapons on each turret after applying the new loadout
        private _currentPylonMagazine = (getPylonMagazines GVAR(currentAircraft)) select _pylonIndex;
        private _weaponToRemove = getText (configFile >> "CfgMagazines" >> _currentPylonMagazine >> "pylonWeapon");

        private _combo = GVAR(comboBoxes) select _pylonIndex select 0;
        private _pylonMagazine = _combo lbData (lbCurSel _combo);
        private _turret = (GVAR(comboBoxes) select _pylonIndex select 2) getVariable [QGVAR(turret), []];
        if (_turret isEqualTo [-1]) then {_turret = [];};

        // Preserve ammunition when only changing the assigned turret
        private _count = if (_pylonMagazine == _currentPylonMagazine) then {
            GVAR(currentAircraft) ammoOnPylon (_pylonIndex + 1)
        } else {
            if (GVAR(rearmNewPylons) || {GVAR(isCurator)}) then {
                getNumber (configFile >> "CfgMagazines" >> _pylonMagazine >> "count")
            } else {
                0
            }
        };

        [
            QGVAR(setPylonLoadOutEvent),
            [GVAR(currentAircraft), _pylonIndex + 1, _pylonMagazine, _turret, _weaponToRemove]
        ] call CBA_fnc_globalEvent;

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
    format [localize LSTRING(ReplacingPylon), _currentPylon + 1, count _pylonsToConfigure],
    {GVAR(isCurator) || {(ace_player distanceSqr GVAR(currentAircraft)) <= GVAR(searchDistanceSqr)}},
    ["isNotInZeus"]
] call EFUNC(common,progressBar);
