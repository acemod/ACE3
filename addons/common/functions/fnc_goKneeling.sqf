#include "..\script_component.hpp"
/*
 * Author: commy2
 * Move unit to kneeling position (only if not yet prone and not underwater).
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_common_fnc_goKneeling
 *
 * Public: No
 */

params ["_unit"];

// Animation changes even inside vehicle post-1.60
if (stance _unit == "PRONE" || {!isNull objectParent _unit} || {_unit call EFUNC(common,isSwimming)}) exitWith {};

[
    _unit,
    ["AmovPknlMstpSnonWnonDnon", "AmovPknlMstpSlowWrflDnon", "AmovPknlMstpSrasWlnrDnon", "AmovPknlMstpSlowWpstDnon", "AmovPknlMstpSoptWbinDnon"] select ((["", primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit, binocular _unit] find currentWeapon _unit) max 0)
] call FUNC(doAnimation);
