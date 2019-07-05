#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initializes weapon to disable weapon disassembling
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_staticWeaponInit
 *
 * Public: No
 */

params ["_staticWeapon"];
private _typeOf = typeOf _staticWeapon;
private _configEnabled = (getNumber (configFile >> "CfgVehicles" >> _typeOf >> "ace_csw" >> "enabled")) == 1;
private _assemblyConfig = _configEnabled && {(getText (configFile >> "CfgVehicles" >> _typeOf >> "ace_csw" >> "disassembleWeapon")) != ""};
TRACE_4("staticWeaponInit",_staticWeapon,_typeOf,_configEnabled,_assemblyConfig);

if (_configEnabled && {GVAR(ammoHandling) == 2}) then {
    TRACE_1("adding AI fired handler",_staticWeapon);
    _staticWeapon addEventHandler ["Fired", LINKFUNC(ai_handleFired)];
};

TRACE_2("",local _staticWeapon,_staticWeapon turretLocal [0]);
if (_configEnabled && {_staticWeapon turretLocal [0]}) then { // if turret is local to us, then handle mags/weapon
    [{
        params ["_staticWeapon"];
        if (!alive _staticWeapon) exitWith { TRACE_1("dead/deleted",_staticWeapon); };
        // Assembly mode: [0=disabled, 1=enabled, 2=enabled&unload, 3=default]
        private _assemblyModeIndex = _staticWeapon getVariable [QGVAR(assemblyMode), 3];
        private _emptyWeapon = _assemblyModeIndex isEqualTo 2;
        private _assemblyMode = [false, true, true, GVAR(defaultAssemblyMode)] select _assemblyModeIndex;
        TRACE_2("turretLocal",_staticWeapon,_assemblyMode);
        [_staticWeapon, [0], _assemblyMode, _emptyWeapon] call FUNC(proxyWeapon);
        [_staticWeapon, _assemblyMode, _emptyWeapon] call FUNC(staticWeaponInit_unloadExtraMags);
    }, [_staticWeapon]] call CBA_fnc_execNextFrame;  // need to wait a frame to allow setting object vars during assembly
};

if (_assemblyConfig) then {
    [{
        params ["_staticWeapon"];
        if (!alive _staticWeapon) exitWith { TRACE_1("dead/deleted",_staticWeapon); };
        private _assemblyMode = [false, true, true, GVAR(defaultAssemblyMode)] select (_staticWeapon getVariable [QGVAR(assemblyMode), 3]);
        TRACE_2("assemblyConfig present",_staticWeapon,_assemblyMode);
        if (_assemblyMode) then { // Disable vanilla assembly if assemblyMode eanbled
            [QGVAR(disableVanillaAssembly), [_staticWeapon]] call CBA_fnc_localEvent;
        };
    }, [_staticWeapon]] call CBA_fnc_execNextFrame;  // need to wait a frame to allow setting object vars during assembly
};

// Add interactions for players
if (hasInterface && {!(_typeOf in GVAR(initializedStaticTypes))}) then {
    GVAR(initializedStaticTypes) pushBack _typeOf;
    TRACE_1("Adding Actions",_typeOf);

    if (_assemblyConfig) then {
        private _disassembleAction = [QGVAR(disassemble), localize LSTRING(DisassembleCSW_displayName), "", {call FUNC(assemble_pickupWeapon)}, {call FUNC(assemble_canPickupWeapon)}] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, ["ACE_MainActions"], _disassembleAction] call EFUNC(interact_menu,addActionToClass);
    };


    private _ammoActionPath = [];
    private _magazineLocation = getText (configFile >> "CfgVehicles" >> _typeOf >> QUOTE(ADDON) >> "magazineLocation");
    private _condition = { //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        // If magazine handling is enabled or weapon assembly/disassembly is enabled we enable ammo handling
        if ((GVAR(ammoHandling) == 0) && {!([false, true, true, GVAR(defaultAssemblyMode)] select (_target getVariable [QGVAR(assemblyMode), 3]))}) exitWith { false };
        [_player, _target, ["isNotSwimming", "isNotSitting"]] call EFUNC(common,canInteractWith)
    };
    private _childenCode = {
        BEGIN_COUNTER(getActions); // can remove for final release
        private _ret = (call FUNC(reload_actionsLoad)) + (call FUNC(reload_actionsUnload));
        END_COUNTER(getActions);
        _ret
    };
    if (_configEnabled && {_magazineLocation != ""}) then {
        private _positionCode = compile _magazineLocation;
        private _ammoAction = [QGVAR(magazine), localize LSTRING(AmmoHandling_displayName), "", {}, _condition, _childenCode, [], _positionCode, 4] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 0, [], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    } else {
        private _ammoAction = [QGVAR(magazine), localize LSTRING(AmmoHandling_displayName), "", {}, _condition, _childenCode] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 0, ["ACE_MainActions"], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    };

    if (["ACE_reload"] call EFUNC(common,isModLoaded)) then {
        // move reload's check ammo action to the ammo handling point (remove and re-add)
        [_typeOf, 0, ["ACE_MainActions", QEGVAR(reload,CheckAmmo)]] call EFUNC(interact_menu,removeActionFromClass);
        private _checkAmmoAction = [QGVAR(checkAmmo), localize ELSTRING(reload,checkAmmo), "", EFUNC(reload,checkAmmo), EFUNC(reload,canCheckAmmo)] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, _ammoActionPath, _checkAmmoAction] call EFUNC(interact_menu,addActionToClass);
    };
};
