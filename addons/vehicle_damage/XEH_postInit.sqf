#include "script_component.hpp"

["ace_settingsInitialized", {
    TRACE_1("settings init",GVAR(enabled));
    if (GVAR(enabled)) then {
        [QGVAR(bailOut), {
            params ["_center", "_crewman", "_vehicle"];
            TRACE_3("bailOut",_center,_crewman,_vehicle);

            if (isPlayer _crewman) exitWith {};
            if (!alive _crewman || { !( [_crewman] call EFUNC(common,isAwake))} ) exitWith {};

            unassignVehicle _crewman;
            _crewman leaveVehicle _vehicle;
            doGetOut _crewman;

            private _angle = floor (random 360);
            private _dist = (30 + (random 10));
            private _escape = _center getPos [_dist, _angle];

            _crewman doMove _escape;
            _crewman setSpeedMode "FULL";
        }] call CBA_fnc_addEventHandler;

        ["Tank", "init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;
        ["Wheeled_APC_F", "init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;

        if (GVAR(enableCarDamage)) then {
            ["Car", "init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;
        };

        // Blow off turret effect
        // TODO: Add blowing-off-turret effect to vehicles that cook-off but aren't destroyed (no catastrophic explosion)
        // The problem is that vehicles are repairable if they haven't been destroyed. So if the turret is gone and vehicle is repaired, how do we handle that?
        ["Tank", "Killed", {
            if (_this select 3 && random 1 < 0.15) then {
                (_this select 0) call FUNC(blowOffTurret);
            };
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    };

    // init eject from destroyed vehicle
    {
        [_x, "init", {
            params ["_vehicle"];
            if (!alive _vehicle) exitWith {};
            TRACE_2("ejectIfDestroyed init",_vehicle,typeOf _vehicle);
            _vehicle addEventHandler ["HandleDamage", {call FUNC(handleDamageEjectIfDestroyed)}];
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    } forEach EJECT_IF_DESTROYED_VEHICLES;
}] call CBA_fnc_addEventHandler;
