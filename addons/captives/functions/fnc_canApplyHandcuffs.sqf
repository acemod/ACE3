/*
 * Author: PabstMirror
 * Checks the conditions for being able to apply handcuffs
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canApplyHandcuffs
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];
//Check sides, Player has cableTie, target is alive and not already handcuffed

(GVAR(allowHandcuffOwnSide) || {(side _unit) != (side _target)}) &&
{"ACE_CableTie" in (items _unit)} &&
{alive _target} &&
{!(_target getVariable [QGVAR(isHandcuffed), false])} &&
{
    (_target getVariable ["ACE_isUnconscious", false]) || //isUnconscious
    {!GVAR(requireSurrenderAi) && {!([_target] call EFUNC(common,isPlayer))}} || //is an AI (not a player) and doesn't require surrendering
    {GVAR(requireSurrender) == 0} || //or don't require surrendering
    {_target getVariable [QGVAR(isSurrendering), false]} ||  //or is surrendering
    {(GVAR(requireSurrender) == 2) && {(currentWeapon _target) == ""}} //or "SurrenderOrNoWeapon" and no weapon
}
