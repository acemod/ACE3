
class CfgVehicles {
    class Sign_F;
    class ACE_TargetWall: Sign_F {
        author = "$STR_ACE_Common_ACETeam";
        scope = 0;
        class Eventhandlers {
            init = QUOTE(_this call COMPILE_FILE(scripts\initTargetWall));
            //hitPart = "systemChat str _this";
        };
    };
};
