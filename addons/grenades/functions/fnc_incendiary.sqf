#include "..\script_component.hpp"
/*
 * Author: commy2
 * Makes an incendiary grenade burn.
 *
 * Arguments:
 * 0: Incendiary grenade <OBJECT>
 * 1: Incendiary lifetime <NUMBER>
 * 2: Instigator's side <SIDE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_nade, 60] call ace_grenades_fnc_incendiary
 *
 * Public: No
 */

#define ALERT_NEAR_ENEMY_RANGE 60

#define PARTICLE_LIFE_TIME 2
#define PARTICLE_DENSITY 20
#define PARTICLE_SIZE 1
#define PARTICLE_SPEED 1

#define PARTICLE_SMOKE_LIFE_TIME 5
#define PARTICLE_SMOKE_DENSITY 5
#define PARTICLE_SMOKE_SIZE 0.5
#define PARTICLE_SMOKE_SPEED 1
#define PARTICLE_SMOKE_LIFTING 1
#define PARTICLE_SMOKE_WIND_EFFECT 1

#define ORIENTATION 5.4
#define EXPANSION 1

#define DESTRUCTION_RADIUS 1.8
#define SEARCH_RADIUS 5

params ["_projectile", "_timeToLive", "_center"];

if (isNull _projectile) exitWith {TRACE_1("null",_projectile);};

private _position = position _projectile;

// Alert nearby hostile AI
{
    if (local _x && {[_center, side group _x] call BIS_fnc_sideIsEnemy} && {behaviour _x in ["SAFE", "AWARE"]}) then { // WE WANT THE OBJECT'S SIDE HERE!
        _x setBehaviour "COMBAT";
    };
} forEach ([_position, ALERT_NEAR_ENEMY_RANGE, ALERT_NEAR_ENEMY_RANGE, 0, false] nearEntities [["CAManBase"], false, true, true]);

// Fire particles
private _fire = "#particlesource" createVehicleLocal _position;

_fire setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32],
    "",
    "billboard",
    1,
    PARTICLE_LIFE_TIME,
    [0,0,0],
    [0, 0, 0.4 * PARTICLE_SPEED],
    0,
    0.0565,
    0.05,
    0.03,
    [0.9 * PARTICLE_SIZE, 0],
    [
        [0.5,0.5,0.5,-0],
        [0.5,0.5,0.5,-1],
        [0.5,0.5,0.5,-1],
        [0.5,0.5,0.5,-1],
        [0.5,0.5,0.5,-1],
        [0.5,0.5,0.5,0]
    ],
    [1],
    0.01,
    0.02,
    "",
    "",
    _projectile,
    ORIENTATION,
    false,
    -1,
    [[3,3,3,0]]
];

_fire setParticleRandom [PARTICLE_LIFE_TIME / 4, [0.15 * EFFECT_SIZE, 0.15 * EFFECT_SIZE, 0], [0.2,0.2,0], 0.4, 0, [0,0,0,0], 0, 0, 0.2];
_fire setParticleFire [1.2,1.0,0.1];
_fire setDropInterval (1 / PARTICLE_DENSITY);

// Smoke particles
private _smoke = "#particlesource" createVehicleLocal _position;

_smoke setParticleParams [
    ["\A3\data_f\ParticleEffects\Universal\Universal_02",8,0,40,1],
    "",
    "billboard",
    1,
    PARTICLE_SMOKE_LIFE_TIME,
    [0,0,0],
    [0, 0, 2 * PARTICLE_SMOKE_SPEED],
    0,
    0.05,
    0.04 * PARTICLE_SMOKE_LIFTING,
    0.05 * PARTICLE_SMOKE_WIND_EFFECT,
    [1 * PARTICLE_SMOKE_SIZE + 1, 1.8 * PARTICLE_SMOKE_SIZE + 15],
    [
        [0.7,0.7,0.7,0.7],
        [0.7,0.7,0.7,0.6],
        [0.7,0.7,0.7,0.45],
        [0.84,0.84,0.84,0.28],
        [0.84,0.84,0.84,0.16],
        [0.84,0.84,0.84,0.09],
        [0.84,0.84,0.84,0.06],
        [1,1,1,0.02],
        [1,1,1,0]
    ],
    [1,0.55,0.35],
    0.1,
    0.08 * EXPANSION,
    "",
    "",
    _projectile
];

