class CfgMagazines
{
	class 7Rnd_408_Mag;
	class 16Rnd_9x21_Mag;
	class 30Rnd_556x45_Stanag;
	class 30Rnd_556x45_Stanag_Tracer_Red;
	class 200Rnd_65x39_cased_Box;
	class 200Rnd_65x39_cased_Box_Tracer;
	class 10Rnd_762x51_Mag;
	class 20Rnd_762x51_Mag;
	class 100Rnd_127x99_mag;
	class 8Rnd_mas_9x18_Mag: 16Rnd_9x21_Mag
	{
		ammo="B_mas_9x18_Ball_57N181S";
		count=8;
		displayName="8rnd 9mm Mag";
		picture="\A3\weapons_f\data\ui\M_16Rnd_9x21_CA.paa";
		descriptionshort="Caliber: 9x18 mm Makarov<br />Rounds: 8<br />Used in: Makarov";
	};
	class 64Rnd_mas_9x18_mag: 30Rnd_556x45_Stanag
	{
		ammo="B_mas_9x18_Ball_57N181S";
		count=64;
		displayName="64rnds 9x18 Bizon";
		picture="\mas_us_rifle\ui\m_bizon_ca.paa";
		descriptionshort="Caliber: 9x18 mm cal<br />Rounds: 64<br />Used in: Bizon";
	};
	class 30Rnd_mas_545x39_mag: 30Rnd_556x45_Stanag
	{
		ammo="M_mas_545x39_Ball_7N6M";
		count=30;
		descriptionshort="Caliber: 5.45x39 mm<br />Rounds: 30<br />Used in: AK74M,AKS74,AKSU";
		displayname="30rnd 5.45mm Mag";
	};
	class 30Rnd_mas_545x39_T_mag: 30Rnd_556x45_Stanag_Tracer_Red
	{
		ammo="M_mas_545x39_Ball_7T3M";
		count=30;
		descriptionshort="Caliber: 5.45x39 mm Tracer<br />Rounds: 30<br />Used in: AK74M,AKS74,AKSU";
		displayname="30rnd 5.45mm Mag(Tracer)";
	};
	class 100Rnd_mas_545x39_mag: 200Rnd_65x39_cased_Box
	{
		ammo="M_mas_545x39_Ball_7N6M";
		count=100;
		descriptionshort="Caliber: 5.45x39 mm<br />Rounds: 100<br />Used in: RPK74";
		displayname="100rnd 5.45mm Drum";
		mass=25;
	};
	class 100Rnd_mas_545x39_T_mag: 200Rnd_65x39_cased_Box_Tracer
	{
		ammo="M_mas_545x39_Ball_7T3M";
		count=100;
		descriptionshort="Caliber: 5.45x39 mm Tracer<br />Rounds: 100<br />Used in: RPK74";
		displayname="100rnd 5.45mm Drum(Tracer)";
		mass=25;
	};
	class 30Rnd_mas_556x45_Mk262_Stanag: 30Rnd_556x45_Stanag
	{
		ammo="B_mas_556x45_Ball_Mk262";
		count=30;
		descriptionshort="Caliber: 5.56x45 mm STANAG Mk262<br />Rounds: 30<br />Used in: M4,HK416,M16,SCAR-L";
		displayname="30rnd 5.56mm STANAG(Mk262)";
	};
	class 20Rnd_mas_762x51_M118LR_Stanag: 30Rnd_556x45_Stanag
	{
		ammo="B_mas_762x51_Ball_M118LR";
		count=20;
		descriptionshort="Caliber: 7.62x51 mm STANAG M118LR<br />Rounds: 20<br />Used in: HK417,SR25,SCAR-H,EBR";
		displayname="20rnd 7.62mm Mag(M118LR)";
		picture="\A3\weapons_f\data\UI\M_20Rnd_762x51_CA.paa";
	};
	class 5Rnd_mas_762x51_M118LR_Stanag: 30Rnd_556x45_Stanag
	{
		ammo="B_mas_762x51_Ball_M118LR";
		count=5;
		descriptionshort="Caliber: 7.62x51 mm STANAG M118LR<br />Rounds: 5<br />Used in: M24";
		displayname="5rnd 7.62mm Mag(M118LR)";
		picture="\A3\weapons_f\data\UI\m_M24_CA.paa";
	};
	
