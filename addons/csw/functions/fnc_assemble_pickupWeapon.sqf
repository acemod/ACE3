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
 * [weapon] call ace_csw_fnc_assemble_pickupWeapon
 *
 * Public: No
 */
#include "script_component.hpp"

[{
    params ["_staticWeapon"];
    TRACE_1("assemble_pickupWeapon",_staticWeapon);

    private _carryWeaponClassname = getText(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "disassembleWeapon");
    private _turretClassname = getText(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "disassembleTurret");
    private _pickupTime = getNumber(configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "pickupTime");
    TRACE_4("",typeOf _staticWeapon,_carryWeaponClassname,_turretClassname,_pickupTime);
    if (!isClass (configFile >> "CfgWeapons" >> _carryWeaponClassname)) exitWith {ERROR_1("bad weapon classname [%1]",_carryWeaponClassname);};
    if (!isClass (configFile >> "CfgVehicles" >> _turretClassname)) exitWith {ERROR_1("bad turret classname [%1]",_turretClassname);};

    private _onFinish = {
        params ["_args"];
        _args params ["_staticWeapon", "_carryWeaponClassname", "_turretClassname"];
        TRACE_3("disassemble finish",_staticWeapon,_carryWeaponClassname,_turretClassname);

        private _weaponPos = getPosATL _staticWeapon;
        _weaponPos set [2, (_weaponPos select 2) + 0.1];
        private _weaponDir = getDir _staticWeapon;

        // Create magazine holder and spawn the ammo that was in the weapon
        private _weaponRelPos = _staticWeapon getRelPos RELATIVE_DIRECTION(270);
        private _ammoHolder = createVehicle ["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
        _ammoHolder setPosATL [_weaponRelPos select 0, _weaponRelPos select 1, _weaponPos select 2];
        _ammoHolder setVectorUp (surfaceNormal _weaponRelPos);
        _ammoHolder setDir random [0, 180, 360];

        LOG("remove ammo");
        {
            _x params ["_xMag", "", "_xAmmo"];

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

                _ammoHolder addMagazineAmmoCargo [_carryMag, floor(_xAmmo / _carryMagAmmo), _carryMagAmmo];
                _ammoHolder addMagazineAmmoCargo [_carryMag, 1, _bulletsRemaining];
            };
        } forEach (magazinesAllTurrets _staticWeapon);
        
        LOG("delete weapon");

        deleteVehicle _staticWeapon;

        private _cswTripod = createVehicle [_turretClassname, [0, 0, 0], [], 0, "NONE"];
        _cswTripod setPosATL _weaponPos;
        _cswTripod setDir _weaponDir;
        _cswTripod setVelocity [0, 0, -0.05];
        _cswTripod setVectorUp (surfaceNormal _weaponPos);

        _weaponRelPos = _cswTripod getRelPos RELATIVE_DIRECTION(90);
        private _weaponHolder = createVehicle ["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
        _weaponHolder setPosATL [_weaponRelPos select 0, _weaponRelPos select 1, _weaponPos select 2];
        _weaponHolder setDir random [0, 180, 360];
        _weaponHolder addWeaponCargoGlobal [_carryWeaponClassname, 1];

        LOG("end");
    };

    private _condition = {
        params ["_args"];
        _args params ["_staticWeapon"];
        ((crew _staticWeapon) isEqualTo []) && (alive _staticWeapon)
    };

    [TIME_PROGRESSBAR(_pickupTime), [_staticWeapon, _carryWeaponClassname, _turretClassname], _onFinish, {}, localize LSTRING(DisassembleCSW_progressBar), _condition] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;

