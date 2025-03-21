class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_PutInEarplugs {
                    displayName = CSTRING(EarPlugs_On);
                    condition = QUOTE(GVAR(enableCombatDeafness) && {!(_player getVariable [ARR_2('ACE_hasEarPlugsIn',false)]) && {[ARR_2(_player,'ACE_EarPlugs')] call EFUNC(common,hasItem)}});
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,true)] call FUNC(putInEarPlugs));
                    showDisabled = 0;
                    icon = QPATHTOF(UI\ACE_earplugs_x_ca.paa);
                };
                class ACE_RemoveEarplugs {
                    displayName = CSTRING(EarPlugs_Off);
                    condition = QUOTE(GVAR(enableCombatDeafness) && {_player getVariable [ARR_2('ACE_hasEarPlugsIn',false)]});
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,true)] call FUNC(removeEarPlugs));
                    showDisabled = 0;
                    icon = QPATHTOF(UI\ACE_earplugs_x_ca.paa);
                };
                class ACE_PutOnEHP {
                    displayName = CSTRING(ElectronicHearingProtection_On);
                    condition = QUOTE([_player] call FUNC(canPutOnEHP));
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,true)] call FUNC(putOnEHP));
                    showDisabled = 0;
                    icon = "\A3\Characters_F_Orange\Headgear\Data\UI\icon_H_EarProtectors_black_F_CA.paa";
                };
                class ACE_RemoveEHP {
                    displayName = CSTRING(ElectronicHearingProtection_Off);
                    condition = QUOTE(GVAR(EnableCombatDeafness) && {_player getVariable [ARR_2('ACE_hasEHP',false)]});
                    exceptions[] = {"isNotSwimming", "isNotInside", "isNotSitting"};
                    statement = QUOTE([ARR_2(_player,true)] call FUNC(removeEHP));
                    showDisabled = 0;
                    icon = "\A3\Characters_F_Orange\Headgear\Data\UI\icon_H_EarProtectors_black_F_CA.paa";
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
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class B_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class O_supplyCrate_F: B_supplyCrate_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class I_supplyCrate_F: B_supplyCrate_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class IG_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class C_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_EarPlugs,12);
            MACRO_ADDITEM(ACE_EHP,12);
        };
    };

    class ACE_Module;
    class ACE_ModuleHearing: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleHearing);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon = QPATHTOF(UI\Icon_Module_Hearing_ca.paa);
        class Arguments {
            class EnableCombatDeafness {
                displayName = CSTRING(EnableCombatDeafness_DisplayName);
                description = CSTRING(EnableCombatDeafness_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class DisableEarRinging {
                displayName = CSTRING(DisableEarRinging_DisplayName);
                description = CSTRING(DisableEarRinging_Description);
                typeName = "NUMBER";
                class values {
                    class DoNotForce {
                        default = 1;
                        name = ECSTRING(common,DoNotForce);
                        value = -1;
                    };
                    /* Probably don't want to allow forcing ear ringing for people who have serious problems with the effect
                    class NotDisabled {
                        name = ECSTRING(common,No);
                        value = 0;
                    };
                    */
                    class IsDisabled {
                        name = ECSTRING(common,Yes);
                        value = 1;
                    };
                };
            };
            class enabledForZeusUnits {
                displayName = CSTRING(enabledForZeusUnits_DisplayName);
                description = CSTRING(enabledForZeusUnits_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class autoAddEarplugsToUnits {
                displayName = CSTRING(autoAddEarplugsToUnits_DisplayName);
                description = CSTRING(autoAddEarplugsToUnits_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
