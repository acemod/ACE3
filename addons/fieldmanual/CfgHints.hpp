
/*
    Preferred Image Size = 256x256
    Can Embed Images Into Description = 1024x512
        - Shadow = '0'
        - Size = '9'
*/

// INDENT - %11
// SELF INTERACT KEYBIND - %12
// INTERACT KEYBIND - %13
#define BASE_ARGUMENTS "'    '", \
QUOTE([ARR_2('ACE3 Common',QQEGVAR(interact_menu,selfInteractKey))] call FUNC(getKeybindName)), \
QUOTE([ARR_2('ACE3 Common',QQEGVAR(interact_menu,interactKey))] call FUNC(getKeybindName))

// MEDCIAL MENU KEYBIND - %14
#define MEDICAL_MENU_KEYBIND QUOTE([ARR_2('ACE3 Common',QQEGVAR(medical_gui,openMedicalMenuKey))] call FUNC(getKeybindName))


class CfgHints {
    class ACE_FieldManual_Base {
        arguments[] = {BASE_ARGUMENTS};
        image = "\z\ace\addons\common\data\logo_ace3_ca.paa";
        tip = "<a href='https://ace3.acemod.org/'>ACE Wiki</a>";
    };
    class ACE_Items {
        displayName = CSTRING(Items_DisplayName);
        category = "ACE_FieldManual";

