/*
 * Author: Garth 'L-H' de Wet
 * Initialises the parachute system.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ACE3 Equipment", QGVAR(showAltimeter), localize LSTRING(showAltimeter), {
    // Conditions: canInteract
    if (
        !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) ||
        {!('ACE_Altimeter' in assignedItems ACE_player)}
    ) exitWith { false };

    if !(GETMVAR(GVAR(AltimeterActive),false)) then {
        [ACE_player] call FUNC(showAltimeter);
    } else {
        call FUNC(hideAltimeter);
    };

    true
}, {false}, [24, [false, false, false]], false] call CBA_fnc_addKeybind;

// Handle reserve chute based on current backpack (fires when parachute opens too)
["loadout", FUNC(handleReserve), true] call CBA_fnc_addPlayerEventHandler;

// Don't show vanilla speed and height when in expert mode
["ace_infoDisplayChanged", {_this call FUNC(handleInfoDisplayChanged)}] call CBA_fnc_addEventHandler;
