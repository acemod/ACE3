/*
 * Author: commy2
 * Move unit to kneeling position.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (stance _unit == "PRONE") exitWith {};

[
    _unit,
    ["AmovPknlMstpSnonWnonDnon", "AmovPknlMstpSlowWrflDnon", "AmovPknlMstpSrasWlnrDnon", "AmovPknlMstpSlowWpstDnon", "AmovPknlMstpSoptWbinDnon"] select ((["", primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit, binocular _unit] find currentWeapon _unit) max 0)
] call FUNC(doAnimation);
