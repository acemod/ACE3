#include "..\script_component.hpp"
/*
 * Author: Bloodwyn, LinkIsGrim
 * Suppresses the self inflicted collision damage caused by standing on a moving
 * anchor. Collision is disabled while anchored, but the engine still reports a
 * sourceless impact when the geometry catches up with the unit.
 *
 * Arguments:
 * Arguments of the "HandleDamage" event handler. <ARRAY>
 *
 * Return Value:
 * Damage to apply, or nil to leave it to other handlers <NUMBER>
 *
 * Example:
 * _this call ace_wmo_fnc_handleDamage
 *
 * Public: No
 */

params ["_unit", "", "_damage", "_source", "_projectile", "", "_instigator"];

if (!local _unit) exitWith {};
if (isNull GVAR(anchor) && {GVAR(collisionEnabled)}) exitWith {};

// A collision with the thing we are riding reports the unit as its own source, with
// no projectile and no instigator. Anything else is real damage.
if (_source isEqualTo _unit && {_projectile isEqualTo ""} && {isNull _instigator}) exitWith {
    ACE_player disableCollisionWith GVAR(anchor);
    0
};

_damage
