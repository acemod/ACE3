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