        class ACE_ATragMX: ACE_FieldManual_Base {
            logicalOrder = 1;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_ATragMX' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_ATragMX_ShortName);
            description = CSTRING(Items_ATragMX_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/atragmx'>ATragMX Wiki</a>";
        };
        class ACE_BodyBag: ACE_FieldManual_Base {
            logicalOrder = 2;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_BodyBag' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_BodyBag_ShortName);
            description = CSTRING(Items_BodyBag_Description);
        };
        class ACE_CableTie: ACE_FieldManual_Base {
            logicalOrder = 3;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_CableTie' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_CableTie_ShortName);
            description = CSTRING(Items_CableTie_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/captives'>Captives Wiki</a>";
        };
        class ACE_Cellphone: ACE_FieldManual_Base {
            logicalOrder = 4;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_Cellphone' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Cellphone_ShortName);
            description = CSTRING(Items_Cellphone_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/explosives'>Explosives Wiki</a>";
        };
        class ACE_Chemlight_Shield: ACE_FieldManual_Base {
            logicalOrder = 5;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_Chemlight_Shield' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Chemlight_Shield_ShortName);
            description = CSTRING(Items_Chemlight_Shield_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/chemlights'>Chemlights Wiki</a>";
        };
        class ACE_Clackers: ACE_FieldManual_Base {
            logicalOrder = 6;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_Clacker' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Clackers_ShortName);
            description = CSTRING(Items_Clackers_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/explosives'>Explosives Wiki</a>";
        };
        class ACE_DAGR: ACE_FieldManual_Base {
            logicalOrder = 7;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_DAGR' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_DAGR_ShortName);
            description = CSTRING(Items_DAGR_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/dagr'>DAGR Wiki</a>";
        };
        class ACE_DeadManSwitch: ACE_FieldManual_Base {
            logicalOrder = 8;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_DeadManSwitch' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_DeadManSwitch_ShortName);
            description = CSTRING(Items_DeadManSwitch_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/explosives'>Explosives Wiki</a>";
        };
        class ACE_DefusalKit: ACE_FieldManual_Base {
            logicalOrder = 9;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_DefusalKit' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_DefusalKit_ShortName);
            description = CSTRING(Items_DefusalKit_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/explosives'>Explosives Wiki</a>";
        };
        class ACE_EarPlugs: ACE_FieldManual_Base {
            logicalOrder = 10;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_EarPlugs' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_EarPlugs_ShortName);
            description = CSTRING(Items_EarPlugs_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/hearing'>Hearing Wiki</a>";
        };
        class ACE_EntrenchingTool: ACE_FieldManual_Base {
            logicalOrder = 11;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_EntrenchingTool' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_EntrenchingTool_ShortName);
            description = CSTRING(Items_EntrenchingTool_Description);
        };
        class ACE_Flashlights: ACE_FieldManual_Base {
            logicalOrder = 12;
            displayName = CSTRING(Items_Flashlights_DisplayName);
            displayNameShort = CSTRING(Items_Flashlights_ShortName);
            description = CSTRING(Items_Flashlights_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/flashlights'>Flashlights Wiki</a>";
        };
        class ACE_FortifyTool: ACE_FieldManual_Base {
            logicalOrder = 13;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_FortifyTool' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_FortifyTool_ShortName);
            description = CSTRING(Items_FortifyTool_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/fortify'>Fortify Wiki</a>";
        };
        class ACE_HuntIR_Monitor: ACE_FieldManual_Base {
            logicalOrder = 14;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_HuntIR_monitor' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_HuntIR_Monitor_ShortName);
            description = CSTRING(Items_HuntIR_Monitor_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/huntir'>HuntIR Wiki</a>";
        };
        class ACE_IR_Strobe: ACE_FieldManual_Base {
            logicalOrder = 15;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_IR_Strobe_Item' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_IR_Strobe_ShortName);
            description = CSTRING(Items_IR_Strobe_Description);
        };
        class ACE_Kestrel4500: ACE_FieldManual_Base {
            logicalOrder = 16;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_Kestrel4500' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Kestrel4500_ShortName);
            description = CSTRING(Items_Kestrel4500_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/kestrel4500'>Kestrel 4500 Wiki</a>";
        };
        class ACE_Lockpick: ACE_FieldManual_Base {
            logicalOrder = 17;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_key_lockpick' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Lockpick_ShortName);
            description = CSTRING(Items_Lockpick_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/framework/vehiclelock-framework.html'>Vehicle Lock Wiki</a>";
        };
        class ACE_MapTools: ACE_FieldManual_Base {
            logicalOrder = 18;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_MapTools' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_MapTools_ShortName);
            description = CSTRING(Items_MapTools_Description);
        };
        class ACE_MicroDAGR: ACE_FieldManual_Base {
            logicalOrder = 19;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_microDAGR' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_MicroDAGR_ShortName);
            description = CSTRING(Items_MicroDAGR_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/microdagr.html'>MicroDAGR Wiki</a>";
        };
        // Combine all range tables under one roof [mortar, artillery, rifle]
        class ACE_RangeTables: ACE_FieldManual_Base {
            logicalOrder = 20;
            displayName = CSTRING(Items_RangeTables_DisplayName);
            displayNameShort = CSTRING(Items_RangeTables_ShortName);
            description = CSTRING(Items_RangeTables_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/rangecard'>Rangecard Wiki</a>";
        };
        class ACE_Ropes: ACE_FieldManual_Base {
            logicalOrder = 21;
            displayName = CSTRING(Items_Ropes_DisplayName);
            displayNameShort = CSTRING(Items_Ropes_ShortName);
            description = CSTRING(Items_Ropes_Description);
        };
        class ACE_Sandbag: ACE_FieldManual_Base {
            logicalOrder = 22;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_Sandbag_empty' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Sandbag_ShortName);
            description = CSTRING(Items_Sandbag_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/sandbags'>Sandbag Wiki</a>";
        };
        class ACE_SpareBarrels: ACE_FieldManual_Base {
            logicalOrder = 23;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_SpareBarrel_Item' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_SpareBarrels_ShortName);
            description = CSTRING(Items_SpareBarrels_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/overheating'>Overheating Wiki</a>";
        };
        class ACE_SprayPaint: ACE_FieldManual_Base {
            logicalOrder = 24;
            displayName = CSTRING(Items_SprayPaint_DisplayName);
            displayNameShort = CSTRING(Items_SprayPaint_ShortName);
            description = CSTRING(Items_SprayPaint_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/tagging'>Tagging Wiki</a>";
        };
        class ACE_Tripod: ACE_FieldManual_Base {
            logicalOrder = 25;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_Tripod' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Tripod_ShortName);
            description = CSTRING(Items_Tripod_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/tripod'>Tripod Wiki</a>";
        };
        class ACE_UAVBattery: ACE_FieldManual_Base {
            logicalOrder = 26;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_UAVBattery' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_UAVBattery_ShortName);
            description = CSTRING(Items_UAVBattery_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/logistics-uavbattery'>UAV Battery Wiki</a>";
        };
        class ACE_VehicleKey: ACE_FieldManual_Base {
            logicalOrder = 27;
            displayName = CSTRING(Items_VehicleKey_DisplayName);
            displayNameShort = CSTRING(Items_VehicleKey_ShortName);
            description = CSTRING(Items_VehicleKey_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/framework/vehiclelock-framework.html'>Vehicle Lock Wiki</a>";
        };
        class ACE_Wirecutter: ACE_FieldManual_Base {
            logicalOrder = 28;
            arguments[] = {BASE_ARGUMENTS, QUOTE('ACE_wirecutter' call FUNC(getItemName))};
            displayName = "%14";
            displayNameShort = CSTRING(Items_Wirecutter_ShortName);
            description = CSTRING(Items_Wirecutter_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/logistics-wirecutter'>Wirecutter Wiki</a>";
        };
    };
    // ACE Field Rations
    class ACE_Field_Rations {
        displayName = CSTRING(Field_Rations_DisplayName);
        category = "ACE_FieldManual";

