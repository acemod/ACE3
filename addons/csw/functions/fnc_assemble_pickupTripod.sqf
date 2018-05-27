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
 * [tripod, player] call ace_csw_fnc_assemble_pickupTripod
 *
 * Public: No
 */
#include "script_component.hpp"

[{
    params["_tripod", "_player"];
    TRACE_2("assemble_pickupTripod",_tripod,_player);

    private _tripodClassname = getText(configFile >> "CfgVehicles" >> (typeof _tripod) >> QUOTE(ADDON) >> "disassembleTo");
    private _pickupTime = getNumber(configFile >> "CfgWeapons" >> _tripodClassname >> QUOTE(ADDON) >> "pickupTime");
    
    private _onFinish = {
        params["_args"];
        _args params["_tripod", "_player", "_tripodClassname"];
        TRACE_3("assemble_pickupTripod finish",_tripod,_player,_tripodClassname);
        
        deleteVehicle _tripod;
        (_player select 1) addWeaponGlobal _tripodClassname;
        [(_player select 1), "PutDown"] call EFUNC(common,doGesture);
    };
    
    TRACE_3("",_pickupTime,typeOf _tripod,_tripodClassname);
    [TIME_PROGRESSBAR(_pickupTime), [_tripod, _player, _tripodClassname], _onFinish, FUNC(assemble_canPickupTripod), localize LSTRING(PickupTripod_progressBar)] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;

