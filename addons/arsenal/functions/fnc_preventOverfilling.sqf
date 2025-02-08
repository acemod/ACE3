#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43, mrschick
 * Checks the current loadout of the given unit for inventory containers (uniform/vest/backpack) filled beyond their max load, removing excess items if present.
 *
 * Arguments:
 * 0: Unit to check for overfill <OBJECT>
 * 1: Which container to check. If unit, will go through all containers starting from uniform <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_unit", ["_container", objNull]];

if (isNull _container || _container isEqualTo _unit) then {
    _container = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
} else {
    _container = [_container];
};

{
    private _currentContainer = _x;
    {
        _currentContainer addItemCargoGlobal [_x, -1];

        if (load _currentContainer <= 1) then {
            break;
        };
    } forEachReversed (itemCargo _currentContainer);
} forEach (_container select {load _x > 1});
