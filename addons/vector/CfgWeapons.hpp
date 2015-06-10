
class CfgWeapons {
    class Binocular;
    class ACE_Vector: Binocular {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(VectorName);
        descriptionShort = CSTRING(VectorDescription);
        model = PATHTOF(ace_vector.p3d);
        modelOptics = PATHTOF(ace_vector_optics.p3d);
        picture = PATHTOF(UI\ace_vector_x_ca.paa);
        visionMode[] = {"Normal","NVG"};
        opticsZoomMax = 0.06621;
        opticsZoomMin = 0.06621;
        weaponInfoType = "ACE_RscOptics_vector";
    };
};
