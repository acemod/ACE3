
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE((_this select 0) setVariable [ARR_3(QUOTE(QGVAR(assignedFireTeam)),(_this select 0) getVariable [ARR_2(QUOTE(QGVAR(assignedFireTeam)),'MAIN')],true)]);
        };
    };
};
