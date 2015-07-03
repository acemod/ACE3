class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_PutInEarplugs {
                    displayName = CSTRING(EarPlugs_On);
                    condition = QUOTE( !([_player] call FUNC(hasEarPlugsIn)) && {'ACE_EarPlugs' in items _player} );
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE( [_player] call FUNC(putInEarPlugs) );
                    showDisabled = 0;
                    priority = 2.5;
                    icon = PATHTOF(UI\ACE_earplugs_x_ca.paa);
                    hotkey = "E";
                };
                class ACE_RemoveEarplugs {
                    displayName = CSTRING(EarPlugs_Off);
                    condition = QUOTE( [_player] call FUNC(hasEarPlugsIn) );
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE( [_player] call FUNC(removeEarPlugs) );
                    showDisabled = 0;
                    priority = 2.5;
                    icon = PATHTOF(UI\ACE_earplugs_x_ca.paa);
                    hotkey = "E";
                };
            };
        };
    };

    class ReammoBox_F;
    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;

    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class B_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class O_supplyCrate_F: B_supplyCrate_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class I_supplyCrate_F: B_supplyCrate_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class IG_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class C_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
        };
    };

    class ACE_Module;
    class ACE_ModuleHearing: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleHearing);
        scope = 2;
        isGlobal = 1;
        icon = PATHTOF(UI\Icon_Module_Hearing_ca.paa);
        class Arguments {
            class EnableCombatDeafness {
                displayName = CSTRING(CombatDeafness_DisplayName);
                description = CSTRING(CombatDeafness_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
