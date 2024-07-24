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

// Disable deploy option if paradropping or in Zeus
(_display displayCtrl 13) ctrlEnable (GVAR(enableDeploy) && !GVAR(interactionParadrop) && {isNull curatorCamera});

[{
    params ["_vehicle", "_pfhID"];

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
        {!(_vehicle getVariable [QGVAR(hasCargo), true])} || // if the cargo menu could be opened, the vehicle has QGVAR(hasCargo) in its config or the variable is set using FUNC(setSpace)
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

    private _ctrl = _display displayCtrl 100;
    private _label = _display displayCtrl 2;

    // Remove previous entries
    lbClear _ctrl;

    // Display item names
    private _displayName = "";
    private _itemSize = 0;
    private _index = -1;
    private _damageStr = "0%";
    private _damage = 0;

    {
        _displayName = [_x, true] call FUNC(getNameItem);
        _itemSize = _x call FUNC(getSizeItem);
        _damage = if (_x isEqualType "") then {0} else {damage _x};
        _damageStr = ((_damage * 100) toFixed 0) + "%";

        if (_itemSize >= 0) then {
            _index = if (GVAR(interactionParadrop)) then {
                _ctrl lbAdd format ["%1. %2 (%3s)", _forEachIndex + 1, _displayName, GVAR(paradropTimeCoefficent) * _itemSize]
            } else {
                _ctrl lbAdd format ["%1. %2", _forEachIndex + 1, _displayName]
            };

            private _tooltip = format ["%1\n%2", format [LLSTRING(sizeMenu), _itemSize], format ["%1: %2", localize "str_a3_normaldamage1", _damageStr]];
            _ctrl lbSetTooltip [_index, _tooltip];
        } else {
            // If item has a size < 0, it means it's not loadable
            _index = _ctrl lbAdd _displayName;

            _ctrl lbSetTooltip [_index, LLSTRING(unloadingImpossible)];
            _ctrl lbSetColor [_index, [1, 0, 0, 1]]; // set text to red
            _ctrl lbSetSelectColor [_index, [1, 0, 0, 1]];
        };
    } forEach (_vehicle getVariable [QGVAR(loaded), []]);

    _label ctrlSetText format [LLSTRING(labelSpace), (_vehicle call FUNC(getCargoSpaceLeft)) max 0];
}, 0, GVAR(interactionVehicle)] call CBA_fnc_addPerFrameHandler;
