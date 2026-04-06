#define RESERVE(COLOR) class C_Parachute_##COLOR##_RF: C_Parachute_Base_RF { \
        ace_hasReserveParachute = 1; \
        ace_reserveParachute = QUOTE(ACE_ReserveParachute_RF##COLOR); \
    }; \
    class ACE_ReserveParachute_RF##COLOR: C_Parachute_##COLOR##_RF { \
        author = ECSTRING(common,ACETeam); \
        displayName = SUBCSTRING(ReserveParachute##COLOR); \
        scope = 1; \
        ace_hasReserveParachute = 0; \
        ace_reserveParachute = ""; \
    }

class CfgVehicles {
    class C_Parachute_Base_RF;

    RESERVE(Blue);
    RESERVE(Green);
    RESERVE(Orange);
    RESERVE(White);
    RESERVE(Yellow);
};
