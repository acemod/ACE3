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
#include "script_component.hpp"

params ["_staticWeapon"];
private _typeOf = typeOf _staticWeapon;
private _configEnabled = (getNumber (configFile >> "CfgVehicles" >> _typeOf >> "ace_csw" >> "enabled")) == 1;
private _assemblyConfig = _configEnabled && {(getText (configFile >> "CfgVehicles" >> _typeOf >> "ace_csw" >> "disassembleWeapon")) != ""};
TRACE_4("staticWeaponInit",_staticWeapon,_typeOf,_configEnabled,_assemblyConfig);

if (_configEnabled && {local _staticWeapon}) then { // need to wait a frame to allow setting object vars during assembly
    [FUNC(staticWeaponInit_unloadExtraMags), [_staticWeapon]] call CBA_fnc_execNextFrame;
};

if (_assemblyConfig) then { // Disable vanilla assembly if assemblyMode eanbled
    private _assemblyMode = [false, true, GVAR(defaultAssemblyMode)] select (_staticWeapon getVariable [QGVAR(assemblyMode), 2]);
    _staticWeapon setVariable [QGVAR(assemblyMode), 0];
    if (_assemblyMode) then {
        _staticWeapon setVariable [QGVAR(assemblyMode), 1];
        [QGVAR(disableVanillaAssembly), [_staticWeapon]] call CBA_fnc_localEvent;
    };
};

if (hasInterface && {!(_typeOf in GVAR(initializedStaticTypes))}) then {
    GVAR(initializedStaticTypes) pushBack _typeOf;
    TRACE_1("Adding Actions",_typeOf);

    if (_assemblyConfig) then {
        private _disassembleAction = [QGVAR(disassemble), localize LSTRING(DisassembleCSW_displayName), "", {call FUNC(assemble_pickupWeapon)}, {call FUNC(assemble_canPickupWeapon)}] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, ["ACE_MainActions"], _disassembleAction] call EFUNC(interact_menu,addActionToClass);
    };

    private _magazineLocation = getText (configFile >> "CfgVehicles" >> _typeOf >> QUOTE(ADDON) >> "magazineLocation");
    private _condition = {[_player, _target, []] call EFUNC(common,canInteractWith)};
    private _childenCode = {
        BEGIN_COUNTER(getActions); // can remove for final release
        private _ret = (call FUNC(reload_actionsLoad)) + (call FUNC(reload_actionsUnload));
        END_COUNTER(getActions);
        _ret
    };

    private _ammoActionPath = [];
    if (_configEnabled && {_magazineLocation != ""}) then {
        private _positionCode = compile _magazineLocation;
        private _ammoAction = [QGVAR(magazine), localize LSTRING(AmmoHandling_displayName), "", {}, _condition, _childenCode, [], _positionCode, 4] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 0, [], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    } else {
        private _ammoAction = [QGVAR(magazine), localize LSTRING(AmmoHandling_displayName), "", {}, _condition, _childenCode] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 0, ["ACE_MainActions"], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    };
    if (["ACE_reload"] call EFUNC(common,isModLoaded)) then {
        private _checkAmmoAction = [QGVAR(checkAmmo), localize ELSTRING(reload,checkAmmo), "", {[_player, _target] call EFUNC(reload,checkAmmo)}, {[_player, _target] call EFUNC(reload,canCheckAmmo)}] call EFUNC(interact_menu,createAction);
        [_typeOf, 0, _ammoActionPath, _checkAmmoAction] call EFUNC(interact_menu,addActionToClass);
    };
};
