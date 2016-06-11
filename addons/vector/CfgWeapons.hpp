
class CfgWeapons {
    class Binocular;
    class ACE_Vector: Binocular {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(VectorName);
        descriptionShort = CSTRING(VectorDescription);
        model = QPATHTOF(ace_vector.p3d);
        modelOptics = QPATHTOF(ace_vector_optics.p3d);
        picture = QPATHTOF(UI\ace_vector_x_ca.paa);
        visionMode[] = {"Normal","NVG"};
        opticsZoomMax = 0.06621;
        opticsZoomMin = 0.06621;
        weaponInfoType = "ACE_RscOptics_vector";
    };
    class ACE_VectorDay: ACE_Vector {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(VectorDayName);
        visionMode[] = {"Normal"};
    };
};
