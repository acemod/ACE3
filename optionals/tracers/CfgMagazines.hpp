#define MAG(base,color,ammotype) class TRIPLES(ACE,base,color) : base { \
    author = ECSTRING(common,ACETeam); \
    ammo = QUOTE(ammotype); \
    displayName = CSTRING(DOUBLES(base,color)); \
    descriptionShort = CSTRING(TRIPLES(base,color,description)); \
}

class CfgMagazines {

    // 5.56mm
    class 200Rnd_556x45_Box_F;
    MAG(200Rnd_556x45_Box_F,green,B_556x45_Ball_Tracer_Green);

    class 200Rnd_556x45_Box_Tracer_F;
    MAG(200Rnd_556x45_Box_Tracer_F,green,B_556x45_Ball_Tracer_Green);

    // 5.8mm
    class 30Rnd_580x42_Mag_F;
    MAG(30Rnd_580x42_Mag_F,red,ACE_580x42_Ball_Tracer_red);
    MAG(30Rnd_580x42_Mag_F,yellow,ACE_580x42_Ball_Tracer_yellow);

    class 30Rnd_580x42_Mag_Tracer_F;
    MAG(30Rnd_580x42_Mag_Tracer_F,red,ACE_580x42_Ball_Tracer_red);
    MAG(30Rnd_580x42_Mag_Tracer_F,yellow,ACE_580x42_Ball_Tracer_yellow);

    class 100Rnd_580x42_Mag_F;
    MAG(100Rnd_580x42_Mag_F,red,ACE_580x42_Ball_Tracer_red);
    MAG(100Rnd_580x42_Mag_F,yellow,ACE_580x42_Ball_Tracer_yellow);

    class 100Rnd_580x42_Mag_Tracer_F;
    MAG(100Rnd_580x42_Mag_Tracer_F,red,ACE_580x42_Ball_Tracer_red);
    MAG(100Rnd_580x42_Mag_Tracer_F,yellow,ACE_580x42_Ball_Tracer_yellow);

	// 6.5mm Caseless
	class 30Rnd_65x39_caseless_mag;
    MAG(30Rnd_65x39_caseless_mag,green,B_65x39_Caseless_green);
    MAG(30Rnd_65x39_caseless_mag,yellow,B_65x39_Caseless_yellow);

	class 30Rnd_65x39_caseless_mag_tracer;
    MAG(30Rnd_65x39_caseless_mag_tracer,green,B_65x39_Caseless_green);
    MAG(30Rnd_65x39_caseless_mag_tracer,yellow,B_65x39_Caseless_yellow);

	class 100Rnd_65x39_caseless_mag;
    MAG(100Rnd_65x39_caseless_mag,green,B_65x39_Caseless_green);
    MAG(100Rnd_65x39_caseless_mag,yellow,B_65x39_Caseless_yellow);

	class 100Rnd_65x39_caseless_mag_tracer;
    MAG(100Rnd_65x39_caseless_mag_tracer,green,B_65x39_Caseless_green);
    MAG(100Rnd_65x39_caseless_mag_tracer,yellow,B_65x39_Caseless_yellow);

    // 6.5mm Cased
	class 200Rnd_65x39_cased_Box;
    MAG(200Rnd_65x39_cased_Box,green,B_65x39_Case_Green);
    MAG(200Rnd_65x39_cased_Box,red,B_65x39_Case);

	class 200Rnd_65x39_cased_Box_Tracer;
    MAG(200Rnd_65x39_cased_Box_Tracer,green,B_65x39_Case_Green);
    MAG(200Rnd_65x39_cased_Box_Tracer,red,B_65x39_Case);

    // 7.62x54
	class 150Rnd_762x54_Box;
    MAG(150Rnd_762x54_Box,yellow,B_762x54_Tracer_Yellow);
    MAG(150Rnd_762x54_Box,red,B_762x54_Tracer_Red);

	class 150Rnd_762x54_Box_Tracer;
    MAG(150Rnd_762x54_Box_Tracer,yellow,B_762x54_Tracer_Yellow);
    MAG(150Rnd_762x54_Box_Tracer,red,B_762x54_Tracer_Red);

    // 9.3x64
	class 150Rnd_93x64_Mag;
    MAG(150Rnd_93x64_Mag,yellow,ACE_93x64_Tracer_Yellow);
    MAG(150Rnd_93x64_Mag,red,ACE_93x64_Tracer_Red);

    // .338 NM
	class 130Rnd_338_Mag;
    MAG(130Rnd_338_Mag,yellow,ACE_338_NM_Tracer_Yellow);
    MAG(130Rnd_338_Mag,green,ACE_338_NM_Tracer_Green);

};
