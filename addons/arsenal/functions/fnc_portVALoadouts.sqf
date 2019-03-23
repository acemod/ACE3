#include "script_component.hpp"
/*
 * Author: alganthe
 * Port VA loadouts to ACE Arsenal.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: Yes
*/

private _VALoadouts = +(profilenamespace getvariable ["bis_fnc_saveInventory_data",[]]);
private _aceLoadouts = +(profileNamespace getVariable [QGVAR(saved_loadouts),[]]);

if (isNull player) exitWith {
    [localize LSTRING(portLoadoutsPlayerError)] call BIS_fnc_error;
};

if (_VALoadouts isEqualTo []) exitWith {
    [localize LSTRING(portLoadoutsLoadoutError)] call BIS_fnc_error;
};

for "_i" from 0 to (count _VALoadouts - 1) step 2 do {
    _name = _VALoadouts select _i;
    _inventory = _VALoadouts select (_i + 1);

    private _sameNameLoadoutsList = _aceLoadouts select {_x select 0 == _name};
    [player, [profilenamespace, _name]] call bis_fnc_loadinventory;

    private _loadout = getUnitLoadout player;

    if (count _sameNameLoadoutsList > 0) then {
        _aceLoadouts set [_aceLoadouts find (_sameNameLoadoutsList select 0), [_name, _loadout]];

    } else {
        _aceLoadouts pushBack [_name, _loadout];
    };
};

profileNamespace setVariable [QGVAR(saved_loadouts), _aceLoadouts];
