/*
 * Author: TCVM
 * Deploys the current CSW
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_csw_fnc_deployWeapon
 *
 * Public: No
 */
#include "script_component.hpp"

params["_tripod", "_player"];

[{
    params["_tripod", "_player"];
    private _carryWeaponClassname = secondaryWeapon _player;
    _player removeWeaponGlobal _carryWeaponClassname;
    
    private _onFinish = {
        params["_args"];
        _args params["_tripod", "_player", "_assembledClassname"];
        private _tripodPos = getPosATL _tripod;
        private _tripodDir = getDir _tripod;
    
        _tripodPos set[2, (_tripodPos select 2) + 0.5];
    
        private _csw = createVehicle [_assembledClassname, [0, 0, 0], [], 0, "NONE"];
        deleteVehicle _tripod;
        _csw setPosATL(_tripodPos);
        _csw setDir _tripodDir;
        _csw setVectorUp (surfaceNormal _tripodPos);

        // Set the ammo to zero so no config mess-ups will allow for infinite ammo
        _csw setAmmo[(weapons _csw) select 0, 0];
        
        _csw setVariable[QGVAR(enableCSW), true, true];
        [_csw] call FUNC(weaponInit);

        //[QGVAR(addObjectToServer), [_csw]] call CBA_fnc_serverEvent;
    };
    
    private _onFailure = {
        params["_args"];
        _args params["", "_player", "", "_carryWeaponClassname"];
        _player addWeaponGlobal _carryWeaponClassname;
    };
    
    private _codeCheck = {
        params["_args"];
        _args params["_tripod"];
        !isNull _tripod;
    };
    
    private _assembledClassname = getText(configfile >> "CfgWeapons" >> _carryWeaponClassname >> QGVAR(options) >> "assembleTo");
    private _weaponName = getArray(configFile >> "CfgVehicles" >> _assembledClassname >> "Turrets" >> "MainTurret" >> "weapons") select 0;
    private _deployTime = getNumber(configFile >> "CfgWeapons" >> _weaponName >> QGVAR(options) >> "deployTime");
    [_deployTime, [_tripod, _player, _assembledClassname, _carryWeaponClassname], _onFinish, _onFailure, localize LSTRING(AssembleCSW_progressBar), _codeCheck] call EFUNC(common,progressBar);
}, [_tripod, _player]] call CBA_fnc_execNextFrame;

