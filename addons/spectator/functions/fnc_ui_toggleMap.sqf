/*
 * Author: Nelson Duarte, AACO
 * Function used to toggle the map
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_toggleMap
 *
 * Public: No
 */

#include "script_component.hpp"

if (GVAR(uiMapVisible)) then {
    CTRL_MAP ctrlShow false;
    CTRL_MAP_GROUP ctrlShow false;

    ctrlSetFocus CTRL_MOUSE;

    // if (GVAR(camMode) == MODE_FREE) then {
    //     GVAR(camera) camCommand "manual on";
    // };
} else {
    CTRL_MAP ctrlShow true;
    CTRL_MAP_GROUP ctrlShow true;

    CTRL_MAP_TITLE ctrlSetText (getMissionConfigValue ["onLoadName", getMissionConfigValue ["briefingName", localize ELSTRING(common,unknown)]]);
    CTRL_MAP_SPEC_NUM ctrlSetText str ({GETVAR(_x,GVAR(isSet),false)} count allPlayers);

    CTRL_MAP ctrlMapAnimAdd [0, 0.05, getPosASLVisual GVAR(camera)];
    ctrlMapAnimCommit CTRL_MAP;

    // Disable camera input while map is open
    // GVAR(camera) camCommand "manual off";
};

// Toggle the tracking variable
GVAR(uiMapVisible) = !GVAR(uiMapVisible);

// Reset highlighted object
GVAR(uiMapHighlighted) = objNull;
