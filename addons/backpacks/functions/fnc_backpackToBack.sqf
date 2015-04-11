/*
 * Author: marc_book
 * Put's backpack to normal position.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 */

#include "script_component.hpp"

_unit = _this select 0;

hint format ["%1", attachedObjects _unit];

_backpack = (attachedObjects _unit) select 0;

detach _backpack;

_unit action ["AddBag",_backpack,(backpackCargo _backpack) select 0];