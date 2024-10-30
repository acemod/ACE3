#include "..\script_component.hpp"
/*
 * Author: Nelson Duarte, AACO, kymckay
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

private _visible = GVAR(uiVisible);

if (_visible) then {
    // If UI is to be toggled off
    GVAR(toggleUiOpenDisplays) = [false, false];

    {
        _x ctrlSetFade 1;
        _x ctrlCommit 0.25;
    } forEach [CTRL_LIST, CTRL_TABS, CTRL_CAM_TYPES, CTRL_WIDGET];

    // Turn help off
    if (GVAR(uiHelpVisible)) then {
        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0.25;
        } forEach [CTRL_HELP_BACK, CTRL_HELP];

        GVAR(uiHelpVisible) = !GVAR(uiHelpVisible);

        GVAR(toggleUiOpenDisplays) set [0, true];
    };

    // Turn off map
    if (GVAR(uiMapVisible)) then {
        [] call FUNC(ui_toggleMap);

        GVAR(toggleUiOpenDisplays) set [1, true];
    };
} else {
    // If UI is to be toggled on
    {
        private _fade = getNumber (configFile >> QGVAR(display) >> "Controls" >> ctrlClassName _x >> "fade");

        _x ctrlSetFade _fade;
        _x ctrlCommit 0.25;
    } forEach [CTRL_LIST, CTRL_TABS, CTRL_CAM_TYPES, CTRL_WIDGET];

    (missionNamespace getVariable [QGVAR(toggleUiOpenDisplays), [false, false]]) params ["_helpWasVisible", "_mapWasVisible"];

    // Turn help on if previously enabled and help is now disabled
    if (_helpWasVisible && !GVAR(uiHelpVisible)) then {
        {
            private _fade = getNumber (configFile >> QGVAR(display) >> "Controls" >> ctrlClassName _x >> "fade");

            _x ctrlSetFade _fade;
            _x ctrlCommit 0.25;
        } forEach [CTRL_HELP_BACK, CTRL_HELP];

        GVAR(uiHelpVisible) = !GVAR(uiHelpVisible);
    };

    // Turn map on if previously enabled and help is now disabled
    if (_mapWasVisible && !GVAR(uiMapVisible)) then {
        [] call FUNC(ui_toggleMap);
    };
};

showChat _visible;
playSound (["HintExpand", "HintCollapse"] select !_visible);

GVAR(uiVisible) = !_visible;
