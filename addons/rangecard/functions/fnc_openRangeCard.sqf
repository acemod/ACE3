#include "..\script_component.hpp"
/*
 * Authors: Ruthberg
 * Opens the range card dialog.
 *
 * Arguments:
 * 0: Open copy? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * true call ace_rangecard_fnc_openRangeCard
 *
 * Public: No
 */

if (GVAR(rangeCardOpened)) exitWith {};

params ["_openCopy"];

if (_openCopy) exitWith {
    // If no info to display, exit
    if (GVAR(rangeCardCopyInfo) isEqualTo []) exitWith {};

    createDialog "ACE_RangeCard_Dialog";

    GVAR(rangeCardCopyInfo) call FUNC(updateRangeCard);
};

// Fetch most recent information to generate range card
[ACE_player, ACE_player] call FUNC(updateClassNames);

createDialog "ACE_RangeCard_Dialog";

GVAR(rangeCardInfo) call FUNC(updateRangeCard);
