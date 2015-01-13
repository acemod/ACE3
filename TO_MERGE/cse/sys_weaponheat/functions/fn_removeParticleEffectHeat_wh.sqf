/**
 * fn_removeParticleEffectHeat_wh.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: BOOL Whatever or not a particle effect has been removed
 * @PublicAPI: false
 */

private ["_unit", "_currentParticleEffect"];
_unit = _this select 0;

_currentParticleEffect = _unit getvariable "cse_particleEffect_Heat_WH";
if (!isnil "_currentParticleEffect") exitwith {
	deleteVehicle _currentParticleEffect;
	_unit setvariable ["cse_particleEffect_Heat_WH", nil];

	_dummyObj = _unit getvariable "cse_particleEffect_Heat_dummyObj_WH";
	deleteVehicle _dummyObj;
	_unit setvariable ["cse_particleEffect_Heat_dummyObj_WH", nil];
	
	true
};

false
