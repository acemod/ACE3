#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Retrieves a list of all items of unit - can be cached for the duration of the ace interaction.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Cache Return? <BOOL>
 *
 * Return Value:
 * All Items of the Unit <ARRAY>
 *
 * Example:
 * [player, false] call ace_wardrobe_fnc_getItemsAll
 *
 * Public: No
 */

params [["_player", objNull, [objNull]]];

flatten getUnitLoadout _player select { _x isEqualType "" && { _x != "" } }