	class Trixie_30x556_Mk262_Mag: 30Rnd_556x45_Stanag
	{
		scope=2;
		author="Trixie";
		count=30;
		descriptionshort="Caliber: 5.56x45mm<br />Rounds: 30<br />Used in: Mk12 SPR";
		displayname="30Rnd Mk262 5.56x45mm";
		ammo="cse_AB_556x45_Ball_Mk262";
		lastroundstracer=0;
		tracersevery=0;
	};
	class Trixie_20x762_M118LR_Mag: 20Rnd_762x51_Mag
	{
		scope=2;
		author="Trixie";
		count=20;
		descriptionshort="Caliber: 7.62x51mm<br />Rounds: 20<br />Used in: M110 SASS";
		displayname="20Rnd 7.62x51mm M118LR";
		ammo="cse_AB_762x51_Ball_M118LR";
		picture="\Trixie_recon\UI\20x762_mag.paa";
		lastroundstracer=0;
		tracersevery=0;
	};
	class Trixie_10x762_M118LR_Mag: 10Rnd_762x51_Mag
	{
		scope=2;
		author="Trixie";
		count=10;
		descriptionshort="Caliber: 7.62x51mm<br />Rounds: 10<br />Used in: CZ750";
		displayname="10Rnd 7.62x51mm M118LR";
		ammo="cse_AB_762x51_Ball_M118LR";
		picture="\Trixie_recon\UI\5x762_mag.paa";
		lastroundstracer=0;
		tracersevery=0;
	};
	class Trixie_5x762_M118LR_Mag: 10Rnd_762x51_Mag
	{
		scope=2;
		author="Trixie";
		count=5;
		descriptionshort="Caliber: 7.62x51mm<br />Rounds: 5<br />Used in: M40A3";
		displayname="5Rnd 7.62x51mm M118LR";
		ammo="cse_AB_762x51_Ball_M118LR";
		picture="\Trixie_recon\UI\5x762_mag.paa";
		lastroundstracer=0;
		tracersevery=0;
	};
	class Trixie_10x127_Mag: 100Rnd_127x99_mag
	{
		scope=2;
		author="Trixie";
		count=10;
		descriptionshort="Caliber: 12.7x99mm<br />Rounds: 10<br />Used in: Barret M107";
		displayname="10Rnd 12.7x99mm";
		ammo="B_127x99_Ball";
		picture="\Trixie_recon\UI\50BMGx10_mag.paa";
		lastroundstracer=0;
		tracersevery=0;
	};
	class Trixie_10x105_Mag: 100Rnd_127x99_mag
	{
		scope=2;
		author="Trixie";
		count=10;
		descriptionshort="Caliber: .416 Barrett<br />Rounds: 10<br />Used in: Barret M107";
		displayname="10Rnd 10.5x83mm";
		ammo="AB_106x83mm_Ball";
		picture="\Trixie_recon\UI\50BMGx10_mag.paa";
		lastroundstracer=0;
		tracersevery=0;
	};
	class Trixie_10x127_Amax_Mag: 100Rnd_127x99_mag
	{
		scope=2;
		author="Trixie";
		count=10;
		descriptionshort="Caliber: .50 BMG 750 gr A-MAX<br />Rounds: 10<br />Used in: Barret M107";
		displayname="10Rnd 12.7x99mm A-MAX";
		ammo="AB_127x99_Ball_AMAX";
		picture="\Trixie_recon\UI\50BMGx10_mag.paa";
		lastroundstracer=0;
		tracersevery=0;
	};
};