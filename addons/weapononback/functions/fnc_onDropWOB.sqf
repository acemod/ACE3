#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles dropping the weapon on the back onto a container.
 *
 * Arguments:
 * 0: Dropped onto primary weapon slot <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
params [["_droppedOntoPrimary", false]];

if (_droppedOntoPrimary) then {
    [] call FUNC(swap);
} else {
    // Find container the weapon was dropped into
    private _possibleContainers = if (QGVAR(weapon) in weapons ACE_player) then {
        [
            // Ordered by likelyhood
            backpackContainer ACE_player,
            vestContainer ACE_player,
            uniformContainer ACE_player
        ]
    } else {
        if (GVAR(openedContainers)#0 isKindOf "CAManBase") then {
            // Weapons cannot be dropped onto dead bodies
            [
                // If the dropped primary of the unit wasn't taken yet, that holder is used
                GVAR(openedContainers)#0 getVariable [QGVAR(droppedWeaponHolder), objNull],
                // Otherwise a new one is created dynamically
                nearestObject [ACE_player, "GroundWeaponHolder"]
            ]
        } else {
            GVAR(openedContainers)
        }
    };

    private _container = {
        if (QGVAR(weapon) in weaponCargo _x) exitWith { _x };
    } forEach _possibleContainers;

    // Remove and replace fake weapon with actual weapon
    private _weaponsItems = [ACE_player] call FUNC(get);
    private _allWeaponsItems = weaponsItemsCargo _container;
    _allWeaponsItems deleteAt (_allWeaponsItems findIf { _x#0 == QGVAR(weapon) });

    if (_container canAdd _weaponsItems#0) then {
        _allWeaponsItems pushBack _weaponsItems;
        [ACE_player] call FUNC(remove);
    } else {
        // If container cannot fit weapon on back, readd fake weapon to player, show hint
        ACE_player addWeapon QGVAR(weapon);

        private _containerCfg = switch (_container) do {
            case (backpackContainer ACE_player): {
                configFile >> "CfgWeapons" >> backpack ACE_player
            };
            case (vestContainer ACE_player): {
                configFile >> "CfgWeapons" >> vest ACE_player
            };
            case (uniformContainer ACE_player): {
                configFile >> "CfgWeapons" >> uniform ACE_player
            };
            default {
                configFile >> "CfgVehicles" >> typeOf _container
            };
        };

        [
            format [
                LLSTRING(CouldNotFit),
                getText (configFile >> "CfgWeapons" >> _weaponsItems#0 >> "displayName"),
                getText (_containerCfg >> "displayName")
            ],
            true, 5
        ] call EFUNC(common,displayText);
    };

    clearWeaponCargoGlobal _container;
    {
        _container addWeaponWithAttachmentsCargoGlobal [_x, 1];
    } forEach _allWeaponsItems;
};
