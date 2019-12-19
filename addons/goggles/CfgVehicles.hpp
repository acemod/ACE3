class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(wipeGlasses) {
                    displayName = CSTRING(WipeGlasses);
                    condition = QUOTE(GVAR(showClearGlasses) && {call FUNC(canWipeGlasses)});
                    statement = QUOTE(call FUNC(clearGlasses));
                };
            };
        };
    };
};
