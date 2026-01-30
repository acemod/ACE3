class CfgGlasses {	
  	class gm_ge_facewear_stormhood_base;
  	class gm_glasses_base;
  	class gm_gasmask_base;
  	class gm_ge_facewear_stormhood_dustglasses_blk: gm_ge_facewear_stormhood_base {
  	  ACE_Color[] = {0,0,-1.5};
	    ACE_TintAmount = 8;
  	  ACE_Protection = 1;
	    ACE_Resistance = 2;
      ACE_Overlay = QPATHTOF(textures\HUD\CombatGoggles.paa);
      ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
    };

	  class gm_ge_facewear_sunglasses: gm_glasses_base {
  	  ACE_Color[] = {1,0.5,0};
  	  ACE_TintAmount = 8;
    	ACE_Protection = 1;
    	ACE_Resistance = 1;
  	};

  	class gm_ge_facewear_glacierglasses: gm_glasses_base {
  	  ACE_Color[] = {1,0.5,0};
    	ACE_TintAmount = 32;
  	  ACE_Protection = 1;
	    ACE_Resistance = 1;
  	};

  	class gm_ge_facewear_dustglasses: gm_glasses_base {
  	  ACE_Color[] = {0,0,-1.5};
  	  ACE_TintAmount = 8;
    	ACE_Protection = 1;
    	ACE_Resistance = 2;
      ACE_Overlay = QPATHTOF(textures\HUD\CombatGoggles.paa);
      ACE_OverlayCracked = QPATHTOEF(goggles,textures\HUD\Cracked.paa);
  	};

  	class gm_ge_facewear_m65: gm_gasmask_base {
  	  ACE_Protection = 1;
  	  ACE_Resistance = 1;
  	};

    class gm_ge_facewear_acidgoggles: gm_glasses_base {
  	  ACE_Protection = 1;
	    ACE_Resistance = 1;
  	};

	  class gm_gc_army_facewear_schm41m: gm_gasmask_base {
    	ACE_Protection = 1;
  	  ACE_Resistance = 1;
	  };
};
