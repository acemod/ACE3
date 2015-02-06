class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_ApplyHandcuffs {
                displayName = "$STR_ACE_Captives_SetCaptive";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canApplyHandcuffs));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doApplyHandcuffs));
                exceptions[] = {};
                showDisabled = 0;
                priority = 2.4;
                icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                hotkey = "C";
            };
            class ACE_RemoveHandcuffs {
                displayName = "$STR_ACE_Captives_ReleaseCaptive";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canRemoveHandcuffs));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doRemoveHandcuffs));
                exceptions[] = {};
                showDisabled = 0;
                priority = 2.4;
                icon = QUOTE(PATHTOF(UI\handcuff_ca.paa));
                hotkey = "R";
            };
            class ACE_EscortCaptive {
                displayName = "$STR_ACE_Captives_EscortCaptive";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canEscortCaptive));
                statement = QUOTE([ARR_3(_player, _target, true)] call FUNC(doEscortCaptive));
                exceptions[] = {};
                showDisabled = 0;
                icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                priority = 2.3;
                hotkey = "E";
            };
            class ACE_StopEscorting {
                displayName = "$STR_ACE_Captives_StopEscorting";
                distance = 4;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canStopEscorting));
                statement = QUOTE([ARR_3(_player,_target, false)] call FUNC(doEscortCaptive));
                exceptions[] = {QGVAR(isNotEscorting)};
                showDisabled = 0;
                icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                priority = 2.3;
                hotkey = "E";
            };
            class ACE_LoadCaptive {
                displayName = "$STR_ACE_Captives_LoadCaptive";
                distance = 4;
                condition = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(canLoadCaptive));
                statement = QUOTE([ARR_3(_player, _target, objNull)] call FUNC(doLoadCaptive));
                exceptions[] = {QGVAR(isNotEscorting)};
                showDisabled = 0;
                icon = QUOTE(PATHTOF(UI\captive_ca.paa));
                priority = 2.2;
                hotkey = "L";
            };
            class ACE_FriskPerson {
                displayName = "$STR_ACE_Captives_FriskPerson";
                distance = 2;
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canFriskPerson));
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doFriskPerson));
                showDisabled = 0;
                //icon = "";  //@todo
                priority = 3;
                hotkey = "F";
            };
        };

        class ACE_SelfActions {
            class ACE_StopEscortingSelf {
                displayName = "$STR_ACE_Captives_StopEscorting";
                condition = QUOTE([ARR_2(_player, objNull)] call FUNC(canStopEscorting));
                statement = QUOTE([ARR_3(_player,objNull, false)] call FUNC(doEscortCaptive));
                exceptions[] = {QGVAR(isNotEscorting)};
                showDisabled = 0;
                priority = 2.3;
                hotkey = "C";
            };            
            class ACE_StartSurrenderingSelf {
                displayName = "$STR_ACE_Captives_StartSurrendering";
                condition = QUOTE([ARR_2(_player, true)] call FUNC(canSurrender));
                statement = QUOTE([ARR_2(_player, true)] call FUNC(surrender));
                exceptions[] = {};
                showDisabled = 0;
                priority = 0;
            };            
            class ACE_StopSurrenderingSelf {
                displayName = "$STR_ACE_Captives_StopSurrendering";
                condition = QUOTE([ARR_2(_player, false)] call FUNC(canSurrender));
                statement = QUOTE([ARR_2(_player, false)] call FUNC(surrender));
                exceptions[] = {QGVAR(isNotSurrendering)};
                showDisabled = 0;
                priority = 0;
            };
        };
    };

#define MACRO_LOADUNLOADCAPTIVE \
        class ACE_Actions { \
            class ACE_LoadCaptive { \
                displayName = "$STR_ACE_Captives_LoadCaptive"; \
                distance = 4; \
                condition = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(canLoadCaptive)); \
                statement = QUOTE([ARR_3(_player, objNull, _target)] call FUNC(doLoadCaptive)); \
                exceptions[] = {QGVAR(isNotEscorting)}; \
                showDisabled = 0; \
                priority = 1.2; \
                hotkey = "L"; \
            }; \
            class ACE_UnloadCaptive { \
                displayName = "$STR_ACE_Captives_UnloadCaptive"; \
                distance = 4; \
                condition = QUOTE([ARR_2(_player, _target)] call FUNC(canUnloadCaptive)); \
                statement = QUOTE([ARR_2(_player, _target)] call FUNC(doUnloadCaptive)); \
                showDisabled = 0; \
                priority = 1.2; \
                hotkey = "C"; \
            }; \
        };

    class LandVehicle;
    class Car: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };
    class Tank: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };

    class Air;
    class Helicopter: Air {
        MACRO_LOADUNLOADCAPTIVE
    };
    class Plane: Air {
        MACRO_LOADUNLOADCAPTIVE
    };

    class Ship;
    class Ship_F: Ship {
        MACRO_LOADUNLOADCAPTIVE
    };

    class StaticWeapon: LandVehicle {
        MACRO_LOADUNLOADCAPTIVE
    };

    class StaticMortar;
    class Mortar_01_base_F: StaticMortar {
        MACRO_LOADUNLOADCAPTIVE
    };

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
            name = #ITEM; \
            count = COUNT; \
        };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_CableTie,12)
        };
    };
};
