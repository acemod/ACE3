#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Starts unloading item selected in the cargo menu.
 *
 * Arguments:
 * 0: Unit doing the unloading <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_cargo_fnc_startUnload
 *
 * Public: No
 */

disableSerialization;

private _display = uiNamespace getVariable QGVAR(menuDisplay);

if (isNil "_display") exitWith {};

private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];

if (_loaded isEqualTo []) exitWith {};

// This can be an object or a classname string
private _item = _loaded param [lbCurSel (_display displayCtrl 100), nil];

if (isNil "_item") exitWith {};

params ["_unit"];

if (GVAR(interactionParadrop)) exitWith {
    private _duration = GVAR(paradropTimeCoefficent) * (_item call FUNC(getSizeItem));

    // If drop time is 0, don't show a progress bar
    if (_duration <= 0) exitWith {
        // Close cargo menu
        closeDialog 0;

        [QGVAR(paradropItem), [_item, GVAR(interactionVehicle)]] call CBA_fnc_localEvent;
    };

    // Start progress bar - paradrop
    [
        _duration,
        [_item, GVAR(interactionVehicle)],
        {
            [QGVAR(paradropItem), _this select 0] call CBA_fnc_localEvent;
        },
        {
            params ["", "", "", "_errorCode"];

            if (_errorCode == 3) then { // show warning if we failed because of flight conditions
                [LSTRING(unlevelFlightWarning)] call EFUNC(common,displayTextStructured);
            };
        },
        LLSTRING(unloadingItem),
        {
            (_this select 0) params ["", "_target"];

            if ((acos ((vectorUp _target) select 2)) > 30) exitWith {false}; // check flight level
            if (((getPos _target) select 2) < 25) exitWith {false}; // check height
            if ((speed _target) < -5) exitWith {false}; // check reverse

            true
        },
        ["isNotSwimming", "isNotInside"]
    ] call EFUNC(common,progressBar);
};

// Start progress bar - normal ground unload
if ([_item, GVAR(interactionVehicle), _unit] call FUNC(canUnloadItem)) then {
    private _duration = GVAR(loadTimeCoefficient) * (_item call FUNC(getSizeItem));

    // If unload time is 0, don't show a progress bar
    if (_duration <= 0) exitWith {
        // Close cargo menu
        closeDialog 0;

        ["ace_unloadCargo", [_item, GVAR(interactionVehicle), _unit]] call CBA_fnc_localEvent
    };

    [
        _duration,
        [_item, GVAR(interactionVehicle), _unit],
        {
            TRACE_1("unload finish",_this);

            ["ace_unloadCargo", _this select 0] call CBA_fnc_localEvent;
        },
        {
            TRACE_1("unload fail",_this);
        },
        LLSTRING(unloadingItem),
        {
            (_this select 0) params ["_item", "_vehicle", "_unit"];

            [_item, _vehicle, _unit, false, true] call FUNC(canUnloadItem) // don't check for a suitable unloading position every frame
        },
        ["isNotSwimming"]
    ] call EFUNC(common,progressBar);
} else {
    [[LSTRING(unloadingFailed), [_item, true] call FUNC(getNameItem)], 3] call EFUNC(common,displayTextStructured);
};
