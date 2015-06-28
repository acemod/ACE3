/*
 * Author: NouberNou and esteldunedain
 * Render the interaction menu for a base action
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Action node <ARRAY>
 * 2: 3D position or 2D position <ARRAY> (Optional)
 *
 * Return value:
 * Was the menu rendered <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

BEGIN_COUNTER(fnc_renderBaseMenu)

private ["_distance","_pos","_weaponDir","_ref","_sPos","_activeActionTree", "_line"];

EXPLODE_2_PVT(_this,_object,_baseActionNode);
EXPLODE_1_PVT(_baseActionNode,_actionData);

_distance = _actionData select 8;

// Obtain a 3D position for the action
_pos = if((count _this) > 2) then {
    _this select 2
} else {
    // Setup scope variables for position code
    private ["_target"];
    _target = _object;

    // Get action position
    _object modelToWorldVisual (call (_actionData select 7))
};

// For non-self actions, exit if the action is too far away or ocluded
if (GVAR(openedMenuType) == 0 && (vehicle ACE_player == ACE_player) && (isNull curatorCamera) &&
    {
        private ["_headPos","_actualDistance"];
        _headPos = ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot");
        _actualDistance = _headPos distance _pos;

        if (_actualDistance > _distance) exitWith {true};

        if (_actualDistance > 1.5) exitWith {
            // If distance to action is greater than 1.5 m, check LOS
            _line = [_headPos call EFUNC(common,positionToASL), _pos call EFUNC(common,positionToASL), _object, ACE_player];
            lineIntersects _line
        };
        false
    }) exitWith {false};

// Exit if the action is behind you
_sPos = if (count _pos != 2) then {
    worldToScreen _pos
} else {
    _pos
};
if(count _sPos == 0) exitWith {false};

// Exit if the action is off screen
if ((_sPos select 0) < safeZoneXAbs || (_sPos select 0) > safeZoneXAbs + safeZoneWAbs) exitWith {false};
if ((_sPos select 1) < safeZoneY    || (_sPos select 1) > safeZoneY    + safeZoneH) exitWith {false};


BEGIN_COUNTER(fnc_collectActiveActionTree)

// Collect active tree
private "_uid";
_uid = format [QGVAR(ATCache_%1), _actionData select 0];
_activeActionTree = [
                        [_object, _baseActionNode, []],
                        DFUNC(collectActiveActionTree),
                        _object, _uid, 1.0, "interactMenuClosed"
                    ] call EFUNC(common,cachedCall);

END_COUNTER(fnc_collectActiveActionTree)

/*
diag_log "Printing: _activeActionTree";
_fnc_print = {
    EXPLODE_2_PVT(_this,_level,_node);
    EXPLODE_3_PVT(_node,_actionData,_children,_object);
    diag_log text format ["Level %1 -> %2 on %3", _level, _actionData select 0, _object];
    {
        [_level + 1, _x] call _fnc_print;
    } forEach _children;
};
[0, _activeActionTree] call _fnc_print;
*/
// Check if there's something left for rendering
if (count _activeActionTree == 0) exitWith {false};

BEGIN_COUNTER(fnc_renderMenus);

// IGNORE_PRIVATE_WARNING(_cameraPos,_cameraDir);
if (count _pos > 2) then {
    _sPos pushBack (((_pos call EFUNC(common,positionToASL)) vectorDiff _cameraPos) vectorDotProduct _cameraDir);
} else {
    _sPos pushBack 0;
};

// Add action point for oclusion and rendering
GVAR(collectedActionPoints) pushBack [_sPos select 2, _sPos, _activeActionTree];

END_COUNTER(fnc_renderMenus);

END_COUNTER(fnc_renderBaseMenu)

true
