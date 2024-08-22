#include "script_component.hpp"

// Init eject from destroyed vehicles
// See https://github.com/acemod/ACE3/pull/6330
// Still valid for Arma 2.16
{
    [_x, "Init", {
        params ["_vehicle"];

        if (!alive _vehicle) exitWith {};

        TRACE_2("ejectIfDestroyed init",_vehicle,typeOf _vehicle);

        _vehicle addEventHandler ["HandleDamage", {call FUNC(handleDamageEjectIfDestroyed)}];
    }, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach EJECT_IF_DESTROYED_VEHICLES;

["CBA_settingsInitialized", {
    TRACE_1("settings init",GVAR(enabled));

    if (!GVAR(enabled)) exitWith {};

    [QGVAR(medicalDamage), LINKFUNC(medicalDamage)] call CBA_fnc_addEventHandler;

    if (isServer) then {
        // To set source and instigator, setDamage must be executed on the server
        [QGVAR(setDamage), {(_this select 0) setDamage (_this select 1)}] call CBA_fnc_addEventHandler;
    };

    [QGVAR(bailOut), {
        params ["_vehicle", "_unit"];

        TRACE_2("bailOut",_vehicle,_unit);

        // Ignore players and the dead
        if (_unit call EFUNC(common,isPlayer) || {!(_unit call EFUNC(common,isAwake))}) exitWith {};

        unassignVehicle _unit;
        _unit leaveVehicle _vehicle;
        doGetOut _unit;

        private _angle = floor (random 360);
        private _dist = 30 + (random 10);
        private _escape = _vehicle getPos [_dist, _angle];

        _unit doMove _escape;
        _unit setSpeedMode "FULL";
    }] call CBA_fnc_addEventHandler;

    GVAR(vehicleClassesHitPointHash) = createHashMap;

    ["Tank", "Init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;

    // Wheeled_APC_F inherits from Car
    [["Wheeled_Apc_F", "Car"] select GVAR(enableCarDamage), "Init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;

    // Blow off turret effect
    // TODO: Add blowing-off-turret effect to vehicles that cook-off but aren't destroyed (no catastrophic explosion)
    // The problem is that vehicles are repairable if they haven't been destroyed. So if the turret is gone and vehicle is repaired, how do we handle that?
    ["Tank", "Killed", {
        if (_this select 3 && random 1 < 0.15) then {
            (_this select 0) call FUNC(blowOffTurret);
        };
    }] call CBA_fnc_addClassEventHandler;
}] call CBA_fnc_addEventHandler;
