#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Reads the modifiable variants of the worn items of the unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Items and their modifiable variants <ARRAY>
 *
 * Example:
 * [player] call ace_wardrobe_fnc_getAvailableItemVariants
 *
 * Public: No
 */

params ["_player"];

keys uniqueUnitItems [_player, 0, 1, 1, 1, true]
    apply { _x call CBA_fnc_getItemConfig }
    select { _x call FUNC(isModifiable) }
    apply {
        private _cfg = _x;
        [
            _cfg,
            (_cfg call FUNC(getItemVariants)) select { [_player, _cfg, _x] call FUNC(checkMissingComponents) }
        ]
    }
    select { _x#1 isNotEqualTo [] }
