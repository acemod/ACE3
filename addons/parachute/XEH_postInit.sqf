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

["ACE3", QGVAR(showAltimeter), localize "STR_ACE_Parachute_showAltimeter",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, ["isNotEscorting"]] call EFUNC(common,canInteractWith)) exitWith {false};
    if (!('ACE_Altimeter' in assignedItems ace_player)) exitWith {false};
    if (!(missionNamespace getVariable [QGVAR(AltimeterActive), false])) then {
        [ace_player] call FUNC(showAltimeter);
    } else {
        call FUNC(hideAltimeter);
    };
    true
},
{false},
[24, [false, false, false]], false] call cba_fnc_addKeybind;

GVAR(PFH) = false;
["playerVehicleChanged",{
    if (!GVAR(PFH) && {(vehicle ACE_player) isKindOf "ParachuteBase"}) then {
        GVAR(PFH) = true;
        [FUNC(onEachFrame), 0.1, []] call CALLSTACK(cba_fnc_addPerFrameHandler);
    };
}] call EFUNC(common,addEventHandler);

// don't show speed and height when in expert mode
["Parachute", {if (!cadetMode) then {_dlg = _this select 0; {(_dlg displayCtrl _x) ctrlShow false} forEach [121, 122, 1004, 1005, 1006, 1014];};}] call EFUNC(common,addInfoDisplayEventHandler);  //@todo addEventHandler infoDisplayChanged with select 1 == "Parachute"
["Soldier", {if (!cadetMode) then {_dlg = _this select 0; {_ctrl = (_dlg displayCtrl _x); _ctrl ctrlSetPosition [0,0,0,0]; _ctrl ctrlCommit 0;} forEach [380, 382]};}] call EFUNC(common,addInfoDisplayEventHandler);  //@todo addEventHandler infoDisplayChanged with select 1 == "Soldier"
