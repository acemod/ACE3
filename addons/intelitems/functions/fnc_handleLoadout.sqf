#include "script_component.hpp"
/*
 * Author: mharis001
 * Handles the player loadout changed event.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_intelitems_fnc_handleLoadout
 *
 * Public: No
 */

params ["_player"];

private _allIndices = [];

// Handle magazine ids with missing index assignments
private _cfgMagazines = configFile >> "CfgMagazines";
private _magazines = magazines _player;

{
    if (getNumber (_cfgMagazines >> _x >> QGVAR(intel)) == 1) then {
        private _magazineIds = [_player, _x] call CBA_fnc_getMagazineIndex;

        {
            private _index = GVAR(intelMap) getVariable _x;

            if (isNil "_index") then {
                // Need new intel index from server
                [QGVAR(handleMagIndex), _x] call CBA_fnc_serverEvent;
            } else {
                // Add valid index to array of all indices
                _allIndices pushBack _index;
            };
        } forEach _magazineIds;
    };
} forEach (_magazines arrayIntersect _magazines);

// Close any open controls if player no longer has needed magazine
{
    private _index = _x getVariable QGVAR(index);

    if !(_index in _allIndices) then {
        [_x] call FUNC(deleteControl);
    };
} forEach +GVAR(controlsGroups);
