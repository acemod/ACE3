
class CfgWeapons {
    class Binocular;
    class ACE_Yardage450: Binocular {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(DisplayName);
        descriptionShort = CSTRING(Description);
        model = QPATHTOF(data\ace_yardage_pro_450.p3d);
        modelOptics = QPATHTOF(data\bushnell_optic.p3d);
        picture = QPATHTOF(UI\w_bushnell_ca.paa);
        opticsZoomMin = 0.33333/4;
        opticsZoomMax = 0.33333/4;
        opticsZoomInit = 0.33333/4;
        distanceZoomMin = 400;
        distanceZoomMax = 400;
        discretefov[] = {0.33333/4};
        discreteInitIndex = 0;
        visionMode[] = {"Normal"};
        class WeaponSlotsInfo {
            mass = 12;
        };
    };
};
