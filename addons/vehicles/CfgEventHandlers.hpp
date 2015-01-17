
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_Engine_EventHandlers {
    class Car {
        class ACE_EngineStartDelay {
            clientEngine = QUOTE(if (local driver (_this select 0)) then {_this call FUNC(startEngine)};);
        };
    };
};
