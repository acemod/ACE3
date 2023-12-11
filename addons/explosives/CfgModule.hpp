class ACE_Module;
class ACE_ModuleExplosive: ACE_Module {
    author = ECSTRING(common,ACETeam);
    category = "ACE";
    displayName = CSTRING(Module_DisplayName);
    function = QFUNC(module);
    scope = 1;
    isGlobal = 1;
    isSingular = 1;
    icon = QPATHTOF(UI\Icon_Module_Explosives_ca.paa);
    class Arguments {
        class RequireSpecialist {
            displayName = CSTRING(RequireSpecialist_DisplayName);
            description = CSTRING(RequireSpecialist_Description);
            typeName = "BOOL";
            defaultValue = 0;
        };
        class PunishNonSpecialists {
            displayName = CSTRING(PunishNonSpecialists_DisplayName);
            description = CSTRING(PunishNonSpecialists_Description);
            typeName = "BOOL";
            defaultValue = 1;
        };
        class ExplodeOnDefuse {
            displayName = CSTRING(ExplodeOnDefuse_DisplayName);
            description = CSTRING(ExplodeOnDefuse_Description);
            typeName = "BOOL";
            defaultValue = 1;
        };
    };
    class ModuleDescription {
        description = CSTRING(Module_Description);
    };
};
