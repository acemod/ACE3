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
	private _cargoTypes = ["Weapon", "Magazine", "Item"];

	{
		private _cargoType = _x;
		{
			if (load _currentContainer <= 1) then {
				break;
			};

			(call compile format ["_currentContainer add%1CargoGlobal [_x, -1];", _cargoType]);
		} forEachReversed (call compile format ["%1Cargo _currentContainer", toLower(_cargoType)]);
	} forEach _cargoTypes;

} forEach (_container select {load _x > 1});