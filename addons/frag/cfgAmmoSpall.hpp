class GVAR(spallBase) : B_65x39_Caseless
{
    access = 3;
    submunitionAmmo[] = {"ace_frag_small_c",4,"ace_frag_medium_c",3,"ace_frag_large_c",2,"ace_frag_huge_c",1};
    submunitionConeType[] = {"random", 20};
    submunitionConeAngle = 40;
    submunitionDirectionType = "SubmunitionModelDirection";
    triggerTime = 0;
    submunitionInitialOffset[] = {0,0,0};
    submunitionInitSpeed = 0; 
    triggerSpeedCoef[] = {0.75,1.25};
    deleteParentWhenTriggered = 1;
    submunitionParentSpeedCoef = 1;
};

class GVAR(spall_tiny) : GVAR(spallBase)
{
    submunitionAmmo[] = {"ace_frag_small_c", 4, "ace_frag_medium_c", 1};
    submunitionConeType[] = {"poissondisccenter", 5};
    submunitionConeAngle = 40;
};

class GVAR(spall_small) : GVAR(spallBase)
{
    submunitionAmmo[] = {"ace_frag_small_c", 4,"ace_frag_medium_c", 1};
    submunitionConeType[] = {"poissondisccenter", 10};
    submunitionConeAngle = 40;
};

class GVAR(spall_medium) : GVAR(spallBase)
{
    submunitionAmmo[] = {"ace_frag_small_c", 2, "ace_frag_small_HD_c", 1,"ace_frag_medium_c", 3, "ace_frag_medium_HD_c", 1, "ace_frag_large_c", 2};
    submunitionConeType[] = {"poissondisccenter", 15};
    submunitionConeAngle = 40;
};

class GVAR(spall_large) : GVAR(spallBase)
{
    submunitionAmmo[] = {"ace_frag_tiny_c", 3, "ace_frag_tiny_HD_c", 3, "ace_frag_small_c", 4, "ace_frag_small_HD_c", 4, "ace_frag_medium_HD_c", 5, "ace_frag_large_c", 2, "ace_frag_large_HD_c", 2, "ace_frag_huge_c",1};
    submunitionConeType[] = {"poissondisccenter", 15};
    submunitionConeAngle = 40;
};

class GVAR(spall_huge) : GVAR(spallBase)
{
    submunitionAmmo[] = {"ace_frag_tiny_c", 3, "ace_frag_tiny_HD_c", 3, "ace_frag_small_c", 4, "ace_frag_small_HD_c", 4, "ace_frag_medium_HD_c", 5, "ace_frag_large_c", 2, "ace_frag_large_HD_c", 2, "ace_frag_huge_c",1};
    submunitionConeType[] = {"poissondisccenter", 20};
    submunitionConeAngle = 40;
};