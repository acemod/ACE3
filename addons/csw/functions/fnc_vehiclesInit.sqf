#include "../script_component.hpp"
 /*
 * Author: [KND]Liquid, Brandon (TCVM)
 * Describe your function
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_csw_fnc_vehiclesInit;
 *
 * Public: No
 */

params ["_vehicle"];
if (isNull _vehicle) exitWith { WARNING_1("%1 became null",_vehicle) };
private _typeOf = typeOf _vehicle;
private _configOf = configOf _vehicle;
private _configEnabled = (getNumber (_configOf >> "ace_csw" >> "enabled")) == 1;
private _proxyWeapon = getText(_configOf >> "ace_csw" >> "proxyWeapon");
private _turretsAffected = parseSimpleArray ((_configOf >> "ace_csw" >> "turrets") call BIS_fnc_getCfgData);


if (isNil "_turretsAffected") then {
    _turretsAffected = [[0]];
};

TRACE_1("",_turretsAffected);
private _enableAmmoHandling = GVAR(ammoHandling) > 0 || GVAR(defaultAssemblyMode);
TRACE_5("vehicleInit",_vehicle,_typeOf,_configEnabled,_proxyWeapon,_enableAmmoHandling);

if (_configEnabled && {local _vehicle}) then { // need to wait a frame to allow setting object vars during assembly
    {
        [FUNC(vehiclesInit_unloadExtraMags), [_vehicle,_x]] call CBA_fnc_execNextFrame;
    } forEach _turretsAffected;
};

if (hasInterface && {!(_typeOf in GVAR(initializedVehicleTypes))}) then {
    GVAR(initializedVehicleTypes) pushBack _typeOf;
    TRACE_1("Adding Actions",_typeOf);

    private _condition = {[_player, _target, []] call EFUNC(common,canInteractWith) && {[_player] call CBA_fnc_vehicleRole == "gunner" || [_player] call CBA_fnc_vehicleRole == "commander"}};
    private _childenCode = {
        params ["_vehicle", "_player", "_params"];
        _params params ["_turretsAffected"];

        TRACE_3("=======================",_player,_vehicle,_turretsAffected);
        BEGIN_COUNTER(getActions); // can remove for final release
        //private _ret = ([_vehicle,_player,_turretsAffected] call FUNC(reload_actionsLoad)) + ([_vehicle,_player,_turretsAffected] call FUNC(reload_actionsUnload));
        private _ret = (call FUNC(reload_actionsLoad)) + (call FUNC(reload_actionsUnload));
        END_COUNTER(getActions);
        _ret
    };

    private _ammoActionPath = [];
    // If magazine handling is enabled or weapon assembly/disassembly is enabled we enable ammo handling
    if (_enableAmmoHandling) then {
        //if (_configEnabled) then {
            private _ammoAction = [QGVAR(magazine), localize LSTRING(AmmoHandling_displayName), "", {}, _condition, _childenCode,[_turretsAffected]] call EFUNC(interact_menu,createAction);
            _ammoActionPath = [_typeOf, 1, ["ACE_SelfActions"], _ammoAction] call EFUNC(interact_menu,addActionToClass);
        //};
    };
    if (["ACE_reload"] call EFUNC(common,isModLoaded)) then {
        private _checkAmmoAction = [QGVAR(checkAmmo), localize ELSTRING(reload,checkAmmo), "", {[_player, _target] call EFUNC(reload,checkAmmo)}, {[_player, _target] call EFUNC(reload,canCheckAmmo)}] call EFUNC(interact_menu,createAction);
        [_typeOf, 1, _ammoActionPath, _checkAmmoAction] call EFUNC(interact_menu,addActionToClass);
    };
};
