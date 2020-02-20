#include "script_component.hpp"
#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"

[QGVAR(bailOut), {
    params["_center", "_crewman", "_vehicle"];
    TRACE_3("bailOut",_center,_crewman,_vehicle);

    if (isPlayer _crewman) exitWith {};
    if (!alive _crewman || IS_UNCONSCIOUS(_crewman)) exitWith {};

    unassignVehicle _crewman;
    _crewman leaveVehicle _vehicle;
    doGetOut _crewman;

    private _angle = floor (random 360);
    private _dist = (30 + (random 10));
    private _escape = _center getPos [_dist, _angle];

    _crewman doMove _escape;
    _crewman setSpeedMode "FULL";
}] call CBA_fnc_addEventHandler;

["ace_settingsInitialized", {
    TRACE_1("settingsInit", GVAR(enableCrewBailing));

    ["Tank", "init", LINKFUNC(addEventHandler), nil, nil, true] call CBA_fnc_addClassEventHandler;
    ["Wheeled_APC_F", "init", LINKFUNC(addEventHandler), nil, nil, true] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
