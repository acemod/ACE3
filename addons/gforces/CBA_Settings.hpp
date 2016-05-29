
class CBA_Setting_List_base;

class CBA_Settings {
    class ADDON {
        class GVAR(enabledFor): CBA_Setting_List_base {
            displayName = CSTRING(enabledFor_displayName);
            values[] = {0,1,2};
            labels[] = {ECSTRING(Common,Disabled), CSTRING(enabledFor_onlyAircraft), ECSTRING(Common,Enabled)};
            defaultValue = 2;
        };
    };
};
