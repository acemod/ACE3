class EGVAR(missileguidance,AttackProfiles) {
    class DRAGON {
        name = CSTRING(dragonName);
        visualName = CSTRING(dragonName);
        description = CSTRING(dragonName);

        onFired = QFUNC(onFired);
        functionName = QFUNC(attackProfile_DRAGON);
    };
};

