#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handle the UI data display.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call ace_cargo_fnc_onMenuOpen
 *
 * Public: No
 */

disableSerialization;

params ["_display"];

uiNamespace setVariable [QGVAR(menuDisplay), _display];

if (GVAR(interactionParadrop)) then {
    (_display displayCtrl 12) ctrlSetText (localize LSTRING(paradropButton));
};

[{
    disableSerialization;
    private _display = uiNamespace getVariable QGVAR(menuDisplay);
    if (isnil "_display") exitWith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (isNull GVAR(interactionVehicle) || {(([ACE_player, GVAR(interactionVehicle)] call EFUNC(interaction,getInteractionDistance)) >= MAX_LOAD_DISTANCE) && {(vehicle ACE_player) != GVAR(interactionVehicle)}}) exitWith {
        closeDialog 0;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    private _loaded = GVAR(interactionVehicle) getVariable [QGVAR(loaded), []];
    private _ctrl = _display displayCtrl 100;
    private _label = _display displayCtrl 2;

    lbClear _ctrl;
    {
        private _class = if (_x isEqualType "") then {_x} else {typeOf _x};
        private _displayName = getText (configfile >> "CfgVehicles" >> _class >> "displayName");
        if (GVAR(interactionParadrop)) then {
            _ctrl lbAdd format ["%1 (%2s)", _displayName, GVAR(paradropTimeCoefficent) * ([_class] call FUNC(getSizeItem))];
        } else {
            _ctrl lbAdd _displayName;
        };

        true
    } count _loaded;

    _label ctrlSetText format[localize LSTRING(labelSpace), [GVAR(interactionVehicle)] call DFUNC(getCargoSpaceLeft)];
}, 0, []] call CBA_fnc_addPerFrameHandler;
