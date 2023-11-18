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
    (_display displayCtrl 13) ctrlEnable false;
};

[{
    params ["_vehicle", "_pfhID"];

    disableSerialization;

    private _display = uiNamespace getVariable QGVAR(menuDisplay);

    if (isNil "_display") exitWith {
        GVAR(interactionVehicle) = nil;
        GVAR(interactionParadrop) = nil;

        _pfhID call CBA_fnc_removePerFrameHandler;
    };

    // Close menu if in invalid state
    if (
        !alive _vehicle ||
        {locked _vehicle >= 2} ||
        {!(_vehicle getVariable [QGVAR(hasCargo), true])} || // if the cargo menu could be opened, the vehicle has QGVAR(hasCargo) in its config or the variable is set using FUNC(setSpace)
        {(([ACE_player, _vehicle] call EFUNC(interaction,getInteractionDistance)) >= MAX_LOAD_DISTANCE) && {(vehicle ACE_player) != _vehicle}}
    ) exitWith {
        closeDialog 0;

        GVAR(interactionVehicle) = nil;
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

    {
        _displayName = [_x, true] call FUNC(getNameItem);
        _itemSize = _x call FUNC(getSizeItem);

        if (_itemSize >= 0) then {
            _index = if (GVAR(interactionParadrop)) then {
                _ctrl lbAdd format ["%1 (%2s)", _displayName, GVAR(paradropTimeCoefficent) * _itemSize]
            } else {
                _ctrl lbAdd _displayName
            };

            _ctrl lbSetTooltip [_index, format [LLSTRING(sizeMenu), _itemSize]];
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
