/*
 * Author: NouberNou and esteldunedain
 * Render the interaction menu for a base action
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Action node <ARRAY>
 * 2: 3D position or 2D position <ARRAY> (Optional)
 *
 * Return Value:
 * Was the menu rendered <BOOL>
 *
 * Example:
 * [bob, [node], [0, 0, 0]] call ACE_interact_menu_fnc_renderBaseMenu
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(fnc_renderBaseMenu)

params ["_object", "_baseActionNode"];
_baseActionNode params ["_actionData"];
_actionData params ["_actionName", "", "", "", "", "", "", "_positionCode", "_distance", "_params"];


// Obtain a 3D position for the action
private _pos = if((count _this) > 2) then {
    _this select 2
} else {
    // Setup scope variables for position code
    private _target = _object;

    // Get action position
    _object modelToWorldVisual (call _positionCode)
};

// For non-self actions, exit if the action is too far away or ocluded
private _distanceToBasePoint = 0; //This will be 0 for self/zeus/in-vehicle (used later to check sub action distance)
if ((GVAR(openedMenuType) == 0) && {isNull (ACE_controlledUAV select 0)} && {vehicle ACE_player == ACE_player} && {isNull curatorCamera} &&
    {
        private _headPos = ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot");
        _distanceToBasePoint = _headPos distance _pos;

        if (_distanceToBasePoint > _distance) exitWith {true};

        if ((_distanceToBasePoint > 1.2) && {!(_params select 4)}) exitWith {
            // If distance to action is greater than 1.2 m and check isn't disabled in params, check LOS
            lineIntersects [AGLtoASL _headPos, AGLtoASL _pos, _object, ACE_player]
        };
        false
    }) exitWith {false};

// Exit if the action is behind you
private _sPos = if (count _pos != 2) then {
    worldToScreen _pos
} else {
    _pos
};
if (_sPos isEqualTo []) exitWith {false};

// Exit if the action is off screen
if ((_sPos select 0) < safeZoneXAbs || {(_sPos select 0) > safeZoneXAbs + safeZoneWAbs}) exitWith {false};
if ((_sPos select 1) < safeZoneY    || {(_sPos select 1) > safeZoneY    + safeZoneH}) exitWith {false};


BEGIN_COUNTER(fnc_collectActiveActionTree);

// Collect active tree
private _uid = format [QGVAR(ATCache_%1), _actionName];
private _activeActionTree = [
                        [_object, _baseActionNode, [], _distanceToBasePoint],
                        DFUNC(collectActiveActionTree),
                        _object, _uid, 1.0, "ace_interactMenuClosed"
                    ] call EFUNC(common,cachedCall);

END_COUNTER(fnc_collectActiveActionTree);

#ifdef DEBUG_MODE_EXTRA
diag_log "Printing: _activeActionTree";
[0, _activeActionTree] call {
    params ["_level", "_node"];
    _node params ["_actionData", "_children", "_object"];
    diag_log text format ["Level %1 -> %2 on %3", _level, _actionData select 0, _object];
};
#endif

// Check if there's something left for rendering
if (_activeActionTree isEqualTo []) exitWith {false};

BEGIN_COUNTER(fnc_renderMenus);

if (count _pos > 2) then {
    _sPos pushBack (((AGLtoASL _pos) vectorDiff GVAR(cameraPosASL)) vectorDotProduct GVAR(cameraDir));
} else {
    _sPos pushBack 0;
};

// Add action point for oclusion and rendering
GVAR(collectedActionPoints) pushBack [_sPos select 2, _sPos, _activeActionTree];

END_COUNTER(fnc_renderMenus);

END_COUNTER(fnc_renderBaseMenu);

true
