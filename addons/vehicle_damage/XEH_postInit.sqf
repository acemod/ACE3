#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_1("settings init",GVAR(enabled));

    if (GVAR(enabled)) then {
        [QGVAR(medicalDamage), LINKFUNC(medicalDamage)] call CBA_fnc_addEventHandler;

        [QGVAR(bailOut), {
            params ["_vehicle", "_unit"];

            TRACE_2("bailOut",_vehicle,_unit);

            if (isPlayer _unit || {!(_unit call EFUNC(common,isAwake))}) exitWith {};

            unassignVehicle _unit;
            _unit leaveVehicle _vehicle;
            doGetOut _unit;

            private _angle = floor (random 360);
            private _dist = 30 + (random 10);
            private _escape = _vehicle getPos [_dist, _angle];

            _unit doMove _escape;
            _unit setSpeedMode "FULL";
        }] call CBA_fnc_addEventHandler;

        ["Tank", "Init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;

        // Wheeled_APC_F inherits from Car
        [["Wheeled_Apc_F", "Car"] select GVAR(enableCarDamage), "Init", LINKFUNC(addEventHandler), true, [], true] call CBA_fnc_addClassEventHandler;

        // Blow off turret effect
        ["Tank", "Killed", {
            if (random 1 < 0.15) then {
                (_this select 0) call FUNC(blowOffTurret);
            };
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    };

    // Init eject from destroyed vehicle
    {
        [_x, "Init", {
            params ["_vehicle"];

            if (!alive _vehicle) exitWith {};

            TRACE_2("ejectIfDestroyed init",_vehicle,typeOf _vehicle);

            _vehicle addEventHandler ["HandleDamage", {call FUNC(handleDamageEjectIfDestroyed)}];
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    } forEach EJECT_IF_DESTROYED_VEHICLES;
}] call CBA_fnc_addEventHandler;
