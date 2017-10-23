/*
 * Author: TCVM
 * Deploys the tripod
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_deployTripod
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player"];

[{
    params["_player"];
    // Remove the tripod from the launcher slot
    private _secondaryWeaponClassname = secondaryWeapon _player;
    _player removeWeaponGlobal (secondaryWeapon _player);
    
    private _onFinish = {
        params["_args"];
        _args params["_player", "_secondaryWeaponClassname"];
        
        private _tripodClassname = getText(configFile >> "CfgWeapons" >> _secondaryWeaponClassname >> QGVAR(options) >> "deploy");
                
        // Create a tripod
        private _cswTripod = createVehicle [_tripodClassname, [0, 0, 0], [], 0, "NONE"];
        
        _posATL = _player getRelPos[2, 0];
        _posATL set[2, ((getPosATL _player) select 2) + 0.5];

        _cswTripod setPosATL _posATL;
        _cswTripod setDir (direction _player);
        _cswTripod setVectorUp (surfaceNormal _tripodPos);

        [QGVAR(addObjectToServer), [_cswTripod]] call CBA_fnc_serverEvent;
        [_player, "PutDown"] call EFUNC(common,doGesture);
    };
    
    private _onFailure = {
        params["_args"];
        _args params["_player", "_secondaryWeaponClassname"];
        _player addWeaponGlobal _secondaryWeaponClassname;
    };
    
    private _deployTime = getNumber(configFile >> "CfgWeapons" >> _secondaryWeaponClassname >> QGVAR(options) >> "deployTime");
    [_deployTime, [_player, _secondaryWeaponClassname], _onFinish, _onFailure, localize LSTRING(PlaceTripod_progressBar)] call EFUNC(common,progressBar);
}, [_player]] call CBA_fnc_execNextFrame;

