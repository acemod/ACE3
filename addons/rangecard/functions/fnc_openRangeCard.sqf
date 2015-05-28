/*
 * Authors: Ruthberg
 * Opens the range card dialog
 *
 * Arguments:
 * Open copy? <BOOLEAN>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_rangecard_fnc_openRangeCard
 *
 * Public: No
 */
#include "script_component.hpp"

if (GVAR(RangeCardOpened)) exitWith {};

if (_this) then {
    if (GVAR(ammoClassCopy) != "" && GVAR(weaponClassCopy) != "") then {
        GVAR(RangeCardOpened) = true;
        
        createDialog "ACE_RangeCard_Dialog";
        
        [GVAR(ammoClassCopy), GVAR(weaponClassCopy)] call FUNC(updateRangeCard);
    };
} else {
    if (ACE_player call FUNC(updateClassNames)) then {
        GVAR(RangeCardOpened) = true;
        
        createDialog "ACE_RangeCard_Dialog";
        
        [GVAR(ammoClass), GVAR(weaponClass)] call FUNC(updateRangeCard);
    };
};
