class EGVAR(missileguidance,AttackProfiles) {
    class WIRE {
        name = "Wire-Guided";
        visualName = "Wire-Guided";
        description = "Wire-Guided missile";

        functionName = QFUNC(attackProfile_WIRE);
    };
};
class EGVAR(missileguidance,SeekerTypes) {
    class SACLOS {
        name = "SACLOS";
        visualName = "SACLOS";
        description = "Semi-automatic command to line of sight";
        
        functionName = QFUNC(seekerType_SACLOS);
    };
};