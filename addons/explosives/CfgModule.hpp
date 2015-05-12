class Logic;
class Module_F: Logic {
    class ModuleDescription {};
};
class ACE_ModuleExplosive: Module_F {
    author = "$STR_ACE_Common_ACETeam";
    category = "ACE";
    displayName = "$STR_ACE_Explosive_Module_DisplayName";
    function = QUOTE(FUNC(module));
    scope = 2;
    isGlobal = 1;
    icon = PATHTOF(UI\Icon_Module_Explosives_ca.paa);
    class Arguments {
        class RequireSpecialist {
            displayName = "$STR_ACE_Explosive_RequireSpecialist_DisplayName";
            description = "$STR_ACE_Explosive_RequireSpecialist_Description";
            typeName = "BOOL";
            class values {
                class Yes {
                    name = "$STR_ACE_Explosive_Yes";
                    value = 1;
                };
                class No {
                    default = 1;
                    name = "$STR_ACE_Explosive_No";
                    value = 0;
                };
            };
        };
        class PunishNonSpecialists {
            displayName = "$STR_ACE_Explosive_PunishNonSpecialists_DisplayName";
            description = "$STR_ACE_Explosive_PunishNonSpecialists_Description";
            typeName = "BOOL";
            class values {
                class Yes {
                    default = 1;
                    name = "$STR_ACE_Explosive_Yes";
                    value = 1;
                };
                class No {
                    name = "$STR_ACE_Explosive_No";
                    value = 0;
                };
            };
        };
    };
    class ModuleDescription: ModuleDescription {
        description = "$STR_ACE_Explosive_Module_Description";
    };
};