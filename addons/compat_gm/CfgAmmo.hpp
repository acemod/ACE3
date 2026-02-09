class CfgAmmo
{
	class gm_bullet_base;
	class gm_bullet_556x45mm_base: gm_bullet_base {
        ACE_ammoTempMuzzleVelocityShifts[] = {-27.2,-26.44,-23.76,-21,-17.54,-13.1,-7.95,-1.62,6.24,15.48,27.75};
        ACE_ballisticCoefficients[] = {0.151};
        ACE_barrelLengths[] = {210.82,238.76,269.24,299.72,330.2,360.68,391.16,419.1,449.58,480.06,508,609.6};
        ACE_bulletLength = 23.012;
        ACE_bulletMass = 4.0176;
        ACE_caliber = 5.69;
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        ACE_standardAtmosphere = "ASM";
  };
	class gm_bullet_556x45mm_B_dm11: gm_bullet_556x45mm_base {  // https://pt.scribd.com/doc/194927638/5-56mmx45-NATO-DualCore-DM11
  	    ACE_bulletMass = 4.1;
  };
	class gm_bullet_556x45mm_B_T_dm21: gm_bullet_556x45mm_B_dm11 { // https://web.archive.org/web/20090617170413/http://www.ruag.com/de/Defence_Security/Amunition/PDF_Munition/5.56mmx45_NATO_Tracer_DM21.pdf
        ACE_barrelLengths[] = {210.82,238.76,269.24,299.72,330.2,360.68,391.16,419.1,449.58,480.06,508,609.6};
        ACE_bulletLength = 29.31;
	    ACE_bulletMass = 4.0176;
        ACE_muzzleVelocities[] = {691, 764, 764, 770, 793, 811,834, 846, 860, 874, 883, 890, 870};
  };
	class gm_bullet_556x45mm_B_m193: gm_bullet_556x45mm_base {
        ACE_bulletLength = 19.3;
        ACE_bulletMass = 3.6;
        ACE_ballisticCoefficients[] = {0.118}; // https://internationalshootingsupplies.com/product/winchester-5-56-55gr-fmj-600-round-bulk-pack/
        ACE_barrelLengths[] = {190.5, 266.7, 368.3, 406.4, 508, 558.8};
        ACE_muzzleVelocities[] = {712.93, 829.97, 921.71, 954.33, 992.73, 1018.94};
  };
	class gm_bullet_556x45mm_B_T_m196: gm_bullet_556x45mm_base {
        ACE_bulletLength = 23.1;
        ACE_bulletMass = 3.5;
        ACE_ballisticCoefficients[] = {0.118};
        ACE_barrelLengths[] = {190.5, 266.7, 368.3, 406.4, 508, 558.8}; 
        ACE_muzzleVelocities[] = {712.93, 829.97, 921.71, 954.33, 992.73, 1018.94};
  };
	class gm_bullet_556x45mm_B_T_m856: gm_bullet_556x45mm_base {
  	    ACE_bulletLength = 29.3;
  	    ACE_bulletMass = 4.13;
  };
	class gm_bullet_545x39mm_base: gm_bullet_base {
  	    ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
  	    ACE_ballisticCoefficients[] = {0.168};
        ACE_barrelLengths[] = {254,414.02,508};
      	ACE_bulletLength = 25.55;
  	    ACE_bulletMass = 3.42792;
      	ACE_caliber = 5.588;
      	ACE_dragModel = 7;
  	    ACE_muzzleVelocities[] = {780, 880, 920};
  	    ACE_standardAtmosphere = "ASM";
	};
	class gm_bullet_545x39mm_B_T_7T3: gm_bullet_545x39mm_base
	{
	    ACE_barrelLengths[] = {254,414.02,508};
	    ACE_bulletLength = 25.32;
	    ACE_bulletMass = 3.2;
	    ACE_muzzleVelocities[] = {785, 883, 925};
	};
	class gm_bullet_762x54mmR_base: gm_bullet_base {
      	ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
      	ACE_ballisticCoefficients[] = {0.411};
    	ACE_barrelLengths[] = {406.4,508,604.5,736.6};
	    ACE_bulletLength = 32.385;
      	ACE_bulletMass = 9.7975952;
    	ACE_caliber = 7.925;
    	ACE_dragModel = 1;
    	ACE_muzzleVelocities[] = {735,770,809,838};
    	ACE_standardAtmosphere = "ICAO";
	};
	class gm_bullet_762x54mmR_API_7bz3: gm_bullet_762x54mmR_base {
	    ACE_ballisticCoefficients[] = {0.401};
    	ACE_bulletLength = 36.83;
	    ACE_bulletMass = 10.39;
        ace_vehicle_damage_incendiary = 1;
	};
	class gm_bullet_762x54mmR_B_57N323S: gm_bullet_762x54mmR_base {
	    ACE_ballisticCoefficients[] = {0.374};
	    ACE_bulletMass = 9.6;
	    ACE_barrelLengths[] = {550,605,650,658};
	    ACE_bulletLength = 32.385;
	    ACE_muzzleVelocities[] = {810,825,830,825};
	};
	class gm_bullet_762x54mmR_B_T_7t2: gm_bullet_762x54mmR_B_57N323S {
	    ACE_ballisticCoefficients[] = {0.395};
	    ACE_barrelLengths[] = {406.4,508,604.5,736.6};
	    ACE_bulletLength = 35.55;
	    ACE_bulletMass = 9.65;
	    ACE_muzzleVelocities[] = {735,770,809,838};
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
	    ACE_bulletLength = 31.496;
  	    ACE_bulletMass = 9.8;
	};
	class gm_bullet_762x51mm_B_T_DM21: gm_bullet_762x51mm_base {
	    ACE_bulletLength = 33.8;
	    ACE_bulletMass = 9.20145;
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
    	class gm_bullet_762x39mm_base;
	class gm_bullet_762x39mm_B_57N231: gm_bullet_762x39mm_base
	{
	    ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
	    ACE_ballisticCoefficients[] = {0.275};
	    ACE_barrelLengths[] = {254,414.02,508};
	    ACE_bulletLength = 26.8;
	    ACE_bulletMass = 7.899;
	    ACE_caliber = 7.92;
	    ACE_dragModel = 1;
	    ACE_muzzleVelocities[] = {650,716,750};
	    ACE_standardAtmosphere = "ICAO";
	};
	class gm_bullet_762x39mm_B_M43: gm_bullet_762x39mm_B_57N231
	{
	    ACE_ballisticCoefficients[] = {0.138};
	    ACE_dragModel = 7;
	    ACE_bulletMass = 7.97027;
	};
	class gm_bullet_762x39mm_B_T_57N231P: gm_bullet_762x39mm_B_57N231
	{
	    ACE_bulletLength = 27.48;
	    ACE_bulletMass = 7.5685127;
	};
	class gm_bullet_762x39mm_AP_7N23: gm_bullet_762x39mm_B_57N231
	{
	    ACE_bulletLength = 27.4;
	};
	class gm_bullet_762x39mm_AP_M43: gm_bullet_762x39mm_AP_7N23
	{
    	ACE_bulletLength = 28.3;
	    ACE_bulletMass = 7.87;
	    ACE_ballisticCoefficients[] = {0.138};
	    ACE_dragModel = 7;
	};
	class gm_bullet_762x39mm_BSD_57N231U: gm_bullet_762x39mm_B_57N231
	{
	    ACE_bulletLength = 33.62;
	    ACE_bulletMass = 12.5;
	    ACE_muzzleVelocities[] = {270,290,320};
	};
	class gm_bullet_473x33mm_base;
	class gm_bullet_473x33mm_B_dm11: gm_bullet_473x33mm_base
	{
	    ACE_ammoTempMuzzleVelocityShifts[] = {-26.55,-25.47,-22.85,-20.12,-16.98,-12.8,-7.64,-1.53,5.96,15.17,26.19};
	    ACE_ballisticCoefficients[] = {0.115};
	    ACE_barrelLengths[] = {540};
    	ACE_bulletLength = 21.88;
    	ACE_bulletMass = 3.33;
	    ACE_caliber = 4.92;
	    ACE_dragModel = 7;
	    ACE_muzzleVelocities[] = {925};
	    ACE_standardAtmosphere = "ASM";
	};

//Not in use by the CDLC
	class gm_bullet_762x39mm_API_M43
	{
	    ACE_bulletLength = 28.57;
	    EGVAR(vehicle_damage,incendiary) = 1;
	    ACE_bulletMass = 7.67;
	    ACE_ballisticCoefficients[] = {0.138};
	    ACE_dragModel = 7;
	};
	class gm_bullet_762x39mm_API_T_M43
	{
	    ACE_bulletLength = 28.57;
	    ace_vehicle_damage_incendiary = 1;
	    ACE_bulletMass = 7.67;
    	ACE_ballisticCoefficients[] = {0.138};
	    ACE_dragModel = 7;
	};
	class gm_bullet_762x39mm_B_T_M43: gm_bullet_762x39mm_B_T_57N231P
	{
	    ACE_bulletLength = 27.48;
	    ACE_bulletMass = 7.97;
	    ACE_ballisticCoefficients[] = {0.138};
	    ACE_dragModel = 7;
	};
};
