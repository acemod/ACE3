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
            
            private _carryWeaponClassname = getText(configFile >> "CfgVehicles" >> typeof(_weapon) >> QGVAR(options) >> "disassembleTo");
            private _tripodName = getText(configFile >> "CfgWeapons" >> _carryWeaponClassname >> QGVAR(options) >> "baseTripod");
            
            private _weaponPos = getPosATL _weapon;
            _weaponPos set[2, (_weaponPos select 2) + 0.1];
            private _weaponDir = getDir _weapon;

            [_weapon, false, true] call FUNC(unloadAmmo);
            
            deleteVehicle _weapon;
            
            private _cswTripod = createVehicle [_tripodName, [0, 0, 0], [], 0, "NONE"];
            _cswTripod setPosATL _weaponPos;
            _cswTripod setDir _weaponDir;
            _cswTripod setVelocity [0, 0, -0.05];
            _cswTripod setVectorUp (surfaceNormal _weaponPos);
                
            _weaponPos = _cswTripod getRelPos[1.5, 90];
            private _weaponHolder = createVehicle["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
            _weaponHolder setPosATL _weaponPos;
            _weaponHolder setDir random[0, 180, 360];
            _weaponHolder addWeaponCargoGlobal[_carryWeaponClassname, 1];
            
        };
        
        private _crewCheck = {
            params["_args"];
            _args params["_weapon"];
            ((crew _weapon) isEqualTo [])
        };
        
        private _turretClassname = getArray(configFile >> "CfgVehicles" >> typeof(_weapon) >> "Turrets" >> "MainTurret" >> "weapons") select 0;
        private _deployTime = getNumber(configFile >> "CfgWeapons" >> _turretClassname >> QGVAR(options) >> "pickupTime");
        [_deployTime, [_weapon], _onFinish, {}, localize LSTRING(DisassembleCSW_progressBar), _crewCheck] call EFUNC(common,progressBar);
    }, [_weapon]] call CBA_fnc_execNextFrame;
};

