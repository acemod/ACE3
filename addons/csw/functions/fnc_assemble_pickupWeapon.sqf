#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Dismounts the weapon from the tripod and drops its backpack beside.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_assemble_pickupWeapon
 *
 * Public: No
 */

[{
    params ["_vehicle", "_player"];
    TRACE_2("assemble_pickupWeapon",_vehicle,_player);

    private _weaponConfig = configOf _vehicle >> QUOTE(ADDON);
    private _componentClasses = _vehicle getVariable QGVAR(componentClasses);

    (if (!isNil "_componentClasses") then {
        _componentClasses
    } else {
        [getText (_weaponConfig >> "disassembleTurret"), getText (_weaponConfig >> "disassembleWeapon")]
    }) params ["_turretClassname", "_carryWeaponClassname"];

    if (!isClass (configFile >> "CfgWeapons" >> _carryWeaponClassname)) exitWith {
        ERROR_1("bad weapon classname [%1]",_carryWeaponClassname);
    };

    // Turret classname can equal nothing if the deploy bag is the "whole" weapon. e.g Kornet, Metis, other ATGMs
    if ((_turretClassname != "") && {!isClass (configFile >> "CfgVehicles" >> _turretClassname)}) exitWith {
        ERROR_1("bad turret classname [%1]",_turretClassname);
    };

    private _onDisassembleFunc = getText (_weaponConfig >> "disassembleFunc");

    private _pickupTime = getNumber (configFile >> "CfgWeapons" >> _carryWeaponClassname >> QUOTE(ADDON) >> "pickupTime");
    TRACE_4("",typeOf _vehicle,_carryWeaponClassname,_turretClassname,_pickupTime);

    private _onFinish = {
        params ["_args"];
        _args params ["_vehicle", "_player", "_carryWeaponClassname", "_turretClassname", "_onDisassembleFunc"];
        TRACE_4("disassemble finish",_vehicle,_player,_carryWeaponClassname,_turretClassname);

        private _weaponPos = (getPosATL _vehicle) vectorAdd [0, 0, 0.1];
        private _weaponDir = getDir _vehicle;

        private _carryWeaponMag = [];
        private _carryWeaponMags = compatibleMagazines _carryWeaponClassname;
        LOG("remove ammo");
        {
            _x params ["_xMag", "", "_xAmmo"];
            if (_xAmmo == 0) then {continue};

            private _carryMag = _xMag call FUNC(getCarryMagazine);
            if (_carryWeaponMag isEqualTo [] && {_carryMag in _carryWeaponMags}) then {
                TRACE_3("Adding mag to secondary weapon",_xMag,_xAmmo,_carryMag);
                _carryWeaponMag = [_carryMag, _xAmmo];

                // Do not return this magazine, as it will be put into the weapon
                continue;
            };
            if ((_xAmmo > 0) && {_carryMag != ""}) then {
                TRACE_2("Removing ammo",_xMag,_carryMag);
                [_player, _carryMag, _xAmmo] call FUNC(reload_handleReturnAmmo);
            };
        } forEach (magazinesAllTurrets _vehicle);

        if (_turretClassname isNotEqualTo "") then {
            private _cswTripod = createVehicle [_turretClassname, [0, 0, 0], [], 0, "NONE"];
            // Delay a frame so weapon has a chance to be deleted
            [{
                params ["_cswTripod", "_weaponDir", "_weaponPos"];
                _cswTripod setDir _weaponDir;
                _cswTripod setPosATL _weaponPos;
                _cswTripod setVelocity [0, 0, -0.05];
                _cswTripod setVectorUp (surfaceNormal _weaponPos);
            }, [_cswTripod, _weaponDir, _weaponPos]] call CBA_fnc_execNextFrame;
            [_cswTripod, _vehicle] call (missionNamespace getVariable _onDisassembleFunc);
        };

        [{
            params ["_player", "_weaponPos", "_carryWeaponClassname", "_carryWeaponMag", "_turretClassname"];

            private _carryWeaponType = _carryWeaponClassname call EFUNC(common,getWeaponType);

            if !(_carryWeaponType in [1, 2]) exitWith {
                ERROR_1("bad carry weapon type [%1]",_carryWeaponClassname);

                if (_carryWeaponMag isEqualTo []) exitWith {};

                // Return the ammo, so it doesn't vanish
                [_player, _carryWeaponMag select 0, _carryWeaponMag select 1] call FUNC(reload_handleReturnAmmo);
            };

            // Give the weapon to the player if possible
            if ((alive _player) && {([primaryWeapon _player, secondaryWeapon _player] select (_carryWeaponType - 1)) == ""}) exitWith {
                [_player, _carryWeaponClassname] call CBA_fnc_addWeaponWithoutItems;

                if (_carryWeaponMag isNotEqualTo []) then {
                    _player addWeaponItem [_carryWeaponClassname, _carryWeaponMag, true];
                };
            };

            // If there is no turret, place the ground holder where the turret was
            if (_turretClassname != "") then {
                _weaponPos = _weaponPos getPos RELATIVE_DIRECTION(90);
            };

            // Create a new weapon holder (don't try to get an existing one, as no guarantee where it could be)
            private _weaponHolder = createVehicle ["GroundWeaponHolder", [0, 0, 0], [], 0, "CAN_COLLIDE"];
            _weaponHolder setDir random [0, 180, 360];
            _weaponHolder setVehiclePosition [_weaponPos, [], 0, "CAN_COLLIDE"]; // Places object on surface below
            _weaponHolder addWeaponWithAttachmentsCargoGlobal [[_carryWeaponClassname, "", "", "", _carryWeaponMag, [], ""], 1];
        }, [_player, _weaponPos, _carryWeaponClassname, _carryWeaponMag, _turretClassname]] call CBA_fnc_execNextFrame;

        LOG("delete weapon");

        // Eject dead units (all crew are dead or UAV at this point, otherwise condition would have failed), but ignore UAV units
        {
            if (unitIsUAV _x) then {
                _vehicle deleteVehicleCrew _x;
            } else {
                moveOut _x;
            };
        } forEach (crew _vehicle);

        deleteVehicle _vehicle;

        LOG("end");
    };

    private _condition = {
        params ["_args"];
        _args params ["_vehicle"];

        _vehicle call FUNC(assemble_canPickupWeapon)
    };

    [TIME_PROGRESSBAR(_pickupTime), [_vehicle, _player, _carryWeaponClassname, _turretClassname, _onDisassembleFunc], _onFinish, {}, LLSTRING(DisassembleCSW_progressBar), _condition] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;