_smoke setParticleRandom [PARTICLE_SMOKE_LIFE_TIME / 2, [0.5 * EFFECT_SIZE, 0.5 * EFFECT_SIZE, 0.2 * EFFECT_SIZE], [0.3,0.3,0.5], 1, 0, [0,0,0,0.06], 0, 0];
_smoke setDropInterval (1 / PARTICLE_SMOKE_DENSITY);

// Light
private _light = "#lightpoint" createVehicleLocal (_position vectorAdd [0,0,0.5]);

_light setLightBrightness 1.0;
_light setLightColor [1,0.65,0.4];
_light setLightAmbient [0.15,0.05,0];
_light setLightIntensity (50 + 400 * ((PARTICLE_SIZE + EFFECT_SIZE) / 2));
_light setLightAttenuation [0,0,0,1];

_light setLightDayLight false;

_light lightAttachObject [_projectile, [0,0,0]];

// Sound
private _sound = objNull;

if (isServer) then {
    _sound = createSoundSource ["Sound_Fire", _position, [], 0];
    private _radius = 1.5 * getNumber (configOf _projectile >> "indirectHitRange");
    private _intensity = getNumber (configOf _projectile >> "hit");

    [QEGVAR(fire,addFireSource), [_projectile, _radius, _intensity, _projectile, {
        params ["_endTime", "_projectile"];

        // If incendiary no longer exists, exit
        if (isNull _projectile) exitWith {
            false // return
        };

        // Need to get the position every time, as grenade might have been moved
        private _position = position _projectile;

        {
            // Damage vehicles
            [QGVAR(damageEngineAndWheels), [_x, _position], _x] call CBA_fnc_targetEvent;
        } forEach (_position nearEntities ["Car", SEARCH_RADIUS]);

        CBA_missionTime < _endTime // return
    }, [CBA_missionTime + _timeToLive, _projectile]]] call CBA_fnc_serverEvent;
};

[{
    deleteVehicle _this;
}, [_fire, _smoke, _light, _sound], _timeToLive] call CBA_fnc_waitAndExecute;

// Damage
{
    // Inflame fireplace, barrels etc.
    _x inflame true;

    // Destroy nearby static weapons and ammo boxes
    if (_x isKindOf "StaticWeapon" || {_x isKindOf "ACE_RepairItem_Base"}) then {
        _x setDamage 1;

        continue;
    };

    if (_x isKindOf "ReammoBox_F") then {
        if (
            (["ace_cookoff"] call EFUNC(common,isModLoaded)) &&
            {EGVAR(cookoff,enableAmmobox)} &&
            {EGVAR(cookoff,ammoCookoffDuration) != 0} &&
            {_x getVariable [QEGVAR(cookoff,enableAmmoCookoff), true]}
        ) then {
            [QEGVAR(cookOff,cookOffBoxServer), _x] call CBA_fnc_serverEvent;
        } else {
            _x setDamage 1;
        };

        continue;
    };

    // Delete nearby ground weapon holders
    if (_x isKindOf "WeaponHolder" || {_x isKindOf "WeaponHolderSimulated"}) then {
        deleteVehicle _x;
    };
} forEach ((_position nearObjects DESTRUCTION_RADIUS) select {local _x && {isDamageAllowed _x}});

{
    // Damage vehicles (locality is checked in FUNC(damageEngineAndWheels))
    [_x, _position] call FUNC(damageEngineAndWheels);
} forEach (_position nearEntities ["Car", SEARCH_RADIUS]);
