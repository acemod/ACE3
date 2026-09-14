#include "script_component.hpp"

["weapon", FUNC(onWeaponChange)] call CBA_fnc_addPlayerEventHandler;

["unit", {
    params ["_newUnit", "_oldUnit"];

    private _inventoryEHs = _oldUnit getVariable [QGVAR(inventoryEHs), [-1, -1]];
    _oldUnit removeEventHandler ["InventoryOpened", _inventoryEHs#0];
    _oldUnit removeEventHandler ["InventoryClosed", _inventoryEHs#1];

    _inventoryEHs = [
        _newUnit addEventHandler ["InventoryOpened", {
            params ["", "_firstContainer", "_secondContainer"];

            // If only one container was opened, pretend it's both box and ground
            // WOB holder sometimes gets opened for a frame, but is immediately
            // closed and should never be accessed anyways
            if (isNull _secondContainer || {typeOf _secondContainer == QGVAR(weaponHolder)}) then {
                _secondContainer = _firstContainer;
            };
            GVAR(openedContainers) = [_firstContainer, _secondContainer];
        }],
        _newUnit addEventHandler ["InventoryClosed", {
            GVAR(openedContainers) = [objNull, objNull];
        }]
    ];

    _newUnit setVariable [QGVAR(inventoryEHs), _inventoryEHs];
}, true] call CBA_fnc_addPlayerEventHandler;

["loadout", {
    // One frame delay, because dropping from inventory isn't instant but still handled by us
    // See also fnc_onDragWOB
    [{
        private _hasWeaponHolder = !isNull (ACE_player getVariable [QGVAR(weaponHolder), objNull]);
        private _hasFakeWeapon = secondaryWeapon ACE_player == QGVAR(weapon);

        if !(_hasWeaponHolder isEqualTo _hasFakeWeapon) then {
            [ACE_player] call FUNC(remove);
        };
    }] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addPlayerEventHandler;
