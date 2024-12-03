#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initializes CSW systems on vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_csw_fnc_initVehicle
 *
 * Public: No
 */

params ["_vehicle"];
if (!alive _vehicle) exitWith { WARNING_1("%1 not alive",_vehicle); };
if (!simulationEnabled _vehicle) exitWith {
    [{simulationEnabled _this}, FUNC(initVehicle), _vehicle] call CBA_fnc_waitUntilAndExecute;
};

private _typeOf = typeOf _vehicle;
private _configOf = configOf _vehicle;
private _configEnabled = (getNumber (_configOf >> QUOTE(ADDON) >> "enabled")) == 1;
private _assemblyConfig = _configEnabled && {(getText (_configOf >> QUOTE(ADDON) >> "disassembleWeapon")) != ""};
TRACE_4("initVehicle",_vehicle,_typeOf,_configEnabled,_assemblyConfig);

if (_configEnabled && {GVAR(ammoHandling) == 2}) then {
    TRACE_1("adding AI fired handler",_vehicle);
    _vehicle addEventHandler ["Fired", LINKFUNC(ai_handleFired)];
    _vehicle addEventHandler ["GetIn", LINKFUNC(ai_handleGetIn)]; // handle AI getting inside weapon with no ammo
};

TRACE_2("",local _vehicle,_vehicle turretLocal [0]);

if (_vehicle turretLocal [0]) then {
    // Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
    private _assemblyModeIndex = _vehicle getVariable [QGVAR(assemblyMode), 3];
    private _assemblyMode = [false, true, true, GVAR(defaultAssemblyMode)] select _assemblyModeIndex;

    TRACE_2("turretLocal",_vehicle,_assemblyMode);

    // If turret is local, handle unloading mags and proxy weapons
    if (_configEnabled) then {
        TRACE_2("config enabled",_vehicle,_assemblyMode);

        private _emptyWeapon = _assemblyModeIndex isEqualTo 2;

        [_vehicle, [0], _assemblyMode, _emptyWeapon] call FUNC(proxyWeapon);

        if (!_assemblyMode) exitWith {};

        [_vehicle, _emptyWeapon] call FUNC(staticWeaponInit_unloadExtraMags);
    };

    if (_assemblyConfig) then {
        TRACE_2("assemblyConfig present",_vehicle,_assemblyMode);
        // Disable vanilla assembly if assemblyMode enabled
        // Need to wait to allow setting object vars during assembly, but since this function runs 1 second after vehicle init, it can run immediately
        [_vehicle, "disableWeaponAssembly", QUOTE(ADDON), _assemblyMode] call EFUNC(common,statusEffect_set);
    };
};

// Add interactions for players
if (hasInterface && {!(_typeOf in GVAR(initializedStaticTypes))}) then {
    GVAR(initializedStaticTypes) pushBack _typeOf;
    TRACE_1("Adding Actions",_typeOf);

    if (_assemblyConfig) then {
        private _disassembleAction = [QGVAR(disassemble), LLSTRING(DisassembleCSW_displayName), "", LINKFUNC(assemble_pickupWeapon), LINKFUNC(assemble_canPickupWeapon)] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, ["ACE_MainActions"], _disassembleAction] call EFUNC(interact_menu,addActionToClass);
    };


    private _ammoActionPath = [];
    private _magazineLocation = getText (_configOf >> QUOTE(ADDON) >> "magazineLocation");
    private _condition = {
        // If magazine handling is enabled or weapon assembly/disassembly is enabled we enable ammo handling
        if ((GVAR(ammoHandling) == 0) && {!([false, true, true, GVAR(defaultAssemblyMode)] select (_target getVariable [QGVAR(assemblyMode), 3]))}) exitWith { false };
        [_player, _target, ["isNotSwimming", "isNotSitting"]] call EFUNC(common,canInteractWith)
    };
    private _childrenCode = {
        BEGIN_COUNTER(getActions); // can remove for final release
        private _ret = (call FUNC(getLoadActions)) + (call FUNC(getUnloadActions));
        END_COUNTER(getActions);
        _ret
    };
    if (_configEnabled && {_magazineLocation != ""}) then {
        private _positionCode = compile _magazineLocation;
        private _ammoAction = [QGVAR(magazine), LLSTRING(AmmoHandling_displayName), "", {}, _condition, _childrenCode, [], _positionCode, 4] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 0, [], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    } else {
        private _ammoAction = [QGVAR(magazine), LLSTRING(AmmoHandling_displayName), "", {}, _condition, _childrenCode] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 0, ["ACE_MainActions"], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    };

    if (["ace_reload"] call EFUNC(common,isModLoaded)) then {
        [_typeOf, 0, ["ACE_MainActions", QEGVAR(reload,CheckAmmo)]] call EFUNC(interact_menu,removeActionFromClass);

        // Replace existing check ammo interaction with one that takes into account if the magazine actions are available
        private _checkAmmoAction = [QEGVAR(reload,CheckAmmo), LELSTRING(reload,checkAmmo), "", EFUNC(reload,checkAmmo), {
            if !((GVAR(ammoHandling) == 0) && {!([false, true, true, GVAR(defaultAssemblyMode)] select (_target getVariable [QGVAR(assemblyMode), 3]))}) exitWith { false };
            _this call EFUNC(reload,canCheckAmmo)
        }] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, ["ACE_MainActions"], _checkAmmoAction] call EFUNC(interact_menu,addActionToClass);

        // Add another check ammo action to the ammo handling point
        _checkAmmoAction = [QGVAR(checkAmmo), LELSTRING(reload,checkAmmo), "", EFUNC(reload,checkAmmo), EFUNC(reload,canCheckAmmo)] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, _ammoActionPath, _checkAmmoAction] call EFUNC(interact_menu,addActionToClass);
    };
};
