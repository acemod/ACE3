#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Initializes CSW systems on vehicle
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
if (_configEnabled && {_vehicle turretLocal [0]}) then { // if turret is local to us, then handle mags/weapon
    TRACE_2("turretLocal",_vehicle,GVAR(defaultAssemblyMode));

    // If the weapon was assembled by players, remove all magazines that spawn with the weapon
    private _emptyWeapon = _csw getVariable [QGVAR(assembled), false];

    [_vehicle, [0], GVAR(defaultAssemblyMode), _emptyWeapon] call FUNC(proxyWeapon);

    // If magazine handling is disabled, do not unload magazines
    if (GVAR(ammoHandling) == 0) exitWith {};

    [_vehicle, _emptyWeapon] call FUNC(staticWeaponInit_unloadExtraMags);
};

if (_assemblyConfig) then {
    TRACE_2("assemblyConfig present",_vehicle,GVAR(defaultAssemblyMode));
    if (GVAR(defaultAssemblyMode)) then { // Disable vanilla assembly if assemblyMode enabled
        [_vehicle, "disableWeaponAssembly", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
    };
};

// If magazine handling is disabled, don't enable ammo handling
if (GVAR(ammoHandling) == 0) exitWith {};

// Add interactions for players
if (hasInterface && {!(_typeOf in GVAR(initializedStaticTypes))}) then {
    GVAR(initializedStaticTypes) pushBack _typeOf;
    TRACE_1("Adding Actions",_typeOf);

    if (_assemblyConfig) then {
        private _disassembleAction = [QGVAR(disassemble), localize LSTRING(DisassembleCSW_displayName), "", {call FUNC(assemble_pickupWeapon)}, {call FUNC(assemble_canPickupWeapon)}] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, ["ACE_MainActions"], _disassembleAction] call EFUNC(interact_menu,addActionToClass);
    };


    private _ammoActionPath = [];
    private _magazineLocation = getText (_configOf >> QUOTE(ADDON) >> "magazineLocation");
    private _condition = { //IGNORE_PRIVATE_WARNING ["_target", "_player"];
        [_player, _target, ["isNotSwimming", "isNotSitting"]] call EFUNC(common,canInteractWith)
    };
    private _childenCode = {
        BEGIN_COUNTER(getActions); // can remove for final release
        private _ret = (call FUNC(getLoadActions)) + (call FUNC(getUnloadActions));
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

    if (["ace_reload"] call EFUNC(common,isModLoaded)) then {
        // move reload's check ammo action to the ammo handling point (remove and re-add)
        [_typeOf, 0, ["ACE_MainActions", QEGVAR(reload,CheckAmmo)]] call EFUNC(interact_menu,removeActionFromClass);
        private _checkAmmoAction = [QGVAR(checkAmmo), localize ELSTRING(reload,checkAmmo), "", EFUNC(reload,checkAmmo), EFUNC(reload,canCheckAmmo)] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, _ammoActionPath, _checkAmmoAction] call EFUNC(interact_menu,addActionToClass);
    };
};
