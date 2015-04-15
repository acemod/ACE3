class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
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
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; [ARR_2(_this select 0,'')] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_East {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; [ARR_2(_this select 0,'')] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_Independent {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; [ARR_2(_this select 0,'')] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_West_Base {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_nato_CO.paa'; [ARR_2(_this select 0,'respawn_west')] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_East_Base {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_CSAT_CO.paa'; [ARR_2(_this select 0,'respawn_east')] call FUNC(initRallypoint));
        };
    };

    class ACE_Rallypoint_Independent_Base {
        class ADDON {
            init = QUOTE((_this select 0) setFlagTexture '\A3\Data_F\Flags\Flag_AAF_CO.paa'; [ARR_2(_this select 0,'respawn_guerrila')] call FUNC(initRallypoint));
        };
    };

    //respawn_civilian
};

// auto assign rallypoint leader
class Extended_InitPost_EventHandlers {
    class CAManBase {
        class ADDON {
            serverInit = QUOTE(_this call FUNC(handleInitPostServer));
        };
    };
};
