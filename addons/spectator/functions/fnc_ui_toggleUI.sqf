#include "script_component.hpp"
/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Function used to toggle the whole user interface
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_toggleUI
 *
 * Public: No
 */

private _visible = !GVAR(uiVisible);

{
    private _fade = 1;
    if (_visible) then {
        _fade = getNumber (configFile >> QGVAR(display) >> "Controls" >> ctrlClassName _x >> "fade");
    };

    _x ctrlSetFade _fade;
    _x ctrlCommit 0.25;
} forEach [CTRL_LIST, CTRL_TABS, CTRL_CAM_TYPES, CTRL_WIDGET];

showChat !_visible;
playSound (["HintExpand","HintCollapse"] select _visible);

GVAR(uiVisible) = _visible;
