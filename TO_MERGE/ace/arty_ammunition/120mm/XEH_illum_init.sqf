//XEH_illum_init.sqf
#define MAX_ILL 2.1

private["_flareChute", "_pos", "_light", "_sm", "_sp"];

_flareChute = _this select 0;
_pos = getPos (_flareChute);

_light = "#lightpoint" createVehicleLocal _pos;
_light setPos _pos;
_light setLightBrightness MAX_ILL;
_light setLightAmbient[238/255, 233/255, 183/255];
_light setLightColor[241/255, 226/255, 62/255];
_light lightAttachObject [_flareChute, [0,0,-0.8]];

_sm = "#particlesource" createVehicleLocal getPos (_flareChute);
_sm setParticleRandom [0.5, [0, 0, 0], [0, 0, 0], 0, 0.3, [0, 0, 0, 0], 0, 0, 360];
_sm setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8,0],
	"", "Billboard", 1, 30, [0, 0, 0],
	[0,0,0], 1, 1, 0.80, 0.5, [1.3,4],
	[[0.9,0.9,0.9,0.6], [1,1,1,0.3], [1,1,1,0]],[1],0.1,0.1,"","",_light];
_sm setDropInterval 0.02;

_sp = "#particlesource" createVehicleLocal getPos (_flareChute);
_sp setParticleRandom [0.03, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0, 360];
_sp setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2,0],
	"", "Billboard", 1, 0.1, [0, 0, 0],
	[0,0,0], 1, 1, 0.80, 0.5, [1.5,0],
	[[1,1,1,-4], [1,1,1,-4], [1,1,1,-2],[1,1,1,0]],[1000],0.1,0.1,"","",_light,360];
_sp setDropInterval 0.001;

// _sp2 = "#particlesource" createVehicleLocal getPos (_flareChute);
// _sp2 setParticleRandom [0.03, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0, 360];
// _sp2 setParticleParams ["\ca\Data\Flare12",
	// "", "Billboard", 1, 0.1, [0, 0, 0],
	// [0,0,0], 1, 1, 0.80, 0.5, [1.5,0],
	// [[1,1,1,-4], [1,1,1,-4], [1,1,1,-2],[1,1,1,0]],[1000],0.1,0.1,"","",_light,360];
// _sp2 setDropInterval 0.001;


//_flareChute setVectorDir _chuteVel;

[_flareChute, _light, _sp, _sm] spawn {
	private["_shell", "_light", "_sp", "_sm", "_start", "_b", "_s"];
	_shell = _this select 0;
	_light = _this select 1;
	_sp = _this select 2;
	_sm = _this select 3;
	

	_start = time;
	_b = MAX_ILL;
	_s = 0;
	waitUntil {
		if((_start + 50) < time) then {
			_b = (_b - random (0.1)) max 0;
			_light setLightBrightness _b;
		};
		if((_start + 60) < time) then {
			deleteVehicle _light;
			deleteVehicle _sp;
//			deleteVehicle _sp2;
			deleteVehicle _sm;
		};
		sleep 0.1;
		(!alive _shell && (_start + 60) < time);
	};
	deleteVehicle _light;
	deleteVehicle _sp;
	deleteVehicle _sm;
};