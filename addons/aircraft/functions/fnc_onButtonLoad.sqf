/*
 * Author: 654wak654
 * Loads selected pylon configuration from either config or profile
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_aircraft_fnc_onButtonLoad
 *
 * Public: No
 */
#include "script_component.hpp"

[false] call FUNC(onPylonMirror);
((findDisplay 654654) displayCtrl 130) cbSetChecked false;

private _loadoutName = ctrlText 170;

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

private _loadoutFound = false;
private _pylonComponent = configFile >> "CfgVehicles" >> typeOf GVAR(currentAircraft) >> "Components" >> "TransportPylonsComponent";
{
    if (getText (_x >> "displayName") == _loadoutName) exitWith {
        [getArray (_x >> "attachment")] call _fnc_setSelections;
        _loadoutFound = true;
    };
} forEach ("true" configClasses (_pylonComponent >> "Presets"));

if (_loadoutFound) exitWith {};

private _aircraftLoadouts = profileNamespace getVariable [QGVAR(aircraftLoadouts), []];
{
    if ((_x select 0) == _loadoutName) exitWith {
        [_x select 1] call _fnc_setSelections;
    };
} forEach _aircraftLoadouts;
