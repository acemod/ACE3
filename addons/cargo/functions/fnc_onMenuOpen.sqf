#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Handles the UI data display.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * display call ace_cargo_fnc_onMenuOpen
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

uiNamespace setVariable [QGVAR(menuDisplay), _display];

if (GVAR(interactionParadrop)) then {
    (_display displayCtrl 12) ctrlSetText LLSTRING(paradropButton);
};

// https://feedback.bistudio.com/T182949
private _config = configOf GVAR(interactionVehicle);
private _isVivCapable = isClass (_config >> "VehicleTransport" >> "Carrier");

// Make sure that correct menu is displayed at start, if there are limitations
if !(GVAR(interactionVehicle) getVariable [QGVAR(hasCargo), getNumber (_config >> QGVAR(hasCargo)) == 1]) then {
    GVAR(isViv) = true;
} else {
    if !(_isVivCapable && {vehicleCargoEnabled GVAR(interactionVehicle)}) then {
        GVAR(isViv) = false;
    };
};

// Disable deploy option if paradropping or in Zeus
(_display displayCtrl 13) ctrlEnable (GVAR(enableDeploy) && !GVAR(interactionParadrop) && {isNull curatorCamera});

[{
    params ["_args", "_pfhID"];
    _args params ["_vehicle", "_isVivCapable"];

    disableSerialization;

    private _display = uiNamespace getVariable QGVAR(menuDisplay);

    if (isNil "_display") exitWith {
        GVAR(interactionParadrop) = nil;

        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Close menu if in invalid state
    if (
        !alive ACE_player ||
        {!alive _vehicle} ||
        {locked _vehicle >= 2} ||
        {
            // If the cargo menu could be opened, the vehicle has QGVAR(hasCargo) in its config or the variable is set using FUNC(setSpace)
            // or ViV was enabled via config
            if (GVAR(isViv)) then {
                !vehicleCargoEnabled _vehicle
            } else {
                !(_vehicle getVariable [QGVAR(hasCargo), true])
            };
        } ||
        {
            isNull curatorCamera && // if in Zeus, ignore the checks that follow
            {([ACE_player, _vehicle] call EFUNC(interaction,getInteractionDistance)) >= MAX_LOAD_DISTANCE} &&
            {(vehicle ACE_player) != _vehicle}
        }
    ) exitWith {
        closeDialog 0;

        GVAR(interactionParadrop) = nil;

        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Set ViV on button
    (_display displayCtrl 14) ctrlSetText localize ([LSTRING(vehicleInVehicle), LSTRING(openMenu)] select (GVAR(isViv)));

    // Don't allow switching to other menu if vehicle doesn't have capability for other menu
    if (GVAR(isViv)) then {
        (_display displayCtrl 14) ctrlEnable (_vehicle getVariable [QGVAR(hasCargo), true]);
    } else {
        (_display displayCtrl 14) ctrlEnable (_isVivCapable && {vehicleCargoEnabled _vehicle});
    };

    private _ctrl = _display displayCtrl 100;
    private _label = _display displayCtrl 2;

    // Remove previous entries
    lbClear _ctrl;

    private _loaded = if (GVAR(isViv)) then {
        getVehicleCargo _vehicle
    } else {
        _vehicle getVariable [QGVAR(loaded), []]
    };

    private _maxMass = getNumber (configOf _vehicle >> "VehicleTransport" >> "Carrier" >> "maxLoadMass");

    // Display item names
    {
        private _displayName = [_x, true] call FUNC(getNameItem);
        private _itemSize = _x call FUNC(getSizeItem);
        private _damage = if (_x isEqualType "") then {0} else {damage _x};
        private _damageStr = ((_damage * 100) toFixed 0) + "%";

        if (_itemSize >= 0) then {
            private _index = if (GVAR(interactionParadrop)) then {
                _ctrl lbAdd format ["%1. %2 (%3s)", _forEachIndex + 1, _displayName, GVAR(paradropTimeCoefficent) * _itemSize]
            } else {
                _ctrl lbAdd format ["%1. %2", _forEachIndex + 1, _displayName]
            };

            private _tooltip = format ["%1\n%2", format [LLSTRING(sizeMenu), _itemSize], format ["%1: %2", localize "str_a3_normaldamage1", _damageStr]];
            _ctrl lbSetTooltip [_index, _tooltip];
        } else {
            // If item has a size < 0, it means it's not loadable
            private _index = _ctrl lbAdd _displayName;

            _ctrl lbSetTooltip [_index, LLSTRING(unloadingImpossible)];
            _ctrl lbSetColor [_index, [1, 0, 0, 1]]; // set text to red
            _ctrl lbSetSelectColor [_index, [1, 0, 0, 1]];
        };

        if (GVAR(isViv)) then {
            _maxMass = _maxMass - getMass _x;
        };
    } forEach _loaded;

    if (GVAR(isViv)) then {
        _label ctrlSetText format [LLSTRING(labelSpace), _maxMass max 0];
    } else {
        _label ctrlSetText format [LLSTRING(labelSpace), (_vehicle call FUNC(getCargoSpaceLeft)) max 0];
    };
}, 0, [GVAR(interactionVehicle), _isVivCapable]] call CBA_fnc_addPerFrameHandler;
