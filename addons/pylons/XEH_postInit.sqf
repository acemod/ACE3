#include "script_component.hpp"

GVAR(aircraftWithPylons) = [];

GVAR(loadoutAction) = [ // create action
    QGVAR(loadoutAction),
    localize LSTRING(ConfigurePylons),
    "",
    {[_target] call FUNC(showDialog)},
    {
        if (!GVAR(enabledFromAmmoTrucks)) exitWith {false};

        private _vehicles = nearestObjects [_target, ["Air", "LandVehicle", "Slingload_base_F", "ReammoBox_F"], GVAR(searchDistance) + 10];
        private _isRearmVehicle = if (["ace_rearm"] call EFUNC(common,isModLoaded)) then {
            _vehicles findIf {[_x] call EFUNC(rearm,isSource)} != -1;
        } else {
            private _cfgVehicle = configFile >> "CfgVehicles";
            _vehicles findIf {getNumber (_cfgVehicle >> typeOf _x >> "transportAmmo") > 0} != -1;
        };
        
        (_isRearmVehicle && {[ace_player, _target] call FUNC(canConfigurePylons)})
    }
] call EFUNC(interact_menu,createAction);

["Air", "init", { // on air vehicle init, add action to class if has pylons
    params ["_vehicle"];
    private _typeOf = typeOf _vehicle;

    if (_typeOf in GVAR(aircraftWithPylons)) exitWith {};
    if (!isClass (configFile >> "CfgVehicles" >> _typeOf >> 'Components' >> 'TransportPylonsComponent')) exitWith {};

    GVAR(aircraftWithPylons) pushBack _typeOf;
    [_typeOf, 0, ["ACE_MainActions"], GVAR(loadoutAction)] call EFUNC(interact_menu,addActionToClass);
}, true, ["ParachuteBase"], true] call CBA_fnc_addClassEventHandler;


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
