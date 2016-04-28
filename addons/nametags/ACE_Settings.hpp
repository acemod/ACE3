
class CBA_Setting_List_base;
class CBA_Setting_Slider_base;

class CBA_Setting_Boolean_base;

class CBA_Settings {
    class A1 { class TEST1: CBA_Setting_Boolean_base {}; };
    class A2 { class TEST2: CBA_Setting_Boolean_base {}; };
    class A3 { class TEST3: CBA_Setting_Boolean_base {}; };
    class A4 { class TEST4: CBA_Setting_Boolean_base {}; };
    class A5 { class TEST5: CBA_Setting_Boolean_base {}; };
    class A6 { class TEST6: CBA_Setting_Boolean_base {}; };
    class A7 { class TEST7: CBA_Setting_Boolean_base {}; };
    class A8 { class TEST8: CBA_Setting_Boolean_base {}; };
    class A9 { class TEST9: CBA_Setting_Boolean_base {}; };
    class A10 { class TEST10: CBA_Setting_Boolean_base {}; };
    class A11 { class TEST11: CBA_Setting_Boolean_base {}; };
    class A12 { class TEST12: CBA_Setting_Boolean_base {}; };
    class A13 { class TEST13: CBA_Setting_Boolean_base {}; };
    class A14 { class TEST14: CBA_Setting_Boolean_base {}; };
    class A15 { class TEST15: CBA_Setting_Boolean_base {}; };
    class A16 { class TEST16: CBA_Setting_Boolean_base {}; };
    class A17 { class TEST17: CBA_Setting_Boolean_base {}; };
    class A18 { class TEST18: CBA_Setting_Boolean_base {}; };
    class A19 { class TEST19: CBA_Setting_Boolean_base {}; };
    class A20 { class TEST20: CBA_Setting_Boolean_base {}; };
    /*class ADDON {
        displayName = CSTRING(Module_DisplayName);

        class GVAR(useImperial): CBA_Setting_Boolean_base {
            displayName = CSTRING(UseImperial);
            defaultValue = 1;
        };
    };*/
};


class ACE_Settings {
    class GVAR(defaultNametagColor) {
        value[] = {0.77, 0.51, 0.08, 1};
        typeName = "COLOR";
        isClientSettable = 1;
        displayName = CSTRING(DefaultNametagColor);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showPlayerNames) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowPlayerNames);
        description = CSTRING(ShowPlayerNames_Desc);
        values[] = {ECSTRING(common,Disabled), ECSTRING(common,Enabled), CSTRING(OnlyCursor), CSTRING(OnlyKeypress), CSTRING(OnlyCursorAndKeypress)};
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showPlayerRanks) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowPlayerRanks);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showVehicleCrewInfo) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowVehicleCrewInfo);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showNamesForAI) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = CSTRING(ShowNamesForAI);
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showCursorTagForVehicles) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 0;
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(showSoundWaves) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(ShowSoundWaves);
        description = CSTRING(ShowSoundWaves_Desc);
        values[] = {ECSTRING(common,Disabled), CSTRING(NameTagSettings), CSTRING(AlwaysShowAll)};
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(playerNamesViewDistance) {
        value = 5;
        typeName = "SCALAR";
        isClientSettable = 0;
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(playerNamesMaxAlpha) {
        value = 0.8;
        typeName = "SCALAR";
        isClientSettable = 0;
        category = CSTRING(Module_DisplayName);
    };
    class GVAR(tagSize) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = CSTRING(TagSize_Name);
        description = CSTRING(TagSize_Description);
        values[] = {"$str_very_small", "$str_small", "$str_medium", "$str_large", "$str_very_large"};
        category = CSTRING(Module_DisplayName);
    };
};
