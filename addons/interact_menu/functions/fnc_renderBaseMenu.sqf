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

private ["_distance","_pos","_weaponDir","_ref","_cameraPos","_sPos","_activeActionTree"];

EXPLODE_2_PVT(_this,_object,_baseActionNode);
EXPLODE_1_PVT(_baseActionNode,_actionData);

_distance = _actionData select 8;

// Obtain a 3D position for the action
if((count _this) > 2) then {
    _pos = _this select 2;
} else {
    if(typeName (_actionData select 7) == "ARRAY") then {
        _pos = _object modelToWorldVisual (_actionData select 7);
    } else {
        if ((_actionData select 7) == "weapon") then {
            // Craft a suitable position for weapon interaction
            _weaponDir = _object weaponDirection currentWeapon _object;
            _ref = _weaponDir call EFUNC(common,createOrthonormalReference);
            _pos = (_object modelToWorldVisual (_object selectionPosition "righthand")) vectorAdd ((_ref select 2) vectorMultiply 0.1);
        } else {
            _pos = _object modelToWorldVisual (_object selectionPosition (_actionData select 7));
        };
    };
};

// For non-self actions, exit if the action is too far away or ocluded
if (GVAR(openedMenuType) == 0 && vehicle ACE_player == ACE_player &&
    {
        private ["_headPos","_actualDistance"];
        _headPos = ACE_player modelToWorldVisual (ACE_player selectionPosition "pilot");
        _actualDistance = _headPos distance _pos;

        if (_actualDistance > _distance) exitWith {true};

        if (_distance > 1.0) exitWith {
            // If distance to action is greater than 1.0 m, check LOS
            _line = [_headPos call EFUNC(common,positionToASL), _pos call EFUNC(common,positionToASL), _object, ACE_player];
            lineIntersects _line
        };
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

//EXPLODE_2_PVT(_activeActionTree,_actionData,_actionChildren);

BEGIN_COUNTER(fnc_renderMenus);

[[], _activeActionTree, _sPos, [180,360]] call FUNC(renderMenu);

END_COUNTER(fnc_renderMenus);

END_COUNTER(fnc_renderBaseMenu)

true
