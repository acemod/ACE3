/*
 * Author: SilentSpike
 * Initalises the `radius` zeus module attribute
 *
 * Arguments:
 * 0: radius controls group <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL] call ace_zeus_fnc_ui_attributeRadius
 *
 * Public: No
 */

#include "script_component.hpp"

//Generic Init:
params ["_control"];
private _display = ctrlParent _control;

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
private _edit = _control controlsGroupCtrl 26467;

_edit ctrlSetText "100";

private _fnc_onKeyUp = {
    params ["_display"];

    private _edit = _display displayCtrl 26467;
    private _radius = parseNumber (ctrlText _edit);

    // Handle invalid radius (non-numerical input)
    if (_radius == 0) then {
        _edit ctrlSetTooltip (localize LSTRING(AttributeRadiusInvalid));
        _edit ctrlSetTextColor [1,0,0,1];
    } else {
        _edit ctrlSetTooltip "";
        _edit ctrlSetTextColor [1,1,1,1];
        SETVAR(_display,GVAR(radius),_radius);
    };
};

[_display] call _fnc_onKeyUp;
_display displayAddEventHandler ["keyUp", _fnc_onKeyUp];
