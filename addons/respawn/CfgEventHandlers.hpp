
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

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(_this call FUNC(handleKilled));
        };
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class ADDON {
            respawn = QUOTE(_this call FUNC(handleRespawn));
        };
    };
};

class Extended_Init_EventHandlers {
    class ACE_Rallypoint_West {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; [ARR_3(_this select 0,'',west)] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_East {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; [ARR_3(_this select 0,'',east)] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_Independent {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; [ARR_3(_this select 0,'',independent)] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_West_Base {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; [ARR_3(_this select 0,'respawn_west',west)] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_East_Base {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; [ARR_3(_this select 0,'respawn_east',east)] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_Independent_Base {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; [ARR_3(_this select 0,'respawn_guerrila',independent)] call FUNC(initRallypoint));  //respawn_civilian
        };
    };
};

class Extended_InitPost_EventHandlers {
    // auto assign rallypoint leader
    class CAManBase {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleInitPostServer));
        };
    };
};
