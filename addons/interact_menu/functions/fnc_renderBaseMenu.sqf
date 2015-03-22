/*
 * Author: NouberNou and CAA-Picard
 * Render the interaction menu for a base action
 *
 * Argument:
 * 0: Object <OBJECT>
 * 1: Action node <ARRAY>
 * 2: 3D position <ARRAY> (Optional)
 *
 * Return value:
 * Was the menu rendered <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_distance","_pos","_weaponDir","_ref","_cameraPos","_sPos","_activeActionTree"];

EXPLODE_2_PVT(_this,_object,_baseActionNode);
EXPLODE_1_PVT(_baseActionNode,_actionData);

_distance = _actionData select 8;

// Obtain a 3D position for the action
if((count _this) > 2) then {
    _pos = _this select 2;
} else {
    if(typeName (_actionData select 7) == "ARRAY") then {
        _pos = _object modelToWorld (_actionData select 7);
    } else {
        if ((_actionData select 7) == "weapon") then {
            // Craft a suitable position for weapon interaction
            _weaponDir = _object weaponDirection currentWeapon _object;
            _ref = _weaponDir call EFUNC(common,createOrthonormalReference);
            _pos = (_object modelToWorld (_object selectionPosition "righthand")) vectorAdd ((_ref select 2) vectorMultiply 0.1);
        } else {
            _pos = _object modelToWorld (_object selectionPosition (_actionData select 7));
        };
    };
    // Compensate for movement during the frame to get rid of jittering
    _pos = _pos vectorAdd ((visiblePositionASL _object) vectorDiff (getPosASL _object));
};

_cameraToActionVec = (_pos call EFUNC(common,positionToASL)) vectorDiff ((positionCameraToWorld [0,0,0]) call EFUNC(common,positionToASL));
GVAR(refSystem) = _cameraToActionVec call EFUNC(common,createOrthonormalReference);

// For non-self actions, exit if the action is too far away
if (GVAR(keyDown) &&
    {(ACE_player modelToWorld (ACE_player selectionPosition "pilot")) distance _pos >= _distance}) exitWith {false};

// Exit if the action is behind you
_sPos = worldToScreen _pos;
if(count _sPos == 0) exitWith {false};

// Exit if the action is off screen
if ((_sPos select 0) < safeZoneXAbs || (_sPos select 0) > safeZoneXAbs + safeZoneWAbs) exitWith {false};
if ((_sPos select 1) < safeZoneY    || (_sPos select 1) > safeZoneY    + safeZoneH) exitWith {false};


// Collect active tree
private "_uid";
_uid = format [QGVAR(ATCache_%1), _actionData select 0];
_activeActionTree = [
                        [_object, _baseActionNode, []],
                        DFUNC(collectActiveActionTree),
                        _object, _uid, 1.0, "interactMenuClosed"
                    ] call EFUNC(common,cachedCall);

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

[[], _activeActionTree, _pos, [180,360]] call FUNC(renderMenu);

true
