#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Enables or disables collision between the local unit and an anchor, including
 * anything attached to it. Without this the unit is shoved off by the moving geometry.
 *
 * Arguments:
 * 0: Anchor <OBJECT>
 * 1: Enable collision <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, false] call ace_wmo_fnc_setCollision
 *
 * Public: No
 */

params ["_anchor", "_enable"];

if (isNull _anchor) exitWith {};

if (_enable) then {
    ACE_player enableCollisionWith _anchor;
} else {
    ACE_player disableCollisionWith _anchor;
};

{
    [_x, _enable] call FUNC(setCollision);
} forEach attachedObjects _anchor;
