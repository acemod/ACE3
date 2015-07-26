/*
 * Author: Norrin, Rocko, Ruthberg
 *
 * Handles HuntIR projectiles
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_7(_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

if (_ammo != "F_HuntIR") exitWith {};

[{
    PARAMS_1(_projectile);
 
    //If null (deleted or hit water) exit:
    if (isNull _projectile) exitWith {};
    //If it's not spinning (hit ground), bail:
    if ((vectorMagnitude (velocity _projectile)) < 0.1) exitWith {};

    "ACE_HuntIR_Propell" createVehicle (getPosATL _projectile);
    [{
        PARAMS_1(_position);
        private ["_huntir"];
        _huntir = createVehicle ["ACE_HuntIR", _position, [], 0, "FLY"];
        _huntir setPosATL _position;
        _huntir setVariable [QGVAR(startTime), ACE_time, true];
        [{
            EXPLODE_1_PVT(_this select 0,_huntir);
            if (isNull _huntir) exitWith {
                [_this select 1] call CBA_fnc_removePerFrameHandler;
            };
            private ["_parachuteDamage", "_velocity"];
            _parachuteDamage = _huntir getHitPointDamage "HitParachute";
            if (_parachuteDamage > 0) then {
                _velocity = velocity _huntir;
                _velocity set [2, -1 min -20 * sqrt(_parachuteDamage)];
                _huntir setVelocity _velocity;
                _huntir setVectorUp [0, 0, 1];
            };
        }, 0, [_huntir]] call CBA_fnc_addPerFrameHandler;
    }, [getPosATL _projectile vectorAdd [0, 0, 50]], 2, 0] call EFUNC(common,waitAndExecute);
}, [_projectile], 5, 0] call EFUNC(common,waitAndExecute);
