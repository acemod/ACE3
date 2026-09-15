#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Picks up the tripod and adds it to the player launcher slot.
 *
 * Arguments:
 * 0: Tripod <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_assemble_pickupTripod
 *
 * Public: No
 */

[{
    params ["_tripod", "_player"];
    TRACE_2("assemble_pickupTripod",_tripod,_player);

    private _tripodClassname = getText (configOf _tripod >> QUOTE(ADDON) >> "disassembleTo");
    private _pickupTime = getNumber (configFile >> "CfgWeapons" >> _tripodClassname >> QUOTE(ADDON) >> "pickupTime");

    private _onFinish = {
        params ["_args"];
        _args params ["_tripod", "_player", "_tripodClassname"];
        TRACE_3("assemble_pickupTripod finish",_tripod,_player,_tripodClassname);

        // Save tripod position before it's deleted
        private _tripodPos = getPosATL _tripod;

        // Eject dead units (all crew are dead at this point, otherwise condition would have failed), but ignore UAV units
        {
            if (unitIsUAV _x) then {
                _tripod deleteVehicleCrew _x;
            } else {
                moveOut _x;
            };
        } forEach (crew _tripod);

        deleteVehicle _tripod;

        [_player, "PutDown"] call EFUNC(common,doGesture);

        // If the player has space, give it to him
        if ((alive _player) && {(secondaryWeapon _player) == ""}) exitWith {
            [_player, _tripodClassname] call CBA_fnc_addWeaponWithoutItems;
        };

        // Try to find existing weapon holders
        private _weaponHolder = nearestObject [_tripodPos, "WeaponHolder"];

        // If there are none or too far away, make a new one
        if (isNull _weaponHolder || {_tripodPos distance _weaponHolder > 2}) then {
            _weaponHolder = createVehicle ["GroundWeaponHolder", [0, 0, 0], [], 0, "CAN_COLLIDE"];
            _weaponHolder setDir random [0, 180, 360];
            _weaponHolder setVehiclePosition [_tripodPos, [], 0, "CAN_COLLIDE"]; // Places object on surface below
        };

        _weaponHolder addWeaponCargoGlobal [_tripodClassname, 1];
    };

    private _condition = {
        params ["_args"];
        _args params ["_tripod"];

        _tripod call FUNC(canPickupTripod)
    };

    TRACE_3("",_pickupTime,typeOf _tripod,_tripodClassname);
    [TIME_PROGRESSBAR(_pickupTime), [_tripod, _player, _tripodClassname], _onFinish, {}, LLSTRING(PickupTripod_progressBar), _condition] call EFUNC(common,progressBar);
}, _this] call CBA_fnc_execNextFrame;
