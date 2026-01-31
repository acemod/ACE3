class CfgAmmo
{
	class gm_bullet_base;
	class gm_bullet_556x45mm_base: gm_bullet_base {
      ACE_ammoTempMuzzleVelocityShifts[] = {-27.2,-26.44,-23.76,-21,-17.54,-13.1,-7.95,-1.62,6.24,15.48,27.75};
      ACE_ballisticCoefficients[] = {0.151};
      ACE_barrelLengths[] = {210.82,238.76,269.24,299.72,330.2,360.68,391.16,419.1,449.58,480.06,508,609.6};
      ACE_bulletLength = 23.4;
      ACE_bulletMass = 4.0176;
      ACE_caliber = 5.7;
      ACE_dragModel = 7;
      ACE_muzzleVelocities[] = {723,764,796,825,843,866,878,892,906,915,922,900};
      ACE_standardAtmosphere = "ASM";
  };
	class gm_bullet_556x45mm_B_dm11: gm_bullet_556x45mm_base {  //https://pt.scribd.com/doc/194927638/5-56mmx45-NATO-DualCore-DM11
  	    ACE_bulletMass = 4.099827;
  };
	class gm_bullet_556x45mm_B_T_dm21: gm_bullet_556x45mm_B_dm11 { //https://web.archive.org/web/20090617170413/http://www.ruag.com/de/Defence_Security/Amunition/PDF_Munition/5.56mmx45_NATO_Tracer_DM21.pdf
        ACE_bulletLength = 29.3116;
	    ACE_bulletMass = 4.0176;
  };
	class gm_bullet_556x45mm_B_m193: gm_bullet_base {
        ACE_bulletLength = 19.304;
        ACE_bulletMass = 3.56394;
        ACE_ballisticCoefficients[] = {0.118}; //https://internationalshootingsupplies.com/product/winchester-5-56-55gr-fmj-600-round-bulk-pack/
        ACE_barrelLengths[] = {152.4,177.8,203.2,228.6,254,279.4,304.8,330.2,355.6,419.1,431.8,457.2,482.6,508,533.4,558.8,584.2,609.6,635,660.4};
        ACE_muzzleVelocities[] = {595.884,650.748,699.821,732.434,758.647,786.079,806.501,821.131,855.878,911.962,905.866,930.25,932.688,943.966,950.062,962.558,965.911,971.702,984.199,999.744};
  };
	class gm_bullet_556x45mm_B_T_m196: gm_bullet_556x45mm_base {
        ACE_bulletLength = 23.114;
        ACE_bulletMass = 3.49914;
        ACE_ballisticCoefficients[] = {0.118};
  };
	class gm_bullet_556x45mm_B_T_m856: gm_bullet_556x45mm_base {
  	    ACE_bulletLength = 29.3116;
  	    ACE_bulletMass = 4.127691;
  };
	class gm_bullet_545x39mm_base: gm_bullet_base {
  	    ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
  	    ACE_ballisticCoefficients[] = {0.168};
        ACE_barrelLengths[] = {254,414.02,508};
      	ACE_bulletLength = 21.59;
  	    ACE_bulletMass = 3.42792;
      	ACE_caliber = 5.588;
      	ACE_dragModel = 7;
  	    ACE_muzzleVelocities[] = {780,880,920};
  	    ACE_standardAtmosphere = "ASM";
	};
	class gm_bullet_762x54mmR_base: gm_bullet_base {
      	ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
      	ACE_ballisticCoefficients[] = {0.411};
    	ACE_barrelLengths[] = {406.4,508,604.5,736.6};
    	ACE_bulletLength = 28.956;
      	ACE_bulletMass = 9.7975952;
    	ACE_caliber = 7.925;
    	ACE_dragModel = 1;
    	ACE_muzzleVelocities[] = {735,770,809,838};
    	ACE_standardAtmosphere = "ICAO";
	};
	class gm_bullet_762x54mmR_B_T_7t2: gm_bullet_762x54mmR_base {
	    ACE_ballisticCoefficients[] = {0.395};
        ACE_bulletMass = 9.6552;
	};
	class gm_bullet_762x54mmR_API_7bz3: gm_bullet_762x54mmR_base {
	    ACE_ballisticCoefficients[] = {0.401};
	    ACE_bulletMass = 10.387265;
	};
	class gm_bullet_762x54mmR_B_57N323S: gm_bullet_762x54mmR_base {
	    ACE_ballisticCoefficients[] = {0.374};
	    ACE_bulletMass = 9.6031985;
	};
	class gm_bullet_762x51mm_base: gm_bullet_base {
  	    ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
	    ACE_ballisticCoefficients[] = {0.2};
  	    ACE_barrelLengths[] = {419.1,431.8,457.2,482.6,508,533.4,558.8,584.2,609.6,635,660.4,685.8,711.2};
  	    ACE_bulletLength = 26.46;
  	    ACE_bulletMass = 9.52544;
  	    ACE_caliber = 7.823;
  	    ACE_dragModel = 7;
  	    ACE_muzzleVelocities[] = {780.593,785.47,790.956,802.843,816.559,817.778,828.446,836.371,843.077,843.991,853.745,853.44,860.45};
  	    ACE_standardAtmosphere = "ICAO";
	};
  	class gm_bullet_762x51mm_AP_DM151: gm_bullet_762x51mm_base {
  	    ACE_bulletMass = 9.78464;
	};
    class gm_bullet_9x18mm_base;
	class gm_bullet_9x18mm_B_pst: gm_bullet_9x18mm_base {
  	    ACE_ammoTempMuzzleVelocityShifts[] = {-2.655,-2.547,-2.285,-2.012,-1.698,-1.28,-0.764,-0.153,0.596,1.517,2.619};
  	    ACE_ballisticCoefficients[] = {0.135};
  	    ACE_barrelLengths[] = {50.8,76.2,101.6,127,152.4,177.8,203.2,228.6,254,279.4,304.8,330.2,355.6,381,406.4,431.8,457.2};
  	    ACE_bulletLength = 10.541;
  	    ACE_bulletMass = 6.1559;
  	    ACE_caliber = 9.27;
    	ACE_dragModel = 1;
      	ACE_muzzleVelocities[] = {253.289,271.272,294.132,296.57,301.142,313.334,317.297,321.259,324.002,325.526,329.489,327.965,337.109,335.28,338.938,329.794,327.66};
  	    ACE_standardAtmosphere = "ICAO";
	};
	class gm_bullet_9x19mm_base: gm_bullet_base {
  	    ACE_ammoTempMuzzleVelocityShifts[] = {-2.655,-2.547,-2.285,-2.012,-1.698,-1.28,-0.764,-0.153,0.596,1.517,2.619};
      	ACE_ballisticCoefficients[] = {0.165};
      	ACE_barrelLengths[] = {101.6,127,228.6};
      	ACE_bulletLength = 15.494;
      	ACE_bulletMass = 8.0352;
      	ACE_caliber = 9.017;
      	ACE_dragModel = 1;
       	ACE_muzzleVelocities[] = {340,370,400};
        ACE_standardAtmosphere = "ASM";
	};
    class gm_bullet_9x19mm_AP_dm91: gm_bullet_9x19mm_base {
        ACE_bulletMass = 5.7023;
       	ACE_muzzleVelocities[] = {410,440,480};
    };
    class gm_bullet_9x19mm_BSD_dm81: gm_bullet_9x19mm_base {
        ACE_bulletMass = 9.52544;
        ACE_muzzleVelocities[] = {220,250,290};
    };
};
