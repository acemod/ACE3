#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Commands the selected vehicle to paradrop all cargo at the specified location
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [], true] call ace_zeus_fnc_moduleCargoParadrop
 *
 * Public: No
 */

if (canSuspend) exitWith {[FUNC(moduleCargoParadrop), _this] call CBA_fnc_directCall;};

params ["_logic", "", "_activated"];

if ((!local _logic) || {!_activated}) exitWith {};

// Validate the module target
private _vehicle = attachedTo _logic;
private _pilot = driver _vehicle;
TRACE_4("moduleCargoParadrop placed",_logic,typeOf _vehicle,_pilot,typeOf _pilot);

deleteVehicle _logic; // cleanup logic now, we just needed it to get the attached vehicle

if (!(missionNamespace getVariable [QEGVAR(cargo,enable), false])) exitWith {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
};
if (isNull _vehicle) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!(_vehicle isKindOf "Air")) exitWith {
    [format ["%1 %2", localize "str_dn_aircraft", localize "str_msg_no_veh_select"]] call FUNC(showMessage);
};
if ((!alive _vehicle) || {!alive _pilot}) exitWith {
    [LSTRING(OnlyAlive)] call FUNC(showMessage);
};
if ([_pilot] call EFUNC(common,isPlayer)) exitWith {
    ["str_a3_cfgvehicles_moduleremotecontrol_f_errorPlayer"] call FUNC(showMessage);
};
if ((_vehicle getVariable [QEGVAR(cargo,loaded), []]) isEqualTo []) exitWith {
    [LSTRING(paradrop_noCargoLoaded)] call FUNC(showMessage);
};

[_vehicle, {
    params ["_successful", "_vehicle", "_mousePosASL"];
    TRACE_3("getModuleDestination return",_successful,_vehicle,_mousePosASL);

    if ((!_successful) || {!alive _vehicle}) exitWith {};

    private _pilot = driver _vehicle;
    private _group = group _pilot;

    if ((!alive _vehicle) || {!alive _pilot} || {[_pilot] call EFUNC(common,isPlayer)}) exitWith {TRACE_2("invalid",_vehicle,_pilot);};

    [_group] call CBA_fnc_clearWaypoints;

    private _wp = _group addWaypoint [ASLtoAGL _mousePosASL, 0];
    _wp setWaypointType "SCRIPTED";
    _wp setWaypointScript QPATHTOF(functions\DOUBLES(fnc,moduleCargoParadropWaypoint).sqf);

    TRACE_2("Waypoint Added",_wp,local _group); // Locality is handled by the waypoint

}, localize LSTRING(moduleCargoParadrop_DisplayName), "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], 45] call FUNC(getModuleDestination);
