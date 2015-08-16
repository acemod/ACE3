/*
 * Author: Glowbal
 * Handle the UI data display
 *
 * Arguments:
 * 0: display <DISPLAY>
 *
 * Return value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

disableSerialization;
params["_display"];

uiNamespace setvariable [QGVAR(menuDisplay), _display];

[{
    private ["_display","_loaded", "_ctrl", "_label"];
    disableSerialization;
    _display = uiNamespace getvariable QGVAR(menuDisplay);
    if (isnil "_display") exitwith {
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    if (isNull GVAR(interactionVehicle) || ACE_player distance GVAR(interactionVehicle) >= 10) exitwith {
        closeDialog 0;
        [_this select 1] call CBA_fnc_removePerFrameHandler;
    };

    _loaded = GVAR(interactionVehicle) getvariable [QGVAR(loaded), []];
    _ctrl = _display displayCtrl 100;
    _label = _display displayCtrl 2;

    lbClear _ctrl;
    {
        _ctrl lbAdd (getText(configfile >> "CfgVehicles" >> typeOf _x >> "displayName"));
        true
    } count _loaded;

    _label ctrlSetText format[localize LSTRING(labelSpace), [GVAR(interactionVehicle)] call DFUNC(getCargoSpaceLeft)];
}, 0, []] call CBA_fnc_addPerFrameHandler;
