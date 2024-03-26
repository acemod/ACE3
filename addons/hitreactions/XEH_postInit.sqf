#include "script_component.hpp"

["ace_firedNonPlayer", {
    if (GVAR(weaponDropChanceGunHit) + GVAR(weaponDropChanceArmHit) == 0) exitWith {};

    params ["", "", "", "", "", "", "_projectile"];

    _projectile addEventHandler ["HitPart", {
        params ["", "", "", "_pos", "", "", "_components", "", "_surfaceType"];
        [_surfaceType, _components, _pos] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

["ace_firedPlayer", {
    if (GVAR(weaponDropChanceGunHit) + GVAR(weaponDropChanceArmHit) == 0) exitWith {};

    params ["", "", "", "", "", "", "_projectile"];

    _projectile addEventHandler ["HitPart", {
        params ["", "", "", "_pos", "", "", "_components", "", "_surfaceType"];
        [_surfaceType, _components, _pos] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

[QGVAR(doMove), {
    params ["_unit", "_pos"];

    _unit setDestination [_pos, "LEADER PLANNED", true];
    _unit doMove _pos;
}] call CBA_fnc_addEventHandler;

[QGVAR(dropGun), {
    params ["_unit"];

    private _weapon = currentWeapon _unit;
    private _thrownGun = _unit call EFUNC(common,throwWeapon);

    if (isPlayer _unit) exitWith {}; // Don't make the player pick its own gun up.

    [{
        (_this select 0) params ["_unit", "_weapon", "_thrownGun", "_timeout"];

        // If the unit has been deleted or dead, if the gun doesn't exist anymore or if it's been too long, stop
        if (!alive _unit || {isNull _thrownGun} || {CBA_missionTime >= _timeout}) exitWith {
            (_this select 1) call CBA_fnc_removePerFrameHandler;
        };

        // If the unit has no essential weapons, force them to get their weapon, otherwise wait until no enemies are present
        if ((primaryWeapon _unit == "" && {handgunWeapon _unit == ""}) || {(_unit distance (_unit findNearestEnemy _unit)) > GVAR(safePickupDistance)}) then {
            // If the unit is too far away, make them move closer
            if (_unit distance _thrownGun >= 4) exitWith {
                [QGVAR(doMove), [_unit, getPosATL _thrownGun]] call CBA_fnc_targetEvent;
            };

            (_this select 1) call CBA_fnc_removePerFrameHandler;

            [{
                params ["_unit", "_weapon", "_thrownGun"];

                _unit action ["TakeWeapon", _thrownGun, _weapon];
            }, [_unit, _weapon, _thrownGun], random [1, 2, 3]] call CBA_fnc_waitAndExecute;
        };
    }, 5, [_unit, _weapon, _thrownGun, CBA_missionTime + 300]] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
