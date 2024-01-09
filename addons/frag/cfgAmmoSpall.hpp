class GVAR(spallBase) : B_65x39_Caseless
{
    access = 3;
    submunitionAmmo[] = {QGVAR(small),4,QGVAR(medium),3,QGVAR(large),2,QGVAR(huge),1};
    submunitionConeType[] = {"random", 20};
    submunitionConeAngle = 40;
    submunitionDirectionType = "SubmunitionModelDirection";
    triggerTime = 0;
    submunitionInitialOffset[] = {0,0,0};
    submunitionInitSpeed = 0; 
    triggerSpeedCoef[] = {0.75,1.25};
    deleteParentWhenTriggered = 1;
    submunitionParentSpeedCoef = 1;
	ACE_FRAG_RM_EH;
};

class GVAR(spall_tiny) : GVAR(spallBase)
{
    submunitionAmmo[] = {QGVAR(small), 4, QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 5};
    submunitionConeAngle = 40;
};

class GVAR(spall_small) : GVAR(spallBase)
{
    submunitionAmmo[] = {QGVAR(small), 4,QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 10};
    submunitionConeAngle = 40;
};

class GVAR(spall_medium) : GVAR(spallBase)
{
    submunitionAmmo[] = {QGVAR(small), 2, QGVAR(small_HD), 1,QGVAR(medium), 3, QGVAR(medium_HD), 1, QGVAR(large), 2};
    submunitionConeType[] = {"poissondisccenter", 15};
    submunitionConeAngle = 40;
};

class GVAR(spall_large) : GVAR(spallBase)
{
    submunitionAmmo[] = {QGVAR(tiny), 3, QGVAR(tiny_HD), 3, QGVAR(small), 4, QGVAR(small_HD), 4, QGVAR(medium_HD), 5, QGVAR(large), 2, QGVAR(large_HD), 2, QGVAR(huge),1};
    submunitionConeType[] = {"poissondisccenter", 15};
    submunitionConeAngle = 40;
};

class GVAR(spall_huge) : GVAR(spallBase)
{
    submunitionAmmo[] = {QGVAR(tiny), 3, QGVAR(tiny_HD), 3, QGVAR(small), 4, QGVAR(small_HD), 4, QGVAR(medium_HD), 5, QGVAR(large), 2, QGVAR(large_HD), 2, QGVAR(huge),1};
    submunitionConeType[] = {"poissondisccenter", 20};
    submunitionConeAngle = 40;
};