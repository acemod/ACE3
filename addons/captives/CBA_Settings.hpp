
class CBA_Setting_Boolean_base;
class CBA_Setting_List_base;

class CBA_Settings {
    class ADDON {
        //displayName = CSTRING(Module_DisplayName);
        class GVAR(allowHandcuffOwnSide): CBA_Setting_Boolean_base {
            displayName = CSTRING(ModuleSettings_handcuffSide_name);
            tooltip = CSTRING(ModuleSettings_handcuffSide_description);
            typeName = "BOOL";
            defaultValue = 1;
        };
        class GVAR(requireSurrender): CBA_Setting_List_base {
            displayName = CSTRING(ModuleSettings_requireSurrender_name);
            tooltip = CSTRING(ModuleSettings_requireSurrender_description);
            values[] = {0,1,2};
            labels[] = {ECSTRING(common,Disabled), CSTRING(SurrenderOnly), CSTRING(SurrenderOrNoWeapon)};
            defaultIndex = 1;
        };
        class GVAR(allowSurrender): CBA_Setting_Boolean_base {
            displayName = CSTRING(ModuleSettings_allowSurrender_name);
            tooltip = CSTRING(ModuleSettings_allowSurrender_description);
            typeName = "BOOL";
            defaultValue = 1;
        };
    };
};
