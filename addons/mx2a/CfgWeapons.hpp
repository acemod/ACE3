
class CfgWeapons {
    class Binocular;
    class ACE_MX2A: Binocular {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DisplayName);
        descriptionShort = CSTRING(Description);
        model = QPATHTOF(data\ace_mx2a.p3d);
        modelOptics = QPATHTOEF(apl,LWTS_optic.p3d);
        picture = QPATHTOF(UI\w_mx2a_ca.paa);
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
