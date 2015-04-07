class Module_F;
class ACE_ModuleExplosive: Module_F {
    author = "$STR_ACE_Common_ACETeam";
    category = "ACE";
    displayName = "Explosive System";
    function = QUOTE(FUNC(module));
    scope = 2;
    isGlobal = 1;
    icon = PATHTOF(UI\Icon_Module_Explosives_ca.paa);
    class Arguments {
        class RequireSpecialist {
            displayName = "Require specialists?";
            description = "Require explosive specialists to disable explosives? Default: No";
            typeName = "BOOL";
            class values {
                class Yes {
                    name = "Yes";
                    value = 1;
                };
                class No {
                    default = 1;
                    name = "No";
                    value = 0;
                };
            };
        };
        class PunishNonSpecialists {
            displayName = "Punish non-specialists?";
            description = "Increase the time it takes to complete actions for non-specialists? Default: Yes";
            typeName = "BOOL";
            class values {
                class Yes {
                    default = 1;
                    name = "Yes";
                    value = 1;
                };
                class No {
                    name = "No";
                    value = 0;
                };
            };
        };
    };
};
