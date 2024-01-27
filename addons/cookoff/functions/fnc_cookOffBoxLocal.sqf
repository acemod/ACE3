#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi, commy2, kymckay, johnb43
 * Start a cook-off in the given ammo box.
 *
 * Arguments:
 * 0: Ammo box <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_cookoff_fnc_cookOffBox
 *
 * Public: No
 */

params ["_box", "_killer", "_instigator", "_startTime", "_igniteTime", "_smokeTime"];

// Make sure effects are cleaned up if box is deleted
[QGVAR(addCleanupHandlers), _box] call CBA_fnc_localEvent;

// These time checks are for JIP players
private _delay = _startTime - CBA_missionTime + _igniteTime;

if (_delay >= 0) then {
    [{
        params ["_box"];

        private _effects = [];

        // Box will start smoking
        if (hasInterface) then {
            private _smoke = "#particlesource" createVehicleLocal [0, 0, 0];
            _smoke setParticleClass "AmmoSmokeParticles2";
            _smoke attachTo [_box, [0, 0, 0]];

            _effects pushBack _smoke;
        };

        if (isServer) then {
            private _sound = createSoundSource ["Sound_Fire", ASLToAGL getPosASL _box, [], 0];
            _smoke attachTo [_sound];

            _effects pushBack _sound;
        };

        _box setVariable [QGVAR(effects), _effects];
    }, _box, _delay] call CBA_fnc_waitAndExecute;
};

// Smoke happens later
_delay = _delay + _smokeTime;

if (_delay >= 0) then {
    // Light the fire (also handles lighting)
    [{
        params ["_box", "_killer", "_instigator"];

        if (hasInterface) then {
            private _fire = "#particlesource" createVehicleLocal [0, 0, 0];

            _fire setParticleClass "AmmoBulletCore";
            _fire attachTo [_box, [0, 0, 0]];

            private _effects = _box getVariable [QGVAR(effects), []];

            _effects pushBack _fire;

            _box setVariable [QGVAR(effects), _effects];
        };

        // These functions are smart and do all the cooking off work
        if (isServer) then {
            (_box call FUNC(getVehicleAmmo)) params ["_magazines", "_total"];

            [QGVAR(detonateAmmunition), [_box, _magazines, _total, true, _killer, _instigator]] call CBA_fnc_localEvent;

            // This shit is busy being on fire, magazines aren't accessible/usable
            clearMagazineCargoGlobal _box;
        };
    }, _this, _delay] call CBA_fnc_waitAndExecute;
};
