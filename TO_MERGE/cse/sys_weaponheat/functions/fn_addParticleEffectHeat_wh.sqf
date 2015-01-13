/**
 * fn_addParticleEffectsHeat_wh.sqf
 * @Descr: Adds a heat effect for the units weapon.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: PARTICLE The particleeffect object
 * @PublicAPI: false
 */

private ["_unit", "_currentParticleEffect", "_weaponDirection", "_particleEffect", "_rightHandPosition"];
_unit = _this select 0;

_currentParticleEffect = _unit getvariable "cse_particleEffect_Heat_WH";
if (!isnil "_currentParticleEffect") exitwith {_currentParticleEffect};
_rightHandPosition = ATLtoASL (_unit modelToWorld (_unit selectionPosition "RightHand"));

_weaponDirection = _unit weaponDirection _weapon;

_dummyObj = "cse_LogicDummy" createVehicleLocal [0,0,0];
_dummyObj attachTo [_unit, _weaponDirection vectorMultiply 0.2, "LeftHand"];

_particleEffect  = "#particlesource" createVehicle (getPos _dummyObj);
_particleEffect setParticleCircle [0, [0, 0, 0]];
_particleEffect setParticleRandom [0.2, [0, 0, 0], [0.0, 0.0, 0], 0.1, 0.1, [0, 0, 0, 0], 0, 0];
_particleEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1, 0, 1, 0], "", "Billboard", 3, 0.1, [0, 0, 0], [0, 0, 0.0], 0, 0.5, 0.5, 0.1, [1.0], [[1, 0.7, 0.7, 0.0]], [1], 0, 0, "", "", _dummyObj];
_particleEffect setDropInterval 0.04;

_unit setvariable ["cse_particleEffect_Heat_WH", _particleEffect];
_unit setvariable ["cse_particleEffect_Heat_dummyObj_WH", _dummyObj];
_particleEffect;
