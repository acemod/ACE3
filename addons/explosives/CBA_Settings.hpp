
class CBA_Setting_Boolean_base;

class CBA_Settings {
    class PREFIX {
        class GVAR(requireSpecialist): CBA_Setting_Boolean_base {
            displayName = CSTRING(RequireSpecialist_DisplayName);
            tooltip = CSTRING(RequireSpecialist_Description);
            defaultValue = 0;
        };
        class GVAR(punishNonSpecialists): CBA_Setting_Boolean_base {
            displayName = CSTRING(PunishNonSpecialists_DisplayName);
            tooltip = CSTRING(PunishNonSpecialists_Description);
            defaultValue = 1;
        };
        class GVAR(explodeOnDefuse): CBA_Setting_Boolean_base {
            displayName = CSTRING(ExplodeOnDefuse_DisplayName);
            tooltip = CSTRING(ExplodeOnDefuse_Description);
            defaultValue = 1;
        };
    };
};
