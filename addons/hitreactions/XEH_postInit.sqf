#include "script_component.hpp"


[QGVAR(updateFiredEHs), {
    TRACE_2("updateFiredEH",GVAR(weaponDropChanceArmHitPlayer),GVAR(weaponDropChanceArmHitAI));
    if (GVAR(weaponDropChanceArmHitPlayer) + GVAR(weaponDropChanceArmHitAI) == 0) then {
        if (isNil QGVAR(firedEHs)) exitWith {};
        {
            _x call CBA_fnc_removeEventHandler;
        } forEach GVAR(firedEHs);
        GVAR(firedEHs) = nil;
        TRACE_1("removed EHs",GVAR(firedEHs));
    } else {
        if (!isNil QGVAR(firedEHs)) exitWith {};
        private _firedEH = {
            if (!local (_this select 0)) exitWith {};
            (_this select 6) addEventHandler ["HitPart", {
                params ["", "_entity", "", "", "", "", "_selections"];
                [_entity, _selections] call FUNC(checkWeaponDrop);
            }];
        };
        GVAR(firedEHs) = [];
        {
            GVAR(firedEHs) pushBack [_x, [_x, _firedEH] call CBA_fnc_addEventHandler];
        } forEach ["ace_firedNonPlayer", "ace_firedPlayer"];
        TRACE_1("added EHs",GVAR(firedEHs));
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(dropWeapon), {
    params ["_unit"];
    TRACE_1("dropWeaponEH",_unit);

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
                private _pos = getPosATL _thrownWeapon;

                _unit setDestination [_pos, "LEADER PLANNED", true];
                _unit doMove _pos;
            };

            (_this select 1) call CBA_fnc_removePerFrameHandler;

            _unit action ["TakeWeapon", _thrownWeapon, _weapon];

            // Make the unit switch weapons
            [{
                (_this select 0) hasWeapon (_this select 1)
            }, {
                params ["_unit", "_weapon"];

                if (!alive _unit || {!local _unit} || {primaryWeapon _unit != _weapon}) exitWith {};

                // Switch to the primary weapon, if it was picked up
                _unit selectWeapon _weapon;
            }, [_unit, _weapon], 5] call CBA_fnc_waitUntilAndExecute;
        }, 5, _this] call CBA_fnc_addPerFrameHandler;
    }, [_unit, _weapon, _thrownWeapon, CBA_missionTime + 300], random [2, 3, 4]] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
