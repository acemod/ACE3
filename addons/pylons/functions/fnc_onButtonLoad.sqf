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
    params ["_mags"];

    {
        private _ctrl = _x select 0;

        private _index = 0;
        for "_i" from 1 to ((lbSize _ctrl) - 1) do {
            if ((_ctrl lbData _i) == (_mags param [_forEachIndex, ""])) exitWith {
                _index = _i;
            };
        };
        _ctrl lbSetCurSel _index;
    } forEach GVAR(comboBoxes);
};

private _pylonComponent = configFile >> "CfgVehicles" >> typeOf GVAR(currentAircraft) >> "Components" >> "TransportPylonsComponent";
private _loadoutFound = {
    if (getText (_x >> "displayName") isEqualTo _loadoutName) exitWith {
        [getArray (_x >> "attachment")] call _fnc_setSelections;
        true
    };
    false
} forEach ("true" configClasses (_pylonComponent >> "Presets"));

if (_loadoutFound) exitWith {};

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
{
    if ((_x select 0) isEqualTo _loadoutName && {(_x select 2) isEqualTo typeOf GVAR(currentAircraft)}) exitWith {
        [_x select 1] call _fnc_setSelections;
    };
} forEach _aircraftLoadouts;
