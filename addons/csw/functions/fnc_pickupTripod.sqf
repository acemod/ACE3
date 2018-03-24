/*
 * Author: TCVM
 * Picks up the tripod and adds it to the player launcher slot
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [tripod, player] call ace_csw_fnc_pickupTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params["_tripod", "_player"];

[{
    params["_tripod", "_player"];
    private _onFinish = {
        params["_args"];
        _args params["_tripod", "_player", "_tripodClassname"];
        deleteVehicle _tripod;
        (_player select 1) addWeaponGlobal _tripodClassname;
        [(_player select 1), "PutDown"] call EFUNC(common,doGesture);
    };
    
    private _tripodClassname = getText(configFile >> "CfgVehicles" >> typeof(_tripod) >> QGVAR(options) >> "disassembleTo");
    private _pickupTime = getNumber(configFile >> "CfgWeapons" >> _tripodClassname >> QGVAR(options) >> "pickupTime");
    [_pickupTime, [_tripod, _player, _tripodClassname], _onFinish, FUNC(canPickupTripod), localize LSTRING(PickupTripod_progressBar)] call EFUNC(common,progressBar);
}, [_tripod, _player]] call CBA_fnc_execNextFrame;

