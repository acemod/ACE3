/*
 * Author: TCVM
 * Dismounts the weapon from the tripod and drops its backpack beside
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_dismountWeapon
 *
 * Public: No
 */
#include "script_component.hpp"

params["_weapon"];

if (isNull GVAR(cswTripod)) then {
    [{
        params["_weapon"];
        private _onFinish = {
            params["_args"];
            _args params["_weapon"];
            
            LOG("start disassemble");
            
            private _carryWeaponClassname = getText(configFile >> "CfgVehicles" >> typeof(_weapon) >> QGVAR(options) >> "disassembleTo");
            private _tripodName = getText(configFile >> "CfgWeapons" >> _carryWeaponClassname >> QGVAR(options) >> "baseTripod");
            
            TRACE_2("disassemble", _carryWeaponClassname, _tripodName);
            
            private _weaponPos = getPosATL _weapon;
            _weaponPos set[2, (_weaponPos select 2) + 0.1];
            private _weaponDir = getDir _weapon;
            
            // Create magazine holder and spawn the ammo that was in the weapon
            private _weaponRelPos = _weapon getRelPos RELATIVE_DIRECTION(270);
            private _ammoHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
            _ammoHolder setPosATL _weaponRelPos;
            _ammoHolder setVectorUp (surfaceNormal _weaponRelPos);
            _ammoHolder setDir random[0, 180, 360];
            
            LOG("remove ammo");
            {
                _x params ["_xMag", "_xTurret", "_xAmmo"];
 
                private _carryMag = GVAR(vehicleMagCache) getVariable _xMag;
                if (isNil "_carryMag") then {
                    private _groups = "getNumber (_x >> _xMag) == 1" configClasses (configFile >> QGVAR(groups));
                    _carryMag = configName (_groups param [0, configNull]);
                    GVAR(vehicleMagCache) setVariable [_xMag, _carryMag];
                    TRACE_2("setting cache",_xMag,_carryMag);
                };
                if (_carryMag != "") then {
                    private _carryMagAmmo = getNumber(configFile >> "CfgMagazines" >> _carryMag >> "count");
                    private _bulletsRemaining = _xAmmo % _carryMagAmmo;
                    
                    _ammoHolder addMagazineAmmoCargo[_carryMag, floor(_xAmmo / _carryMagAmmo), _carryMagAmmo];
                    _ammoHolder addMagazineAmmoCargo[_carryMag, 1, _bulletsRemaining];
                };
            } forEach (magazinesAllTurrets _weapon);
            
            LOG("delete weapon");
            
            deleteVehicle _weapon;
            
            private _cswTripod = createVehicle [_tripodName, [0, 0, 0], [], 0, "NONE"];
            _cswTripod setPosATL _weaponPos;
            _cswTripod setDir _weaponDir;
            _cswTripod setVelocity [0, 0, -0.05];
            _cswTripod setVectorUp (surfaceNormal _weaponPos);
                
            _weaponPos = _cswTripod getRelPos RELATIVE_DIRECTION(90);
            private _weaponHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
            _weaponHolder setPosATL _weaponPos;
            _weaponHolder setDir random[0, 180, 360];
            _weaponHolder addWeaponCargoGlobal[_carryWeaponClassname, 1];
            
            LOG("end");
        };
        
        private _condition = {
            params["_args"];
            _args params["_weapon"];
            ((crew _weapon) isEqualTo []) && (alive _weapon)
        };
        
        private _turretClassname = getArray(configFile >> "CfgVehicles" >> typeof(_weapon) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
        private _deployTime = getNumber(configFile >> "CfgWeapons" >> _turretClassname >> QGVAR(options) >> "pickupTime");
        if (isNull (configFile >> "CfgWeapons" >> _turretClassname >> QGVAR(options) >> "pickupTime")) then {
            _deployTime = 3;
        };
        [_deployTime, [_weapon], _onFinish, {}, localize LSTRING(DisassembleCSW_progressBar), _condition] call EFUNC(common,progressBar);
    }, [_weapon]] call CBA_fnc_execNextFrame;
};

