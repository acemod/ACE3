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
case ("backpack"): {
        _listOfItemsToRemove pushBack (backpack _target);
    };
case ("weapons"): {
        _listOfItemsToRemove = _listOfItemsToRemove + (weapons _target);
        _doNotDropAmmo = true;
    };
    
    case ("uniform"): {
        _listOfItemsToRemove = [(uniform _target)];
    };


};

[_caller, _target, _listOfItemsToRemove, _doNotDropAmmo] call FUNC(disarmDropItems);
