class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
    };
};

class Extended_Init_EventHandlers {
    class CAManBase {
        class ADDON {
            init = QUOTE(_this call FUNC(initPerson));
            exclude[] = {"VirtualMan_F"};
        };
    };
    class StaticWeapon {
        class ADDON {
            init = QUOTE(_this call FUNC(initObject));
        };
    };
    class Thing {
        class ADDON {
            init = QUOTE(_this call FUNC(initObject));
            exclude[] = {"ModuleEmpty_F", "ThingEffect", "Wreck"};
        };
    };
    class NonStrategic {
        class ADDON {
            init = QUOTE(_this call FUNC(initObject));
        };
    };
    class WeaponHolder {
        class ADDON {
            init = QUOTE(_this call FUNC(initObject));
            exclude[] = {"GroundWeaponHolder_Scripted"};
        };
    };
    class WeaponHolderSimulated {
        class ADDON {
            init = QUOTE(_this call FUNC(initObject));
            exclude[] = {"WeaponHolderSimulated_Scripted"};
        };
    };
    class Land_Camping_Light_F {
        class ADDON {
            init = QUOTE(_this call FUNC(initObject));
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};
