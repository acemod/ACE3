#include "script_component.hpp"

private _filter = "isClass (_x >> 'Components' >> 'TransportPylonsComponent') && {(getNumber (_x >> 'scope')) > 0}";
GVAR(aircraftWithPylons) = (_filter configClasses (configFile >> "CfgVehicles")) apply {configName _x};
{
    [_x, "init", {
        params ["_aircraft"];

        private _loadoutAction = [
            QGVAR(loadoutAction),
            localize LSTRING(ConfigurePylons),
            "",
            {[_target] call FUNC(showDialog)},
            {
                if (!GVAR(enabledFromAmmoTrucks)) exitWith {false};

                private _vehicles = nearestObjects [_target, ["Air", "LandVehicle", "Slingload_base_F", "ReammoBox_F"], GVAR(searchDistance) + 10];
                private _filter = ["transportAmmo", QEGVAR(rearm,defaultSupply)] select (["ace_rearm"] call EFUNC(common,isModLoaded));
                private _rearmVehicles = {(getNumber (configFile >> "CfgVehicles" >> typeOf _x >> _filter)) > 0} count _vehicles;

                (_rearmVehicles > 0 && {[ace_player, _target] call FUNC(canConfigurePylons)})
            }
        ] call EFUNC(interact_menu,createAction);

        [_aircraft, 0, ["ACE_MainActions"], _loadoutAction] call EFUNC(interact_menu,addActionToObject);
    }, false, [], true] call CBA_fnc_addClassEventHandler;
} forEach GVAR(aircraftWithPylons);

[QGVAR(setPylonLoadOutEvent), {
    params ["_aircraft", "_pylonIndex", "_pylon", "_turret", "_weaponToRemove"];
    TRACE_5("setPylonLoadOutEvent",_aircraft,_pylonIndex,_pylon,_turret,_weaponToRemove);
    _aircraft setPylonLoadOut [_pylonIndex, _pylon, false, _turret];
    if (_weaponToRemove != "") then {
        {
            if (_aircraft turretLocal _x) then {
                TRACE_3("removing",_aircraft,_x,_weaponToRemove);
                _aircraft removeWeaponTurret [_weaponToRemove, _x];
            };
        } forEach [[-1], [0]];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(setAmmoOnPylonEvent), {
    params ["_aircraft", "_pylonIndex", "_count"];
    _aircraft setAmmoOnPylon [_pylonIndex, _count];
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    GVAR(currentAircraftNamespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(currentAircraftNamespace);

    addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
};
