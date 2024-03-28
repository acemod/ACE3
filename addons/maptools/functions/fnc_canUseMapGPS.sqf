#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Returns if the GPS on the map can be used.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * GPS can be used <BOOL>
 *
 * Example:
 * call ace_maptools_fnc_canUseMapGPS
 *
 * Public: No
 */

if (!visibleMap || {!alive ACE_player}) exitWith {false};

private _playerTerminal = ACE_player getSlotItemName 612;
[
    "ItemGPS",
    "B_UavTerminal",
    "O_UavTerminal",
    "I_UavTerminal",
    "C_UavTerminal",
    "I_E_UavTerminal"
] findIf { _x == _playerTerminal } != -1;
