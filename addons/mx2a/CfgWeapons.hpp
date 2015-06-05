
class CfgWeapons {
    class Binocular;
    class ACE_MX2A: Binocular {
        author = "$STR_ACE_Common_ACETeam";
        displayName = "$STR_ACE_MX2A_DisplayName";
        descriptionShort = "$STR_ACE_MX2A_Description";
        model = PATHTOF(data\ace_mx2a.p3d);
        modelOptics = QUOTE(PATHTOEF(apl,LWTS_optic.p3d));
        picture = PATHTOF(UI\w_mx2a_ca.paa);
        opticsZoomMax = 0.1;
        distanceZoomMax = 120;
        opticsZoomMin = 0.05;
        distanceZoomMin = 400;
        opticsZoomInit = 0.1;
        visionMode[] = {"Ti"};
        thermalMode[] = {0,1};
        discretefov[] = {0.33333/1, 0.33333/2}; // 1x/2x -- http://www.drs.com/Products/RSTA/PDF/MX2A.pdf
        discreteInitIndex = 0;
        discreteDistance[] = {120,400};
        discreteDistanceInitIndex = 1;
        class WeaponSlotsInfo {
            mass = 20;
        };
    };
};
