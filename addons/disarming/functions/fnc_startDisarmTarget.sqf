/*
 * Author: PabstMirror
 * Starts disarming the target from the target
 * Generates the specific list of items that should be removed from a disarm type
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 1: type of disarm <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 *
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_caller,_target,_type);

_listOfItemsToRemove = [];
_doNotDropAmmo = false;

switch (toLower _type) do {
case ("primaryweapononly"): {
        _listOfItemsToRemove = [(primaryWeapon _target)];
        _doNotDropAmmo = true;
    };
case ("secondaryweapononly"): {
        _listOfItemsToRemove = [(secondaryWeapon _target)];
        _doNotDropAmmo = true;
    };
case ("handgunweapononly"): {
        _listOfItemsToRemove = [(handgunWeapon _target)];
        _doNotDropAmmo = true;
    };
case ("backpack"): {
        _listOfItemsToRemove = [(backpack _target)];
    };
case ("alldangerous"): {
        _listOfItemsToRemove = weapons _target;
        {
            if (!(_x in _listOfItemsToRemove)) then {
                _listOfItemsToRemove pushBack _x;
            };
        } forEach (magazines _target);
        {
            if ((!(_x in _listOfItemsToRemove)) && {_x in DANGEROUS_ITEMS} && {_x != ""}) then {
                _listOfItemsToRemove pushBack _x;
            };
        } forEach ((items _target) + (assignedItems _target));
    };
case ("strip"): {
        // _listOfItemsToRemove = [_target] call EFUNC(common,getAllGear);
        _listOfItemsToRemove = [];
        {
            if ((!(_x in _listOfItemsToRemove)) && {_x != ""}) then {
                _listOfItemsToRemove pushBack _x;
            };
        } forEach ((weapons _target) + (magazines _target) + (items _target) + (assignedItems _target) + [(backpack _target), (vest _target), (uniform _target)]);
    };
};

[_caller, _target, _listOfItemsToRemove, _doNotDropAmmo] call FUNC(disarmDropItems);
