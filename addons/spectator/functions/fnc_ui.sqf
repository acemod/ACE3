/*
 * Author: SilentSpike
 * Handles UI initialisation and destruction
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_init"];

// Close map
openMap [false,false];

// Close any open dialogs
// TODO: Could this be unnecessary? Might have adverse side effects in certain situations
while {dialog} do {
    closeDialog 0;
};

// Note that init and destroy intentionally happen in reverse order
// Init: Vars > Display > UI Stuff
// Destroy: UI Stuff > Display > Vars
if (_init) then {
    // UI visibility tracking
    GVAR(uiVisible) = true;
    GVAR(uiHelpVisible) = true;
    GVAR(uiMapVisible) = true;
    GVAR(uiWidgetVisible) = true;

    // Drawing related
    GVAR(drawProjectiles)       = false;
    GVAR(drawUnits)             = true;
    GVAR(entitiesToDraw)        = [];
    GVAR(grenadesToDraw)        = [];
    GVAR(iconsToDraw)           = [];
    GVAR(projectilesToDraw)     = [];

    // RMB tracking is used for follow camera mode
    GVAR(holdingRMB) = false;

    // List type is used for list updates and interaction
    GVAR(uiListType) = LIST_ENTITIES;

    // Highlighted map object is used for click and drawing events
    GVAR(uiMapHighlighted) = objNull;

    // Holds the current list data
    GVAR(curList) = [];

    // Cache view distance and set spectator default
    GVAR(oldViewDistance) = viewDistance;
    setViewDistance DEFAULT_VIEW_DISTANCE;

    // If counter already exists handle it, otherwise display XEH will handle it
    [GETUVAR(RscRespawnCounter,displayNull)] call FUNC(compat_counter);

    // Create the display
    MAIN_DISPLAY createDisplay QGVAR(display);

    // Store default H value for scaling purposes
    GVAR(uiHelpH) = (ctrlPosition CTRL_HELP) select 3;

    // Initially hide map
    [] call FUNC(ui_toggleMap);

    // Initially fade the list
    [true] call FUNC(ui_fadeList);

    // Initalise the help, widget and list information
    [] call FUNC(ui_updateListEntities);
    [] call FUNC(ui_updateListFocus);
    [] call FUNC(ui_updateWidget);
    [] call FUNC(ui_updateHelp);

    // Start updating things to draw
    GVAR(collectPFH) = [LINKFUNC(ui_updateIconsToDraw), 0.2] call CBA_fnc_addPerFrameHandler;

    // Draw icons and update the cursor object
    GVAR(uiDraw3D) = addMissionEventHandler ["Draw3D", {call FUNC(ui_draw3D)}];

    // Periodically update list and focus widget
    GVAR(uiPFH) = [{
        if (GVAR(uiListType) == LIST_ENTITIES) then {
            [] call FUNC(ui_updateListEntities);
        } else {
            [] call FUNC(ui_updateListLocations);
        };

        [] call FUNC(ui_updateWidget);
    }, 5] call CBA_fnc_addPerFrameHandler;
} else {
    // Stop updating the list and focus widget
    [GVAR(uiPFH)] call CBA_fnc_removePerFrameHandler;

    // Stop drawing icons and tracking cursor object
    removeMissionEventHandler ["Draw3D", GVAR(uiDraw3D)];
    GVAR(uiDraw3D) = nil;

    // Stop updating things to draw
    [GVAR(collectPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(collectPFH) = nil;

    // Destroy the display
    SPEC_DISPLAY closeDisplay 1;

    // Stop tracking everything
    GVAR(uiVisible)         = nil;
    GVAR(uiHelpVisible)     = nil;
    GVAR(uiMapVisible)      = nil;
    GVAR(uiWidgetVisible)   = nil;
    GVAR(holdingRMB)        = nil;
    GVAR(uiListType)        = nil;
    GVAR(uiMapHighlighted)  = nil;
    GVAR(curList)           = nil;
    GVAR(uiHelpH)           = nil;

    // Stop drawing
    GVAR(drawProjectiles)   = nil;
    GVAR(drawUnits)         = nil;
    GVAR(entitiesToDraw)    = nil;
    GVAR(grenadesToDraw)    = nil;
    GVAR(iconsToDraw)       = nil;
    GVAR(projectilesToDraw) = nil;

    // Reset view distance
    setViewDistance GVAR(oldViewDistance);
    GVAR(oldViewDistance) = nil;

    // Ensure chat is shown again
    showChat true;
};
