#include "script_component.hpp"
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

[{
    params ["_staticWeapon", "_player"];
    TRACE_2("assemble_pickupWeapon",_staticWeapon,_player);

    private _onDisassembleFunc = getText(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "disassembleFunc");
    private _carryWeaponClassname = getText(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "disassembleWeapon");
    private _turretClassname = getText(configFile >> "CfgVehicles" >> (typeOf _staticWeapon) >> QUOTE(ADDON) >> "disassembleTurret");
    private _pickupTime = getNumber(configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "pickupTime");
    TRACE_4("",typeOf _staticWeapon,_carryWeaponClassname,_turretClassname,_pickupTime);
    if (!isClass (configFile >> "CfgWeapons" >> _carryWeaponClassname)) exitWith {ERROR_1("bad weapon classname [%1]",_carryWeaponClassname);};
    // Turret classname can equal nothing if the deploy bag is the "whole" weapon. e.g Kornet, Metis, other ATGMs
    if (!(_turretClassname isEqualTo "") && {!isClass (configFile >> "CfgVehicles" >> _turretClassname)}) exitWith {ERROR_1("bad turret classname [%1]",_turretClassname);};

    private _onFinish = {
        params ["_args"];
        _args params ["_staticWeapon", "_player", "_carryWeaponClassname", "_turretClassname", "_onDisassembleFunc"];
        TRACE_4("disassemble finish",_staticWeapon,_player,_carryWeaponClassname,_turretClassname);

        private _weaponPos = getPosATL _staticWeapon;
        _weaponPos set [2, (_weaponPos select 2) + 0.1];
        private _weaponDir = getDir _staticWeapon;

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
            if ((_xAmmo > 0) && {_carryMag != ""}) then {
                TRACE_2("Removing ammo",_xMag,_carryMag);
                [_player, _carryMag, _xAmmo] call FUNC(reload_handleReturnAmmo);
            };
        } forEach (magazinesAllTurrets _staticWeapon);

        if !(_turretClassname isEqualTo "") then {
            private _cswTripod = createVehicle [_turretClassname, [0, 0, 0], [], 0, "NONE"];
            // Delay a frame so weapon has a chance to be deleted
            [{
                params ["_cswTripod", "_weaponDir", "_weaponPos"];
                _cswTripod setDir _weaponDir;
                _cswTripod setPosATL _weaponPos;
                _cswTripod setVelocity [0, 0, -0.05];
                _cswTripod setVectorUp (surfaceNormal _weaponPos);
            }, [_cswTripod, _weaponDir, _weaponPos]] call CBA_fnc_execNextFrame;
            [_cswTripod, _staticWeapon] call (missionNamespace getVariable _onDisassembleFunc);
        };

        [{
            params ["_player", "_weaponPos", "_carryWeaponClassname"];
            if ((alive _player) && {(secondaryWeapon _player) == ""}) exitWith {
                _player addWeapon _carryWeaponClassname;
            };
            private _weaponRelPos = _weaponPos getPos RELATIVE_DIRECTION(90);
            private _weaponHolder = createVehicle ["groundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
            _weaponHolder setDir random [0, 180, 360];
            _weaponHolder setPosATL [_weaponRelPos select 0, _weaponRelPos select 1, _weaponPos select 2];
            _weaponHolder addWeaponCargoGlobal [_carryWeaponClassname, 1];
        }, [_player, _weaponPos, _carryWeaponClassname]] call CBA_fnc_execNextFrame;

        LOG("delete weapon");
        deleteVehicle _staticWeapon;

        LOG("end");
    };

    private _condition = {
        params ["_args"];
        _args params ["_staticWeapon"];
        ((crew _staticWeapon) isEqualTo []) && (alive _staticWeapon)
    };

    [TIME_PROGRESSBAR(_pickupTime), [_staticWeapon, _player, _carryWeaponClassname, _turretClassname, _onDisassembleFunc], _onFinish, {}, localize LSTRING(DisassembleCSW_progressBar), _condition] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;