        class ACE_Field_Rations_Base: ACE_FieldManual_Base {
            tip = "<a href='https://ace3.acemod.org/wiki/framework/field-rations-framework'>Field Rations Wiki</a>";
        };

        class Hunger: ACE_Field_Rations_Base {
            logicalOrder = 1;
            displayName = CSTRING(Field_Rations_Hunger_DisplayName);
            description = CSTRING(Field_Rations_Hunger_Description);
        };
        class Thirst: ACE_Field_Rations_Base {
            logicalOrder = 2;
            displayName = CSTRING(Field_Rations_Thirst_DisplayName);
            description = CSTRING(Field_Rations_Thirst_Description);
        };
    };
    // ACE Medical
    class ACE_Medical_Treatment {
        displayName = CSTRING(Medical_Treatment_DisplayName);
        category = "ACE_FieldManual";

        class ACE_Medical_Treatment_Base: ACE_FieldManual_Base {
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND};
            tip = "<a href='https://ace3.acemod.org/wiki/feature/medical-system'>Medical Wiki</a>";
        };

        class ACE_MedicalMenu: ACE_Medical_Treatment_Base {
            logicalOrder = 1;
            displayName = CSTRING(Medical_Treatment_MedicalMenu_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_MedicalMenu_ShortName);
            description = CSTRING(Medical_Treatment_MedicalMenu_Description);
        };
        class ACE_Adenosine: ACE_Medical_Treatment_Base {
            logicalOrder = 2;
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND, QUOTE('ACE_adenosine' call FUNC(getItemName))};
            displayName = "%15";
            displayNameShort = CSTRING(Medical_Treatment_Adenosine_ShortName);
            description = CSTRING(Medical_Treatment_Adenosine_Description);
        };
        class ACE_Bandages: ACE_Medical_Treatment_Base {
            logicalOrder = 3;
            displayName = CSTRING(Medical_Treatment_Bandages_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_Bandages_ShortName);
            description = CSTRING(Medical_Treatment_Bandages_Description);
        };
        class ACE_Fluids: ACE_Medical_Treatment_Base {
            logicalOrder = 4;
            displayName = CSTRING(Medical_Treatment_IVFluids_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_IVFluids_ShortName);
            description = CSTRING(Medical_Treatment_IVFluids_Description);
        };
        class ACE_Epinephrine: ACE_Medical_Treatment_Base {
            logicalOrder = 5;
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND, QUOTE('ACE_epinephrine' call FUNC(getItemName))};
            displayName = "%15";
            displayNameShort = CSTRING(Medical_Treatment_Epinephrine_ShortName);
            description = CSTRING(Medical_Treatment_Epinephrine_Description);
        };
        class ACE_PAK: ACE_Medical_Treatment_Base {
            logicalOrder = 6;
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND, QUOTE('ACE_personalAidKit' call FUNC(getItemName))};
            displayName = "%15";
            displayNameShort = CSTRING(Medical_Treatment_PAK_ShortName);
            description = CSTRING(Medical_Treatment_PAK_Description);
        };
        class ACE_Splint: ACE_Medical_Treatment_Base {
            logicalOrder = 7;
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND, QUOTE('ACE_splint' call FUNC(getItemName))};
            displayName = "%15";
            displayNameShort = CSTRING(Medical_Treatment_Splint_ShortName);
            description = CSTRING(Medical_Treatment_Splint_Description);
        };
        class ACE_SurgicalKit: ACE_Medical_Treatment_Base {
            logicalOrder = 8;
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND, QUOTE('ACE_surgicalKit' call FUNC(getItemName))};
            displayName = "%15";
            displayNameShort = CSTRING(Medical_Treatment_SurgicalKit_ShortName);
            description = CSTRING(Medical_Treatment_SurgicalKit_Description);
        };
        class ACE_Tourniquet: ACE_Medical_Treatment_Base {
            logicalOrder = 9;
            arguments[] = {BASE_ARGUMENTS, MEDICAL_MENU_KEYBIND, QUOTE('ACE_tourniquet' call FUNC(getItemName))};
            displayName = "%15";
            displayNameShort = CSTRING(Medical_Treatment_CAT_ShortName);
            description = CSTRING(Medical_Treatment_CAT_Description);
        };
    };
};
