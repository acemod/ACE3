class GVAR(AttackProfiles) {
    class LIN {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_LIN);
    };
    class DIR {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_DIR);
    };
    class MID {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_MID);
    };
    class HI {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_HI);
    };
     class JAV_DIR {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_JAV_DIR);
    };
    class JAV_TOP {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_JAV_TOP);
    };
    class WIRE {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_WIRE);
        onFired = QFUNC(wire_onFired);
    };
    class BEAM {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(attackProfile_BEAM);
        onFired = QFUNC(wire_onFired); // since Beam guidance is pretty much the same as Wire guidance, we can reuse this
    };
};

class GVAR(SeekerTypes) {
    class SALH {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(seekerType_SALH);
    };
    class Optic {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(seekerType_Optic);
    };
    class SACLOS {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(seekerType_SACLOS);
        onFired = QFUNC(SACLOS_onFired);
    };
    class MCLOS {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(seekerType_MCLOS);
    };
    class ARH {
        name = "";
        visualName = "";
        description = "";

        functionName = QFUNC(seekerType_ARH);
        onFired = QFUNC(ahr_onFired);
    };
};
