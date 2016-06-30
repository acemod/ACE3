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
    if !([ACE_player, objNull, ["isNotEscorting", "isNotInside"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (!('ACE_Altimeter' in assignedItems ace_player)) exitWith {false};
    if (!(missionNamespace getVariable [QGVAR(AltimeterActive), false])) then {
        [ACE_player] call FUNC(showAltimeter);
    } else {
        call FUNC(hideAltimeter);
    };
    true
}, {false}, [24, [false, false, false]], false] call CBA_fnc_addKeybind;

GVAR(PFH) = false;
["vehicle",{
    if (!GVAR(PFH) && {(vehicle ACE_player) isKindOf "ParachuteBase"}) then {
        GVAR(PFH) = true;
        [FUNC(onEachFrame), 0.1, []] call CALLSTACK(CBA_fnc_addPerFrameHandler);
    };
}] call CBA_fnc_addPlayerEventHandler;

// don't show speed and height when in expert mode
["ace_infoDisplayChanged", {_this call FUNC(handleInfoDisplayChanged)}] call CBA_fnc_addEventHandler;

["loadout", FUNC(storeParachute)] call CBA_fnc_addPlayerEventHandler;
