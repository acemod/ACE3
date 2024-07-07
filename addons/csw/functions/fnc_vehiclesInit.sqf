#include "..\script_component.hpp"
/*
 * Author: [KND]Liquid, Brandon (TCVM)
 * Initializes CSW systems on vehicle
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_csw_fnc_vehiclesInit;
 *
 * Public: No
 */

params ["_vehicle"];
if (!alive _vehicle) exitWith { WARNING_1("%1 not alive",_vehicle); };
if (!simulationEnabled _vehicle) exitWith {
    [{simulationEnabled _this}, FUNC(vehiclesInit), _vehicle] call CBA_fnc_waitUntilAndExecute;
};

private _typeOf = typeOf _vehicle;
private _configOf = configOf _vehicle;
private _configEnabled = (getNumber (_configOf >> QUOTE(ADDON) >> "enabled")) == 1;
private _assemblyConfig = _configEnabled && {(getText (_configOf >> QUOTE(ADDON) >> "disassembleWeapon")) != ""};
TRACE_4("initVehicle",_vehicle,_typeOf,_configEnabled,_assemblyConfig);

private _turretsAffected = parseSimpleArray ((_configOf >> QUOTE(ADDON) >> "turrets") call BIS_fnc_getCfgData);

if (isNil "_turretsAffected") then {
    _turretsAffected = [[0]];
};

TRACE_2("vehicleInit turretsAffected",local _vehicle,_turretsAffected);

private _enableAmmoHandling = GVAR(ammoHandling) > 0 || GVAR(defaultAssemblyMode);
TRACE_4("vehicleInit",_vehicle,_typeOf,_configEnabled,_enableAmmoHandling);

if (_configEnabled && {local _vehicle}) then { // need to wait a frame to allow setting object vars during assembly
    {
        [FUNC(vehiclesInit_unloadExtraMags), [_vehicle,_x]] call CBA_fnc_execNextFrame;
    } forEach _turretsAffected;
};

// Add interactions for players
if (hasInterface && {!(_typeOf in GVAR(initializedVehicleTypes))}) then {
    GVAR(initializedVehicleTypes) pushBack _typeOf;
    TRACE_1("Adding Actions",_typeOf);


    private _ammoActionPath = [];
    private _magazineLocation = getText (_configOf >> QUOTE(ADDON) >> "magazineLocation");
    private _condition = {[_player, _target, []] call EFUNC(common,canInteractWith)
        && {[_player] call CBA_fnc_vehicleRole == "gunner"
        || [_player] call CBA_fnc_vehicleRole == "commander"}};
    private _childenCode = {
        params ["_vehicle", "_player", "_params"];
        _params params ["_turretsAffected"];

        TRACE_3("=======================",_player,_vehicle,_turretsAffected);
        BEGIN_COUNTER(getActions); // can remove for final release
        //private _ret = ([_vehicle,_player,_turretsAffected] call FUNC(reload_actionsLoad)) + ([_vehicle,_player,_turretsAffected] call FUNC(reload_actionsUnload));
        private _ret = (call FUNC(getLoadActions)) + (call FUNC(getUnloadActions));
        END_COUNTER(getActions);
        _ret
    };
    if (_enableAmmoHandling) then {
        private _ammoAction = [QGVAR(magazine), LLSTRING(AmmoHandling_displayName), "", {}, _condition, _childenCode,[_turretsAffected]] call EFUNC(interact_menu,createAction);
        _ammoActionPath = [_typeOf, 1, ["ACE_SelfActions"], _ammoAction] call EFUNC(interact_menu,addActionToClass);
    };
};
