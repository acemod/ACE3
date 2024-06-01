#include "script_component.hpp"

["ace_firedNonPlayer", {
    if (GVAR(weaponDropChanceArmHitPlayer) + GVAR(weaponDropChanceArmHitAI) == 0) exitWith {};

    (_this select 6) addEventHandler ["HitPart", {
        params ["", "_entity", "", "", "", "", "_selections"];

        [_entity, _selections] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

["ace_firedPlayer", {
    if (GVAR(weaponDropChanceArmHitPlayer) + GVAR(weaponDropChanceArmHitAI) == 0) exitWith {};

    (_this select 6) addEventHandler ["HitPart", {
        params ["", "_entity", "", "", "", "", "_selections"];

        [_entity, _selections] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

[QGVAR(dropWeapon), {
    params ["_unit"];

    if !(_unit getVariable [QGVAR(canDropWeapon), true]) exitWith {};

    // Prevents AI from losing both primary and pistol when being shot with their pistol out
    _unit setVariable [QGVAR(canDropWeapon), false];

    private _weapon = currentWeapon _unit;
    private _thrownWeapon = _unit call EFUNC(common,throwWeapon);

    [{
        params ["_unit"];

        _unit setVariable [QGVAR(canDropWeapon), nil];
    }, _unit, 0.5] call CBA_fnc_waitAndExecute;

    if (_unit call EFUNC(common,isPlayer)) exitWith {}; // Don't make players pick their own weapons up

    // Wait before executing, as otherwise the unit would pick up the weapon immediately
    [{
        [{
            (_this select 0) params ["_unit", "_weapon", "_thrownWeapon", "_timeout"];

            // If the unit has been deleted or dead, if the weapon doesn't exist anymore or if it's been too long, stop
            if (!alive _unit || {!local _unit} || {isNull _thrownWeapon} || {CBA_missionTime >= _timeout}) exitWith {
                (_this select 1) call CBA_fnc_removePerFrameHandler;
            };

            // Don't pick up weapon when unit is unconscious
            if (lifeState _unit == "INCAPACITATED") exitWith {};

            // If the unit has no essential weapons, force them to get their weapon, otherwise wait until no enemies are present
            if !(
                (primaryWeapon _unit == "" && {handgunWeapon _unit == ""}) ||
                {(_unit distance (_unit findNearestEnemy _unit)) > missionNamespace getVariable [QGVAR(safePickupDistance), DEFAULT_PICKUP_DISTANCE]}
            ) exitWith {};

            // If the unit is too far away, make them move closer
            if (_unit distance _thrownWeapon >= 4) exitWith {
                _unit setDestination [_pos, "LEADER PLANNED", true];
                _unit doMove _pos;
            };

            (_this select 1) call CBA_fnc_removePerFrameHandler;

            _unit action ["TakeWeapon", _thrownWeapon, _weapon];

            // "TakeWeapon" action bugs out unit where they don't switch weapons
            // Resetting loadout fixes bugged state
            [{
                (_this select 0) hasWeapon (_this select 1)
            }, {
                params ["_unit", "_weapon"];

                if (!alive _unit || {!local _unit}) exitWith {};

                private _index = [primaryWeapon _unit, secondaryWeapon _unit, handgunWeapon _unit, binocular _unit] find _weapon;

                // Binoculars
                if (_index == 3) then {
                    _index = 8;
                };

                // Save the current weapon's items including magazines and ammo count
                private _currentWeaponsItems = (getUnitLoadout _unit) select _index;

                // Remove weapon classname
                _currentWeaponsItems deleteAt 0;

                // Using CBA_fnc_addWeaponWithoutItems makes the unit reload, which we don't want
                _unit addWeaponGlobal _weapon;

                // Save the magazines that were automatically added to the gun when using addWeapon
                private _magazines = ((getUnitLoadout _unit) select _index) select [4, 2];

                // Doesn't remove magazines
                switch (_index) do {
                    case 0: {
                        removeAllPrimaryWeaponItems _unit;
                    };
                    case 1: {
                        removeAllSecondaryWeaponItems _unit;
                    };
                    case 2: {
                        removeAllHandgunItems _unit;
                    };
                    case 8: {
                        removeAllBinocularItems _unit;
                    };
                };

                // Re-add magazines that were automatically added to weapon back into inventory
                {
                    if (_x isEqualTo []) then {
                        continue;
                    };

                    if ([_unit, _x select 0, 1, true, true, true] call CBA_fnc_canAddItem) then {
                        _unit addMagazine _x;
                    } else {
                        // If there is no space, it means the unit was overloaded, so insert it anywhere possible
                        private _magazine = _x;
                        private _added = false;

                        {
                            if (!isNull _x) exitWith {
                                _x addMagazineAmmoCargo [_magazine select 0, 1, _magazine select 1];

                                _added = true;
                            };
                        } forEach [backpackContainer _unit, vestContainer _unit, uniformContainer _unit];

                        // If the magazine couldn't be added, then drop it on the ground
                        if (!_added) then {
                            [_unit, _x select 0, _x select 1, true] call CBA_fnc_addMagazine;
                        };
                    };
                } forEach _magazines;

                // Add the previous attachments back to the weapon
                {
                    // If no magazine was previously loaded, remove it
                    if (_forEachIndex in [3, 4] && {_x isEqualTo []}) then {
                        switch (_index) do {
                            case 0: {
                                _unit removePrimaryWeaponItem ((_magazines select (_forEachIndex - 3)) param [0, ""]);
                            };
                            case 1: {
                                _unit removeSecondaryWeaponItem ((_magazines select (_forEachIndex - 3)) param [0, ""]);
                            };
                            case 2: {
                                _unit removeHandgunItem ((_magazines select (_forEachIndex - 3)) param [0, ""]);
                            };
                            case 8: {
                                _unit removeBinocularItem ((_magazines select (_forEachIndex - 3)) param [0, ""]);
                            };
                        };
                    } else {
                        if (_x isNotEqualTo "") then {
                            _unit addWeaponItem [_weapon, _x, true];
                        };
                    };
                } forEach _currentWeaponsItems;

                // Switch to the primary weapon
                if (_index == 0) then {
                    _unit selectWeapon ((_unit weaponState _weapon) select 1);
                };
            }, [_unit, _weapon], 5] call CBA_fnc_waitUntilAndExecute;
        }, 5, _this] call CBA_fnc_addPerFrameHandler;
    }, [_unit, _weapon, _thrownWeapon, CBA_missionTime + 300], random [2, 3, 4]] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
