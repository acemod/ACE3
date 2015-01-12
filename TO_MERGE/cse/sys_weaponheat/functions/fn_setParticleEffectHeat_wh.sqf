
private ["_unit", "_percentage", "_currentParticleEffect", "_dummyObj"];
_unit = _this select 0;
_percentage = _this select 1;

_currentParticleEffect = _unit getvariable "cse_particleEffect_Heat_WH";
if (!isnil "_currentParticleEffect") then {
	_dummyObj = _unit getvariable "cse_particleEffect_Heat_dummyObj_WH";
	_dummyObj attachTo [_unit, (_unit weaponDirection _weapon) vectorMultiply 0.2, "LeftHand"];
	_particleEffect setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1, 0, 1, 0], "", "Billboard", 1, 1.0, [0, 0, 0], [0, 0, 0.0], 0, 0.5, 0.5, 0.1, [1.0], [[1, 0.7, 0.7, 0.5 * _percentage]], [1], 0, 0, "", "", _dummyObj];
};
