/*
 * Author: 654wak654
 * Loads selected pylon configuration from either config or profileNamespace.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_onButtonLoad
 *
 * Public: No
 */
#include "script_component.hpp"

[false] call FUNC(onPylonMirror);
(CONTROL(ID_DIALOG) ID_CHECKBOX_MIRROR) cbSetChecked false;

private _loadoutName = ctrlText ID_EDIT_LOADOUTNAME;
private _fnc_setSelections = {
    params ["_mags", "_turrets"];

    {
        _x params ["_combo", "_mirroredIndex", "_button"];

        private _index = 0;
        for "_i" from 1 to ((lbSize _combo) - 1) do {
            if ((_combo lbData _i) == (_mags param [_forEachIndex, ""])) exitWith {
                _index = _i;
            };
        };
        _combo lbSetCurSel _index;

        [_button, false, _turrets select _forEachIndex] call FUNC(onButtonTurret);
    } forEach GVAR(comboBoxes);
};

private _pylonComponent = configFile >> "CfgVehicles" >> typeOf GVAR(currentAircraft) >> "Components" >> "TransportPylonsComponent";
private _loadoutFound = {
    if (getText (_x >> "displayName") isEqualTo _loadoutName) exitWith {
        // Get default turrets from config
        private _turrets = ("true" configClasses (_pylonComponent >> "Pylons")) apply {getArray (_x >> "turret")};
        [getArray (_x >> "attachment"), _turrets] call _fnc_setSelections;
        true
    };
    false
} forEach ("true" configClasses (_pylonComponent >> "Presets"));

if (_loadoutFound) exitWith {};

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
{
    if ((_x select 0) isEqualTo _loadoutName && {(_x select 3) isEqualTo typeOf GVAR(currentAircraft)}) exitWith {
        [_x select 1, _x select 2] call _fnc_setSelections;
    };
} forEach _aircraftLoadouts;
