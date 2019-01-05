#include "script_component.hpp"
/*
 * Authors: Ruthberg
 * Opens the range card dialog
 *
 * Arguments:
 * Open copy? <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_rangecard_fnc_openRangeCard
 *
 * Public: No
 */

if (GVAR(RangeCardOpened)) exitWith {};

if (_this) then {
    if (GVAR(ammoClassCopy) != "" && GVAR(magazineClassCopy) != "" && GVAR(weaponClassCopy) != "") then {
        GVAR(RangeCardOpened) = true;

        createDialog "ACE_RangeCard_Dialog";

        [GVAR(zeroRangeCopy), GVAR(boreHeightCopy), GVAR(ammoClassCopy), GVAR(magazineClassCopy), GVAR(weaponClassCopy)] call FUNC(updateRangeCard);
    };
} else {
    if (ACE_player call FUNC(updateClassNames)) then {
        GVAR(RangeCardOpened) = true;

        createDialog "ACE_RangeCard_Dialog";

        [GVAR(zeroRange), GVAR(boreHeight), GVAR(ammoClass), GVAR(magazineClass), GVAR(weaponClass)] call FUNC(updateRangeCard);
    };
};
