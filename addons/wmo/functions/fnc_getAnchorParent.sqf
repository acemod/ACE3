#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Walks up an attachTo chain to the object that actually moves, so a unit standing
 * on something bolted to a vehicle follows the vehicle rather than the attachment.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Outermost parent, or the object itself <OBJECT>
 *
 * Example:
 * [cursorObject] call ace_wmo_fnc_getAnchorParent
 *
 * Public: No
 */

params ["_object"];

// attachedTo returns objNull at the top of the chain. A loop avoids the original's
// unbounded recursion, which could stack overflow on a cyclic attachment.
private _guard = 0;

while {!isNull (attachedTo _object) && {_guard < 16}} do {
    _object = attachedTo _object;
    _guard = _guard + 1;
};

_object
