#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Releases the unit from its anchor. Collision with the anchor stays disabled until
 * the unit is clear of it, otherwise stepping off shoves them back.
 *
 * Arguments:
 * 0: Carry the anchor's velocity into the jump <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_wmo_fnc_detach
 *
 * Public: No
 */

params [["_inherit", false, [false]]];

private _anchor = GVAR(anchor);

if (isNull _anchor) exitWith {};

GVAR(anchor) = objNull;

[QGVAR(detached), [ACE_player, _anchor]] call CBA_fnc_localEvent;

if (_inherit) then {
    // Jumping off a moving vehicle should throw you, not drop you where you stood.
    private _velocity = (velocity ACE_player) vectorAdd (velocity _anchor);
    _velocity set [2, 0];
    ACE_player setVelocity _velocity;
};

private _offset = _anchor worldToModel (getPosATL ACE_player);

[
    {
        params ["_anchor", "_offset"];

        // Re-anchoring to the same object, or losing it, ends the wait.
        _anchor isEqualTo GVAR(anchor)
        || {isNull _anchor}
        || {(_anchor modelToWorld _offset) distance (getPosATL ACE_player) > DETACH_DISTANCE}
    },
    {
        params ["_anchor"];

        if (_anchor isEqualTo GVAR(anchor)) exitWith {};

        GVAR(collisionEnabled) = true;
        [_anchor, true] call FUNC(setCollision);

        if (isMultiplayer && {!isNull _anchor} && {!local _anchor}) then {
            [ACE_player, _anchor] remoteExecCall ["enableCollisionWith", _anchor];
        };
    },
    [_anchor, _offset]
] call CBA_fnc_waitUntilAndExecute;
