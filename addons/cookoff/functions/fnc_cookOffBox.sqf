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

    // These functions are smart and do all the cooking off work
    if (local _box) then {
        _box call FUNC(secondaryExplosions);
        if (_box getVariable [QGVAR(enableAmmoCookoff), GVAR(enableAmmoCookoff)]) then {
            [_box, magazinesAmmo _box] call FUNC(detonateAmmunition);
        };
    };

    [{
        params ["_box", "_effects"];

        // This shit is busy being on fire, magazines aren't accessible/usable
        if (local _box) then {
            clearMagazineCargoGlobal _box;
        };

        private _light = "#lightpoint" createVehicleLocal [0,0,0];
        _light setLightBrightness 0.7;
        _light setLightAmbient [1,0.4,0.15];
        _light setLightColor [1,0.4,0.15];
        _light lightAttachObject [_box, [0,0,0]];

        _effects pushBack _light;

        // Light the fire
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
        }, [_box, _effects], 60] call CBA_fnc_waitAndExecute; // Give signifcant time for ammo cookoff to occur (perhaps keep the box alive until all cooked off?)
    }, [_box, _effects], 3 + random 15] call CBA_fnc_waitAndExecute;
}, _box, 0.5 + random 5] call CBA_fnc_waitAndExecute;
