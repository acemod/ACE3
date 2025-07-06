#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43, mrschick, Redwan S. / Nomas, Sky / Esmeray6
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

private _cargoTypes = ["Weapon", "Magazine", "Item", "Backpack"];

{
    private _currentContainer = _x;

    {
        private _cargoType = _x;
        private _cargoList = switch (_cargoType) do {
            case "Weapon": {weaponCargo _currentContainer};
            case "Magazine": {magazineCargo _currentContainer};
            case "Item": {itemCargo _currentContainer};
            case "Backpack": {backpackCargo _currentContainer};
        };

        {
            if (load _currentContainer <= 1) then {
                break;
            };
            
            switch (_cargoType) do {
                case "Weapon": {_currentContainer addWeaponCargoGlobal [_x, -1]};
                case "Magazine": {_currentContainer addMagazineCargoGlobal [_x, -1]};
                case "Item": {_currentContainer addItemCargoGlobal [_x, -1]};
                case "Backpack": {_currentContainer addBackpackCargoGlobal [_x, -1]};
            };
        } forEachReversed _cargoList;
    } forEach _cargoTypes;
} forEach (_container select {load _x > 1});
