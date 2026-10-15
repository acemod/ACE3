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
            _vehicles findIf {getNumber ((configOf _x) >> "transportAmmo") > 0} != -1;
        };

        (_isRearmVehicle && {[ace_player, _target] call FUNC(canConfigurePylons)})
    }
] call EFUNC(interact_menu,createAction);

["Air", "init", { // on air vehicle init, add action to class if has pylons
    params ["_vehicle"];
    private _typeOf = typeOf _vehicle;

    if (_typeOf in GVAR(aircraftWithPylons)) exitWith {};
    if (!isClass ((configOf _vehicle) >> 'Components' >> 'TransportPylonsComponent')) exitWith {};

    GVAR(aircraftWithPylons) pushBack _typeOf;
    [_typeOf, 0, ["ACE_MainActions"], GVAR(loadoutAction)] call EFUNC(interact_menu,addActionToClass);
}, true, ["ParachuteBase"], true] call CBA_fnc_addClassEventHandler;


[QGVAR(setPylonLoadOutEvent), {
    params ["_aircraft", "_pylonIndex", "_pylon", "_turret", "_rearm"];
    TRACE_5("setPylonLoadOutEvent",_aircraft,_pylonIndex,_pylon,_turret,_rearm);

    // Read and update the loadout and ammunition together on the aircraft owner
    (getAllPylonsInfo _aircraft select (_pylonIndex - 1)) params ["", "", "_currentTurret", "_currentMagazine", "_currentAmmo"];
    if (_currentTurret isEqualTo [-1]) then {_currentTurret = [];};
    private _weaponToRemove = getText (configFile >> "CfgMagazines" >> _currentMagazine >> "pylonWeapon");
    private _count = if (_pylon == _currentMagazine) then {
        _currentAmmo max 0
    } else {
        [0, getNumber (configFile >> "CfgMagazines" >> _pylon >> "count")] select _rearm
    };

    // Recreate the magazine when moving it between seats, keeping its ammunition
    private _reassign = _pylon != "" && {_pylon == _currentMagazine} && {_turret isNotEqualTo _currentTurret};
    if (_reassign) then {
        _aircraft setPylonLoadout [_pylonIndex, "", false, _currentTurret];
    };
    if !(_aircraft setPylonLoadout [_pylonIndex, _pylon, false, _turret]) exitWith {
        if (_reassign) then {
            _aircraft setPylonLoadout [_pylonIndex, _currentMagazine, true, _currentTurret];
            _aircraft setAmmoOnPylon [_pylonIndex, _currentAmmo max 0];
        };
    };
    _aircraft setAmmoOnPylon [_pylonIndex, _count];

    if (_weaponToRemove != "") then {
        private _pylons = getAllPylonsInfo _aircraft;
        {
            private _turretPath = _x;
            private _weaponInUse = _pylons findIf {
                _x params ["", "", "_pylonTurret", "_magazine"];
                if (_pylonTurret isEqualTo []) then {_pylonTurret = [-1];};
                _pylonTurret isEqualTo _turretPath && {
                    getText (configFile >> "CfgMagazines" >> _magazine >> "pylonWeapon") == _weaponToRemove
                }
            };
            if (_weaponInUse == -1) then {
                [
                    QGVAR(removeWeaponTurretEvent),
                    [_aircraft, _weaponToRemove, _turretPath],
                    _aircraft,
                    _turretPath
                ] call CBA_fnc_turretEvent;
            };
        } forEach [[-1], [0]];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(removeWeaponTurretEvent), {
    params ["_aircraft", "_weapon", "_turretPath"];
    TRACE_3("removing",_aircraft,_turretPath,_weapon);
    _aircraft removeWeaponTurret [_weapon, _turretPath];
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    GVAR(currentAircraftNamespace) = true call CBA_fnc_createNamespace;
    publicVariable QGVAR(currentAircraftNamespace);

    addMissionEventHandler ["HandleDisconnect", {call FUNC(handleDisconnect)}];
};
