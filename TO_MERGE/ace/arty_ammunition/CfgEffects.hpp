//CfgEffects.hpp

class ace_arty_105mm_m84a1_m782_smokeCanisterHC_effect {
    class Smoke1 {
 		simulation = "particles";
		type = "ace_arty_105mm_m84a1_m782_smokeCanisterHC_cloudlet1";
		position[] = {0, 0, 0};
		intensity = 0.25;
		interval = 0.05;
		lifeTime = 60;
    };
    class Smoke2 {
 		simulation = "particles";
		type = "ace_arty_105mm_m84a1_m782_smokeCanisterHC_cloudlet2";
		position[] = {0, 0, 0};
		intensity = 0.5;
		interval = 0.25;
		lifeTime = 30;
    };
};

class ace_arty_WPExplosion {
	class LightExp {
		simulation = "light";
		type = "ExploLight";
		position[] = {0,0,0};
		intensity = 0.001;
		interval = 1;
		lifeTime = 1;
	};
	class ExplosionFlame {
		simulation = "particles";
		type = "ExplosionParticles";
		position[] = {0,0,0};
		intensity = 3;
		interval = 1;
		lifeTime = 0.25;
	};
	class Explosion1 {
		simulation = "particles";
		type = "ace_arty_WPCloud";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class Explosion2 {
		simulation = "particles";
		type = "ace_arty_WPCloud2";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class Trails {
		simulation = "particles";
		type = "ace_arty_WPTrails";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class Trails2 {
		simulation = "particles";
		type = "ace_arty_WPTrails2";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};

class ace_arty_dpicmEffects {
	class LightExp {
		simulation = "light";
		type = "ExploLight";
		position[] = {0,0,0};
		intensity = 0.001;
		interval = 1;
		lifeTime = 0.25;
	};
	class ExploAmmoFlash {
		simulation = "particles";
		type = "ExploAmmoFlash";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class ExploAmmoSmoke {
		simulation = "particles";
		type = "ExploAmmoSmoke";
		position[] = {0,0,0};
		intensity = 0.5;
		interval = 2;
		lifeTime = 0.5;
	};
};
