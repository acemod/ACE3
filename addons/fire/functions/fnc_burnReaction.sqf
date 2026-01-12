#include "..\script_component.hpp"
/*
 * Author: tcvm, veteran29
 * Handles burning reactions of an unit, like screaming or throwing the weapons away due to pain.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit"];

if (
    GVAR(dropWeapon) > 0 &&
    {isNull objectParent _unit} &&
    {(currentWeapon _unit) != ""} &&
    {!isPlayer _unit || GVAR(dropWeapon) == 2}
) then {
    _unit call EFUNC(common,throwWeapon);
};

// There is a potential issue if a client side mod defines new sounds and adds them
// Since the class that's broadcasted would not be defined on other clients
private _scream = selectRandom (_unit call FUNC(getScreamSounds));
if (!isNil "_scream" && {_scream != ""}) then {
    [QGVAR(playScream), [_scream, _unit]] call CBA_fnc_globalEvent;
};
