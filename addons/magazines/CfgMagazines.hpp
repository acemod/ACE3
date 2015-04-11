
class CfgMagazines {

    /* 6.5x39mm Grendel - MX */

    class 30Rnd_65x39_caseless_mag_Tracer;
    class ACE_30Rnd_65x39_caseless_mag_Tracer_Dim: 30Rnd_65x39_caseless_mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_Tracer_Dim";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_mag_Tracer_DimDescription";
        picture = "\A3\weapons_f\data\ui\m_30stanag_caseless_yellow_CA.paa";
    };

    class 30Rnd_65x39_caseless_mag;
    class ACE_30Rnd_65x39_caseless_mag_SD: 30Rnd_65x39_caseless_mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_SD";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_mag_SDName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_mag_SDNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_mag_SDDescription";
        picture = "\A3\weapons_f\data\ui\m_30stanag_caseless_green_CA.paa";
        initSpeed = 320;
    };

    class ACE_30Rnd_65x39_caseless_mag_AP: 30Rnd_65x39_caseless_mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_AP";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_mag_APName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_mag_APNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_mag_APDescription";
    };


    /* 6.5x39mm Grendel - Katiba */

    class 100Rnd_65x39_caseless_mag;
    class 200Rnd_65x39_cased_Box: 100Rnd_65x39_caseless_mag {
        initSpeed = 691;
    };

    class 30Rnd_65x39_caseless_green_mag_Tracer;
    class ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim: 30Rnd_65x39_caseless_green_mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_Tracer_Dim";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_green_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_green_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_green_mag_Tracer_DimDescription";
    };

    class 30Rnd_65x39_caseless_green;
    class ACE_30Rnd_65x39_caseless_green_mag_SD: 30Rnd_65x39_caseless_green {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_SD";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_green_mag_SDName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_green_mag_SDNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_green_mag_SDDescription";
        initSpeed = 320;
    };

    class ACE_30Rnd_65x39_caseless_green_mag_AP: 30Rnd_65x39_caseless_green {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_65x39_Caseless_AP";
        displayName = "$STR_ACE_30Rnd_65x39_caseless_green_mag_APName";
        displayNameShort = "$STR_ACE_30Rnd_65x39_caseless_green_mag_APNameShort";
        descriptionShort = "$STR_ACE_30Rnd_65x39_caseless_green_mag_APDescription";
    };


    /* 5.56x45mm NATO */

    class 30Rnd_556x45_Stanag_Tracer_Red; //picture = "\A3\weapons_f\data\ui\m_30stanag_red_ca.paa";
    class ACE_30Rnd_556x45_Stanag_Tracer_Dim: 30Rnd_556x45_Stanag_Tracer_Red {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_556x45_Ball_Tracer_Dim";
        displayName = "$STR_ACE_30Rnd_556x45_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_30Rnd_556x45_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_30Rnd_556x45_mag_Tracer_DimDescription";
        picture = "\A3\weapons_f\data\ui\m_30stanag_yellow_ca.paa";
    };

    class 30Rnd_556x45_Stanag;
    class ACE_30Rnd_556x45_Stanag_SD: 30Rnd_556x45_Stanag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_556x45_Ball_SD";
        displayName = "$STR_ACE_30Rnd_556x45_mag_SDName";
        displayNameShort = "$STR_ACE_30Rnd_556x45_mag_SDNameShort";
        descriptionShort = "$STR_ACE_30Rnd_556x45_mag_SDDescription";
        initSpeed = 320;
        picture = "\A3\weapons_f\data\ui\m_30stanag_green_ca.paa";
    };

    class ACE_30Rnd_556x45_Stanag_AP: 30Rnd_556x45_Stanag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_556x45_Ball_AP";
        displayName = "$STR_ACE_30Rnd_556x45_mag_APName";
        displayNameShort = "$STR_ACE_30Rnd_556x45_mag_APNameShort";
        descriptionShort = "$STR_ACE_30Rnd_556x45_mag_APDescription";
    };


    /* 7.62x51mm NATO */

    class 20Rnd_762x51_Mag;
    class ACE_20Rnd_762x51_Mag_Tracer: 20Rnd_762x51_Mag {  //@todo Green tracers for opfor and yellow tracers for independent
        author = "$STR_ACE_Common_ACETeam";
        ammo = "B_762x51_Tracer_Red";
        displayName = "$STR_ACE_20Rnd_762x51_mag_TracerName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_TracerNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_TracerDescription";
        tracersEvery = 1;
    };

    class ACE_20Rnd_762x51_Mag_Tracer_Dim: ACE_20Rnd_762x51_Mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_762x51_Tracer_Dim";
        displayName = "$STR_ACE_20Rnd_762x51_mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_Tracer_DimDescription";
    };

    class ACE_20Rnd_762x51_Mag_SD: 20Rnd_762x51_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_762x51_Ball_SD";
        displayName = "$STR_ACE_20Rnd_762x51_mag_SDName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_SDNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_SDDescription";
        initSpeed = 320;
    };

    class ACE_20Rnd_762x51_Mag_AP: 20Rnd_762x51_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_762x51_Ball_AP";
        displayName = "$STR_ACE_20Rnd_762x51_mag_APName";
        displayNameShort = "$STR_ACE_20Rnd_762x51_mag_APNameShort";
        descriptionShort = "$STR_ACE_20Rnd_762x51_mag_APDescription";
    };


    /* 338 Lapua Magnum */
    class 10Rnd_338_Mag;
    class ACE_10Rnd_338_Mag_Tracer: 10Rnd_338_Mag {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_10Rnd_338_Mag_TracerName";
        displayNameShort = "$STR_ACE_10Rnd_338_Mag_TracerNameShort";
        descriptionShort = "$STR_ACE_10Rnd_338_Mag_TracerDescription";
        tracersEvery = 1;
    };

    class ACE_10Rnd_338_Mag_Tracer_Dim: ACE_10Rnd_338_Mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_338_Ball_Tracer_Dim";
        displayName = "$STR_ACE_10Rnd_388_Mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_10Rnd_338_Mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_10Rnd_338_Mag_Tracer_DimDescription";
    };

    class ACE_10Rnd_338_Mag_AP: 10Rnd_338_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo ="ACE_B_338_Ball_AP";
        displayName = "$STR_ACE_10Rnd_338_Mag_APName";
        displayNameShort = "$STR_ACE_10Rnd_338_Mag_APNameShort";
        descriptionShort = "$STR_ACE_10Rnd_338_Mag_APDescription";
    };

    class ACE_10Rnd_338_Mag_SD: 10Rnd_338_Mag {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_338_Ball_SD";
        displayName = "$STR_ACE_10Rnd_338_Mag_SDName";
        displayNameShort = "$STR_ACE_10Rnd_338_Mag_SDNameShort";
        descriptionShort = "$STR_ACE_10Rnd_338_Mag_SDDescription";
        initSpeed = 320;
    };


    /* .333 Norma Magnum */

    class 130Rnd_338_Mag;
    class ACE_130Rnd_338_Mag_Tracer: 130Rnd_338_Mag {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_130Rnd_338_Mag_TracerName";
        displayNameShort = "$STR_ACE_130Rnd_338_Mag_TracerNameShort";
        descriptionShort = "$STR_ACE_130Rnd_338_Mag_TracerDescription";
        tracersEvery = 1;
    };

    class ACE_130Rnd_338_Mag_Tracer_Dim: ACE_130Rnd_338_Mag_Tracer {
        author = "$STR_ACE_Common_ACETeam";
        ammo = "ACE_B_338_NM_Ball_Tracer_Dim";
        displayName = "$STR_ACE_130Rnd_338_Mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_130Rnd_338_Mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_130Rnd_338_Mag_Tracer_DimDescription";
    };


    /* 9.3x64mm */

    class 10Rnd_93x64_DMR_05_Mag;
    class ACE_10Rnd_93x64_DMR_05_Mag_Tracer:  10Rnd_93x64_DMR_05_Mag {
        author = "$STR_ACE_Common_ACEETeam";
        displayName = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_TracerName";
        displayNameShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_TracerNameShort";
        descriptionShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_TracerDescription";
        tracersEvery = 1;
    };

    class ACE_10Rnd_93x64_DMR_05_Mag_Tracer_Dim:  ACE_10Rnd_93x64_DMR_05_Mag_Tracer {
        author = "$STR_ACE_Common_ACEETeam";
        ammo ="ACE_B_93x64_Ball_Tracer_Dim";
        displayName = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_Tracer_DimName";
        displayNameShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_Tracer_DimNameShort";
        descriptionShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_Tracer_DimDescription";
    };

    class ACE_10Rnd_93x64_DMR_05_Mag_AP:  10Rnd_93x64_DMR_05_Mag {
        author = "$STR_ACE_Common_ACEETeam";
        ammo = "ACE_B_93x64_Ball_AP";
        displayName = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_APName";
        displayNameShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_APNameShort";
        descriptionShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_APDescription";
    };

    class ACE_10Rnd_93x64_DMR_05_Mag_SD:  10Rnd_93x64_DMR_05_Mag {
        author = "$STR_ACE_Common_ACEETeam";
        ammo = "ACE_B_93x64_Ball_SD";
        displayName = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_SDName";
        displayNameShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_SDNameShort";
        descriptionShort = "$STR_ACE_10Rnd_93x64_DMR_05_Mag_SDDescription";
        initSpeed = 320;
    };
};
