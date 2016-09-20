/*
 * Author: KoffeinFlummi, commy2, SilentSpike
 * Start a cook-off in the given ammo box.
 *
 * Arguments:
 * 0: Ammo box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box] call ace_cookoff_fnc_cookOffBox
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_box"];

if (_box getVariable [QGVAR(isCookingOff), false]) exitWith {};
_box setVariable [QGVAR(isCookingOff), true];

[QGVAR(cookOffBox), _box] call CBA_fnc_remoteEvent;

[{
    params ["_box"];

    // Box will start smoking
    private _smoke = "#particlesource" createVehicleLocal [0,0,0];
    _smoke setParticleClass "AmmoSmokeParticles2";
    _smoke attachTo [_box, [0,0,0]];

    private _effects = [_smoke];

    if (isServer) then {
        private _sound = createSoundSource ["Sound_Fire", position _box, [], 0];
        _effects pushBack _sound;
    };

    [{
        params ["_box", "_effects"];

        // These functions are smart and do all the cooking off work
        if (local _box) then {
            _box call FUNC(secondaryExplosions);
            if (_box getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmoCookoff)]) then {
                [_box, magazinesAmmo _box] call FUNC(detonateAmmunition);
            };

            // This shit is busy being on fire, magazines aren't accessible/usable
            clearMagazineCargoGlobal _box;
        };

        // Light the fire (also handles lighting)
        private _fire = "#particlesource" createVehicleLocal [0,0,0];
        _fire setParticleClass "AmmoBulletCore";
        _fire attachTo [_box, [0,0,0]];

        _effects pushBack _fire;

        [{
            params ["_box", "_effects"];

            {
                deleteVehicle _x;
            } forEach _effects;

            if (local _box) then {
                _box setDamage 1;
            };
        }, [_box, _effects], 45 + random 75] call CBA_fnc_waitAndExecute; // Give signifcant time for ammo cookoff to occur (perhaps keep the box alive until all cooked off?)
    }, [_box, _effects], 3 + random 15] call CBA_fnc_waitAndExecute;
}, _box, 0.5 + random 5] call CBA_fnc_waitAndExecute;
