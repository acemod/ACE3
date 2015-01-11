_rand=random 0.5;
if((_this select 2) >= -1) then {
	drop [["\ca\Data\ParticleEffects\Universal\Universal", 16, 12, 8,0], 
		"", "Billboard", 1, 3.5, _this, [0, 0, 0.5], 
		0, 10, 7.9, 0.075, [0.5+_rand,1.5+_rand], 
		[[1, 1, 1, 0],[1, 1, 1, 1],[1, 1, 1, 0.8],[1, 1, 1, 0.7], [1, 1, 1, 0.35], [1, 1, 1, 0]], 
		[1], 1, 0, "", "", ""];
	drop [["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2,0],
			"", "Billboard", 1, 0.1, _this,
			[0,0,0], 1, 1, 0.80, 0.5, [0.5+_rand,1.5+_rand],
			[[1,1,1,-4], [1,1,1,-4], [1,1,1,-2],[1,1,1,0]],[1000],0.1,0.1,"","",""];
};
if((_this select 2) <= 0 && {(_this select 2) >= -1}) then {
	_nearLogics = nearestObjects [_this, ["logic","#lightpoint","#particlesource"], 15];
	//player sideChat format["o: %1", _nearLogics];
	if((count _nearLogics) == 0 && {ace_sys_arty_ammunition_wpCount < 50}) then {
		ace_sys_arty_ammunition_wpCount = ace_sys_arty_ammunition_wpCount + 1;
		//player sideChat format["SMOKEY AND TEH BANDIZ %1", _this];
		_this spawn {
			_pos = _this;
			_pos set[2, 0];
			_logic = "logic" createVehicleLocal _pos;
			
			_light = "#lightpoint" createVehicleLocal _pos;
			_light setPos _pos;
			_light setLightBrightness 0.125;
			_light setLightAmbient[1, 1, 1];
			_light setLightColor[1, 1, 1];
			_light lightAttachObject [_logic, [0,0,0]];
			
			_wind = ([] call ace_sys_wind_deflection_fnc_wind);
			_sm = "#particlesource" createVehicleLocal _pos;
			_sm setParticleRandom [0.5, [1, 1, 1], [3, 3, 0.5], 0, 0.0, [0, 0, 0, 0], 0, 0, 360];
			_sm setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13,0],
				"", "Billboard", 1, 20, [0, 0, 0],
				[_wind select 0,_wind select 1,0], 1, 8.9, 7, 0.1, [1.3,10,20,35],
				[[1, 1, 1, 0],[1, 1, 1, 1],[1, 1, 1, 0.8],[1, 1, 1, 0.7], [1, 1, 1, 0.35], [1, 1, 1, 0]],
				[1],1,0,"","",_logic];
			_sm setDropInterval 0.25;

			_sp = "#particlesource" createVehicleLocal _pos;
			_sp setParticleRandom [0.03, [0, 0, 0], [0, 0, 0], 0, 0.2, [0, 0, 0, 0], 0, 0, 360];
			_sp setParticleParams [["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2,0],
				"", "Billboard", 1, 0.1, [0, 0, 0],
				[0,0,0], 1, 1, 0.80, 0.5, [0.5+(random 0.5),1.5+(random 0.5)],
				[[1,1,1,-4], [1,1,1,-4], [1,1,1,-2],[1,1,1,0]],[1000],0.1,0.1,"","",_logic,360];
			_sp setDropInterval 0.01;
			sleep (10+(random 10));
			deleteVehicle _light;
			deleteVehicle _sp;
			sleep (20+random(10));
			deleteVehicle _sm;
			
			deleteVehicle _logic;
			ace_sys_arty_ammunition_wpCount = ace_sys_arty_ammunition_wpCount - 1;
		};
	};
};