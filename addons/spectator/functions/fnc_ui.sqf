#include "script_component.hpp"
/*
 * Author: SilentSpike
 * Handles UI initialisation and destruction
 *
 * Arguments:
 * 0: Init/Terminate <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_spectator_fnc_ui
 *
 * Public: No
 */

params ["_init"];
TRACE_1("ui",_init);

// No change
if (_init isEqualTo !isNull SPEC_DISPLAY) exitWith {};

// Close map
openMap [false,false];

// Close any open dialogs
while {dialog} do {
    closeDialog 0;
};

// Controls some PP effects, but a little unclear which
BIS_fnc_feedback_allowPP = !_init;

// Removes death blur if present
if !(isNil "BIS_DeathBlur") then {
    BIS_DeathBlur ppEffectAdjust [0];
    BIS_DeathBlur ppEffectCommit 0;
};

// Note that init and destroy intentionally happen in reverse order
// Init: Vars > Display > UI Stuff
// Destroy: UI Stuff > Display > Vars
if (_init) then {
    // UI visibility tracking
    GVAR(uiVisible)         = true;
    GVAR(uiHelpVisible)     = true;
    GVAR(uiMapVisible)      = true;
    GVAR(uiWidgetVisible)   = true;

    // Drawing related
    GVAR(drawProjectiles)   = false;
    GVAR(drawUnits)         = true;
    GVAR(entitiesToDraw)    = [];
    GVAR(grenadesToDraw)    = [];
    GVAR(iconsToDraw)       = [];
    GVAR(projectilesToDraw) = [];

    // RMB tracking is used for follow camera mode
    GVAR(holdingRMB) = false;

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
    [] call FUNC(ui_updateCamButtons);
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
        [] call FUNC(ui_updateListEntities);
        [] call FUNC(ui_updateWidget);
    }, 5] call CBA_fnc_addPerFrameHandler;

    // register grenade track EH
    GVAR(grenadeTrackingEH) = [
        QGVAR(addToGrenadeTracking), {
            params [["_projectile", objNull, [objNull]]];
            if (GVAR(drawProjectiles) && {!isNull _projectile}) then {
                if (count GVAR(grenadesToDraw) > MAX_GRENADES) then { GVAR(grenadesToDraw) deleteAt 0; };
                GVAR(grenadesToDraw) pushBack _projectile;
            };
        }
    ] call CBA_fnc_addEventHandler;

    // register projectile track EH
    GVAR(projectileTrackingEH) = [
        QGVAR(addToProjectileTracking), {
            params [["_projectile", objNull, [objNull]]];
            if (GVAR(drawProjectiles) && {!isNull _projectile}) then {
                if (count GVAR(projectilesToDraw) > MAX_PROJECTILES) then { GVAR(projectilesToDraw) deleteAt 0; };
                GVAR(projectilesToDraw) pushBack [_projectile, [[getPosVisual _projectile, [1,0,0,0]]]];
            };
        }
    ] call CBA_fnc_addEventHandler;

    // register advanced throwing EH
    GVAR(advancedThrowingEH) = [
        QEGVAR(advanced_throwing,throwFiredXEH), {
            // Fire time used for unit icon highlighting
            (_this select 0) setVariable [QGVAR(highlightTime), time + FIRE_HIGHLIGHT_TIME];

            // add grenade to tracking
            [QGVAR(addToGrenadeTracking), [_this select 6]] call CBA_fnc_localEvent;
        }
    ] call CBA_fnc_addEventHandler;
} else {
    // Stop updating the list and focus widget
    [GVAR(uiPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(uiPFH) = nil;

    // Stop drawing icons and tracking cursor object
    removeMissionEventHandler ["Draw3D", GVAR(uiDraw3D)];
    GVAR(uiDraw3D) = nil;

    // Stop updating things to draw
    [GVAR(collectPFH)] call CBA_fnc_removePerFrameHandler;
    GVAR(collectPFH) = nil;

    // remove advanced throwing EH
    [QEGVAR(advanced_throwing,throwFiredXEH), GVAR(advancedThrowingEH)] call CBA_fnc_removeEventHandler;
    GVAR(advancedThrowingEH) = nil;

    // remove projectile track EH
    [QGVAR(addToProjectileTracking), GVAR(projectileTrackingEH)] call CBA_fnc_removeEventHandler;
    GVAR(projectileTrackingEH) = nil;

    // remove grenade track EH
    [QGVAR(addToGrenadeTracking), GVAR(grenadeTrackingEH)] call CBA_fnc_removeEventHandler;
    GVAR(grenadeTrackingEH) = nil;

    // Destroy the display
    SPEC_DISPLAY closeDisplay 1;

    // Stop tracking everything
    GVAR(uiVisible)         = nil;
    GVAR(uiHelpVisible)     = nil;
    GVAR(uiMapVisible)      = nil;
    GVAR(uiWidgetVisible)   = nil;
    GVAR(holdingRMB)        = nil;
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
