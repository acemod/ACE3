class RscInGameUI {
    class RscWeaponZeroing;
    class ACE_RscWeapon_base : RscWeaponZeroing {
        class ReticleDay;
        class ReticleNight;
        class BodyDay;
        class BodyNight;
    };
	

    class ACE_RscWeapon_RKSL_LDS : ACE_RscWeapon_base {
        class ReticleDay : ReticleDay {
            text = QUOTE(PATHTOF(reticles\lds-reticle556_ca.paa));
        };		
        class ReticleNight : ReticleNight {
            text = QUOTE(PATHTOF(reticles\lds-reticle556Illum_ca.paa));
        };		
        class BodyDay : BodyDay {
            text = QUOTE(PATHTOF(reticles\lds-body_ca.paa));
        };		
        class BodyNight : BodyNight {
            text = QUOTE(PATHTOF(reticles\lds-bodyNight_ca.paa));
        };
    };
};