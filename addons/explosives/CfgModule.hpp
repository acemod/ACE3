class ACE_Module;
class ACE_ModuleExplosive: ACE_Module {
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
            defaultValue = 0;
        };
        class PunishNonSpecialists {
            displayName = "$STR_ACE_Explosive_PunishNonSpecialists_DisplayName";
            description = "$STR_ACE_Explosive_PunishNonSpecialists_Description";
            typeName = "BOOL";
            defaultValue = 1;
        };
    };
    class ModuleDescription: ModuleDescription {
        description = "$STR_ACE_Explosive_Module_Description";
    };
};