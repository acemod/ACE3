#include "..\script_component.hpp"
/*
 * Author: Nelson Duarte, AACO, kymckay
 * Function used to toggle the whole user interface.
 * When toggled on it restores the UI to the state it was in when it was toggled off.
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

{
    private _fade = if (_visible) then {
        1
    } else {
        getNumber (configFile >> QGVAR(display) >> "Controls" >> ctrlClassName _x >> "fade")
    };

    _x ctrlSetFade _fade;
    _x ctrlCommit 0.25;
} forEach [CTRL_LIST, CTRL_TABS, CTRL_CAM_TYPES, CTRL_WIDGET, CTRL_COMPASS];

if (_visible) then {
    // If UI is to be toggled off, save what is currently visible
    GVAR(toggleUiOpenDisplays) = [GVAR(uiHelpVisible), GVAR(uiMapVisible), GVAR(drawUnits), GVAR(drawProjectiles)];

    // Turn help off
    if (GVAR(uiHelpVisible)) then {
        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0.25;
        } forEach [CTRL_HELP_BACK, CTRL_HELP];

        GVAR(uiHelpVisible) = !GVAR(uiHelpVisible);
    };

    // Turn off map
    if (GVAR(uiMapVisible)) then {
        [] call FUNC(ui_toggleMap);
    };

    // Turn unit markers off
    if (GVAR(drawUnits)) then {
        GVAR(drawUnits) = !GVAR(drawUnits);
    };

    // Turn projectile markers off
    if (GVAR(drawProjectiles)) then {
        GVAR(drawProjectiles) = !GVAR(drawProjectiles);
    };
} else {
    // If UI is to be toggled on
    (missionNamespace getVariable [QGVAR(toggleUiOpenDisplays), []]) params [
        ["_helpWasVisible", false],
        ["_mapWasVisible", false],
        ["_unitsWereVisible", false],
        ["_projectilesWereVisible", false]
    ];

    // Turn help on if previously enabled and help is now disabled
    if (_helpWasVisible && !GVAR(uiHelpVisible)) then {
        {
            _x ctrlSetFade (getNumber (configFile >> QGVAR(display) >> "Controls" >> ctrlClassName _x >> "fade"));
            _x ctrlCommit 0.25;
        } forEach [CTRL_HELP_BACK, CTRL_HELP];

        GVAR(uiHelpVisible) = !GVAR(uiHelpVisible);
    };

    // Turn map on if previously enabled and map is now disabled
    if (_mapWasVisible && !GVAR(uiMapVisible)) then {
        [] call FUNC(ui_toggleMap);
    };

    // Turn unit markers on if previously enabled and unit markers are now disabled
    if (_unitsWereVisible && !GVAR(drawUnits)) then {
        GVAR(drawUnits) = !GVAR(drawUnits);
    };

    // Turn projectile markers on if previously enabled and projectile markers are now disabled
    if (_projectilesWereVisible && !GVAR(drawProjectiles)) then {
        GVAR(drawProjectiles) = !GVAR(drawProjectiles);
    };
};

showChat _visible;
playSound (["HintExpand", "HintCollapse"] select !_visible);

GVAR(uiVisible) = !_visible;
