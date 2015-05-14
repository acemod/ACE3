/*
 * Author: Garth 'L-H' de Wet
 * Approves placement of the explosive, releases the placement object for it
 * to settle in a location suitable for the explosive to be created.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_Explosives_fnc_place_Approve;
 *
 * Public: No
 */
#include "script_component.hpp"
if (GVAR(pfeh_running)) then {
    [QGVAR(Placement),"OnEachFrame"] call CALLSTACK(BIS_fnc_removeStackedEventHandler);
    GVAR(pfeh_running) = false;
};
private ["_setup", "_player", "_dir"];
_setup = GVAR(Setup);
GVAR(Setup) = objNull;
[GVAR(placer), "ACE_Explosives", false] call EFUNC(Common,setForceWalkStatus);
[ACE_player, "DefaultAction", ACE_player getVariable [QGVAR(Place),  -1]] call EFUNC(Common,removeActionEventHandler);
[ACE_player, "zoomtemp",      ACE_player getVariable [QGVAR(Cancel), -1]] call EFUNC(Common,removeActionEventHandler);
GVAR(placer) = objNull;
_player = ACE_player;
call EFUNC(interaction,hideMouseHint);
if ((_setup getVariable [QGVAR(Class), ""]) == "") exitWith {
    deleteVehicle _setup;
};
_dir = (getDir _setup);
if (_dir > 180) then {
    _dir = _dir - 180;
} else {
    _dir = 180 + _dir;
};
_setup setVariable [QGVAR(Direction), _dir];
_player setVariable [QGVAR(PlantingExplosive), true];
[{_this setVariable [QGVAR(PlantingExplosive), false]}, _player, 1.5, 0.5] call EFUNC(common,waitAndExecute);
_setup addEventHandler ["EpeContactStart", FUNC(onLanded)];
_setup enableSimulationGlobal true;
_player playActionNow "MedicOther";
_player removeMagazine (_setup getVariable [QGVAR(Class), ""]);
