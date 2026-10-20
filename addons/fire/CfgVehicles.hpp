class CfgVehicles {
    class Static;
    class GVAR(logic): Static {
        scope = 1;
        displayName = "";
    };

    class Man;
    class CAManBase: Man {
        GVAR(screamSounds)[] = {
            QGVAR(scream_1), QGVAR(scream_2), QGVAR(scream_3), QGVAR(scream_4), QGVAR(scream_5),
            QGVAR(scream_6), QGVAR(scream_7), QGVAR(scream_8), QGVAR(scream_9), QGVAR(scream_10),
            QGVAR(scream_11), QGVAR(scream_12), QGVAR(scream_13), QGVAR(scream_14), QGVAR(scream_15)
        };
    };
};
