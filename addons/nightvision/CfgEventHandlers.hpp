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

// In SP-Editor, opening escape menu will break nvg grain effect
class Extended_DisplayLoad_EventHandlers {
    class RscDisplayInterrupt {
        GVAR(resetGrain) = QUOTE(if (GVAR(ppeffectGrain) > -1) then {ppEffectDestroy GVAR(ppeffectGrain);};);
    };
};
