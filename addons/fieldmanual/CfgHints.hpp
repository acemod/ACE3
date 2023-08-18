
/*
    Preferred Image Size = 256x256
    Can Embed Images Into Description = 1024x512
        - Shadow = '0'
        - Size = '9'
*/

class CfgHints {    
    class ACE_Items {
        displayName = CSTRING(Items_DisplayName);
        category = "ACE_FieldManual";

        class ACE_Items_Base {
            arguments[] = {
                // SELF INTERACT KEYBIND - %11
                "
                    private _localized = 'Self Interact Key';
                    if !(isNil {['ACE3 Common', 'ace_interact_menu_selfInteractKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_interact_menu_selfInteractKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // INTERACT KEYBIND - %12
                "
                    private _localized = 'Interact Key';
                    if !(isNil {['ACE3 Common', 'ace_interact_menu_interactKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_interact_menu_interactKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // MEDICAL MENU KEYBIND - %13
                "
                    private _localized = 'Medical Menu Key';
                    if !(isNil {['ACE3 Common', 'ace_medical_gui_openMedicalMenuKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_medical_gui_openMedicalMenuKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // PLACEHOLDERS FOR OTHER KEYBINDS - %14 - %20
                // EMPTY STRING - CANNOT BE NIL
                "''","''","''","''","''","''","''",

                // FORMATTING - >= %21
                // INDENT
                "'    '"
            };
            image = "\z\ace\addons\common\data\logo_ace3_ca.paa";
        };
        class ACE_ATragMX: ACE_Items_Base {
            logicalOrder = 1;
            displayName = CSTRING(Items_ATragMX_DisplayName);
            displayNameShort = CSTRING(Items_ATragMX_ShortName);
            description = CSTRING(Items_ATragMX_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/atragmx'>ATragMX Wiki</a>";
        };
        class ACE_BodyBag: ACE_Items_Base {
            logicalOrder = 2;
            displayName = CSTRING(Items_BodyBag_DisplayName);
            displayNameShort = CSTRING(Items_BodyBag_ShortName);
            description = CSTRING(Items_BodyBag_Description);
        };
        class ACE_CableTie: ACE_Items_Base {
            logicalOrder = 3;
            displayName = CSTRING(Items_CableTie_DisplayName);
            displayNameShort = CSTRING(Items_CableTie_ShortName);
            description = CSTRING(Items_CableTie_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/captives'>Captives Wiki</a>";
        };
        class ACE_Cellphone: ACE_Items_Base {
            logicalOrder = 4;
            displayName = CSTRING(Items_Cellphone_DisplayName);
            displayNameShort = CSTRING(Items_Cellphone_ShortName);
            description = CSTRING(Items_Cellphone_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/explosives'>Explosives Wiki</a>";
        };
        class ACE_Chemlight_Shield: ACE_Items_Base {
            logicalOrder = 5;
            displayName = CSTRING(Items_Chemlight_Shield_DisplayName);
            displayNameShort = CSTRING(Items_Chemlight_Shield_ShortName);
            description = CSTRING(Items_Chemlight_Shield_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/chemlights'>Chemlights Wiki</a>";
        };
        class ACE_Clackers: ACE_Items_Base {
            logicalOrder = 6;
            displayName = CSTRING(Items_Clackers_DisplayName);
            displayNameShort = CSTRING(Items_Clackers_ShortName);
            description = CSTRING(Items_Clackers_Description);
        };
        class ACE_DAGR: ACE_Items_Base {
            logicalOrder = 7;
            displayName = CSTRING(Items_DAGR_DisplayName);
            displayNameShort = CSTRING(Items_DAGR_ShortName);
            description = CSTRING(Items_DAGR_Description);
        };
        class ACE_DeadManSwitch: ACE_Items_Base {
            logicalOrder = 8;
            displayName = CSTRING(Items_DeadManSwitch_DisplayName);
            displayNameShort = CSTRING(Items_DeadManSwitch_ShortName);
            description = CSTRING(Items_DeadManSwitch_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/explosives'>Explosives Wiki</a>";
        };
        class ACE_DefusalKit: ACE_Items_Base {
            logicalOrder = 9;
            displayName = CSTRING(Items_DefusalKit_DisplayName);
            displayNameShort = CSTRING(Items_DefusalKit_ShortName);
            description = CSTRING(Items_DefusalKit_Description);
        };
        class ACE_EarPlugs: ACE_Items_Base {
            logicalOrder = 10;
            displayName = CSTRING(Items_EarPlugs_DisplayName);
            displayNameShort = CSTRING(Items_EarPlugs_ShortName);
            description = CSTRING(Items_EarPlugs_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/hearing'>Hearing Wiki</a>";
        };
        class ACE_EntrenchingTool: ACE_Items_Base {
            logicalOrder = 11;
            displayName = CSTRING(Items_EntrenchingTool_DisplayName);
            displayNameShort = CSTRING(Items_EntrenchingTool_ShortName);
            description = CSTRING(Items_EntrenchingTool_Description);
        };
        class ACE_Flashlights: ACE_Items_Base {
            logicalOrder = 12;
            displayName = CSTRING(Items_Flashlights_DisplayName);
            displayNameShort = CSTRING(Items_Flashlights_ShortName);
            description = CSTRING(Items_Flashlights_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/flashlights'>Flashlights Wiki</a>";
        };
        class ACE_FortifyTool: ACE_Items_Base {
            logicalOrder = 13;
            displayName = CSTRING(Items_FortifyTool_DisplayName);
            displayNameShort = CSTRING(Items_FortifyTool_ShortName);
            description = CSTRING(Items_FortifyTool_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/fortify'>Fortify Wiki</a>";
        };
        class ACE_HuntIR_Monitor: ACE_Items_Base {
            logicalOrder = 14;
            displayName = CSTRING(Items_HuntIR_Monitor_DisplayName);
            displayNameShort = CSTRING(Items_HuntIR_Monitor_ShortName);
            description = CSTRING(Items_HuntIR_Monitor_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/huntir'>HuntIR Wiki</a>";
        };
        class ACE_IR_Strobe: ACE_Items_Base {
            logicalOrder = 15;
            displayName = CSTRING(Items_IR_Strobe_DisplayName);
            displayNameShort = CSTRING(Items_IR_Strobe_ShortName);
            description = CSTRING(Items_IR_Strobe_Description);
        };
        class ACE_Kestrel4500: ACE_Items_Base {
            logicalOrder = 16;
            displayName = CSTRING(Items_Kestrel4500_DisplayName);
            displayNameShort = CSTRING(Items_Kestrel4500_ShortName);
            description = CSTRING(Items_Kestrel4500_Description);
        };
        class ACE_MapTools: ACE_Items_Base {
            logicalOrder = 17;
            displayName = CSTRING(Items_MapTools_DisplayName);
            displayNameShort = CSTRING(Items_MapTools_ShortName);
            description = CSTRING(Items_MapTools_Description);
        };
        class ACE_MicroDAGR: ACE_Items_Base {
            logicalOrder = 18;
            displayName = CSTRING(Items_MicroDAGR_DisplayName);
            displayNameShort = CSTRING(Items_MicroDAGR_ShortName);
            description = CSTRING(Items_MicroDAGR_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/microdagr.html'>MicroDAGR Wiki</a>";
        };
        // Combine all range tables under one roof [mortar, artillery, rifle]
        class ACE_RangeTables: ACE_Items_Base {
            logicalOrder = 19;
            displayName = CSTRING(Items_RangeTables_DisplayName);
            displayNameShort = CSTRING(Items_RangeTables_ShortName);
            description = CSTRING(Items_RangeTables_Description);
        };
        class ACE_Ropes: ACE_Items_Base {
            logicalOrder = 20;
            displayName = CSTRING(Items_Ropes_DisplayName);
            displayNameShort = CSTRING(Items_Ropes_ShortName);
            description = CSTRING(Items_Ropes_Description);
        };
        class ACE_Sandbag: ACE_Items_Base {
            logicalOrder = 21;
            displayName = CSTRING(Items_Sandbag_DisplayName);
            displayNameShort = CSTRING(Items_Sandbag_ShortName);
            description = CSTRING(Items_Sandbag_Description);
        };
        class ACE_SpareBarrels: ACE_Items_Base {
            logicalOrder = 22;
            displayName = CSTRING(Items_SpareBarrels_DisplayName);
            displayNameShort = CSTRING(Items_SpareBarrels_ShortName);
            description = CSTRING(Items_SpareBarrels_Description);
        };
        class ACE_SprayPaint: ACE_Items_Base {
            logicalOrder = 23;
            displayName = CSTRING(Items_SprayPaint_DisplayName);
            displayNameShort = CSTRING(Items_SprayPaint_ShortName);
            description = CSTRING(Items_SprayPaint_Description);
            tip = "<a href='https://ace3.acemod.org/wiki/feature/tagging'>Tagging Wiki</a>";
        };
        class ACE_Tripod: ACE_Items_Base {
            logicalOrder = 24;
            displayName = CSTRING(Items_Tripod_DisplayName);
            displayNameShort = CSTRING(Items_Tripod_ShortName);
            description = CSTRING(Items_Tripod_Description);
        };
        class ACE_UAVBattery: ACE_Items_Base {
            logicalOrder = 25;
            displayName = CSTRING(Items_UAVBattery_DisplayName);
            displayNameShort = CSTRING(Items_UAVBattery_ShortName);
            description = CSTRING(Items_UAVBattery_Description);
        };
        class ACE_Wirecutter: ACE_Items_Base {
            logicalOrder = 26;
            displayName = CSTRING(Items_Wirecutter_DisplayName);
            displayNameShort = CSTRING(Items_Wirecutter_ShortName);
            description = CSTRING(Items_Wirecutter_Description);
        };
    };
    // ACE Field Rations
    class ACE_Field_Rations {
        displayName = CSTRING(Field_Rations_DisplayName);
        category = "ACE_FieldManual";

        class ACE_Field_Rations_Base {
            arguments[] = {
                // SELF INTERACT KEYBIND - %11
                "
                    private _localized = 'Self Interact Key';
                    if !(isNil {['ACE3 Common', 'ace_interact_menu_selfInteractKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_interact_menu_selfInteractKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // INTERACT KEYBIND - %12
                "
                    private _localized = 'Interact Key';
                    if !(isNil {['ACE3 Common', 'ace_interact_menu_interactKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_interact_menu_interactKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // MEDICAL MENU KEYBIND - %13
                "
                    private _localized = 'Medical Menu Key';
                    if !(isNil {['ACE3 Common', 'ace_medical_gui_openMedicalMenuKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_medical_gui_openMedicalMenuKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // PLACEHOLDERS FOR OTHER KEYBINDS - %14 - %20
                // EMPTY STRING - CANNOT BE NIL
                "''","''","''","''","''","''","''",

                // FORMATTING - >= %21
                // INDENT
                "'    '"
            };
            image = "\z\ace\addons\common\data\logo_ace3_ca.paa";
            tip = "<a href='https://ace3.acemod.org/wiki/framework/field-rations-framework'>Field Rations Wiki</a>";
        };

        class Hunger: ACE_Field_Rations_Base {
            logicalOrder = 1;
            displayName = CSTRING(Field_Rations_Hunger_DisplayName);
            displayNameShort = CSTRING(Field_Rations_Hunger_ShortName);
            description = CSTRING(Field_Rations_Hunger_Description);
        };
        class Thirst: ACE_Field_Rations_Base {
            logicalOrder = 2;
            displayName = CSTRING(Field_Rations_Thirst_DisplayName);
            displayNameShort = CSTRING(Field_Rations_Thirst_ShortName);
            description = CSTRING(Field_Rations_Thirst_Description);
        };
    };
    // ACE Medical
    class ACE_Medical_Treatment {
        displayName = "Medical Treatment";
        category = "ACE_FieldManual";

        class ACE_Medical_Treatment_Base {
            arguments[] = {
                // SELF INTERACT KEYBIND - %11
                "
                    private _localized = 'Self Interact Key';
                    if !(isNil {['ACE3 Common', 'ace_interact_menu_selfInteractKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_interact_menu_selfInteractKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // INTERACT KEYBIND - %12
                "
                    private _localized = 'Interact Key';
                    if !(isNil {['ACE3 Common', 'ace_interact_menu_interactKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_interact_menu_interactKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // MEDICAL MENU KEYBIND - %13
                "
                    private _localized = 'Medical Menu Key';
                    if !(isNil {['ACE3 Common', 'ace_medical_gui_openMedicalMenuKey'] call CBA_fnc_getKeybind}) then {
                        _localized = ['ACE3 Common', 'ace_medical_gui_openMedicalMenuKey'] call CBA_fnc_getKeybind select 8 select 0 call CBA_fnc_localizeKey;
                    };
                    _localized
                ",

                // PLACEHOLDERS FOR OTHER KEYBINDS - %14 - %20
                // EMPTY STRING - CANNOT BE NIL
                "''","''","''","''","''","''","''",

                // FORMATTING - >= %21
                // INDENT
                "'    '"
            };
            image = "\z\ace\addons\common\data\logo_ace3_ca.paa";
            tip = "<a href='https://ace3.acemod.org/wiki/feature/medical-system'>Medical Wiki</a>";
        };

        class ACE_Adenosine: ACE_Medical_Treatment_Base {
            logicalOrder = 1;
            displayName = CSTRING(Medical_Treatment_Adenosine_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_Adenosine_ShortName);
            description = CSTRING(Medical_Treatment_Adenosine_Description);
        };
        class ACE_Bandages: ACE_Medical_Treatment_Base {
            logicalOrder = 2;
            displayName = CSTRING(Medical_Treatment_Bandages_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_Bandages_ShortName);
            description = CSTRING(Medical_Treatment_Bandages_Description);
        };
        class ACE_Fluids: ACE_Medical_Treatment_Base {
            logicalOrder = 3;
            displayName = CSTRING(Medical_Treatment_IVFluids_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_IVFluids_ShortName);
            description = CSTRING(Medical_Treatment_IVFluids_Description);
        };
        class ACE_Epinephrine: ACE_Medical_Treatment_Base {
            logicalOrder = 4;
            displayName = CSTRING(Medical_Treatment_Epinephrine_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_Epinephrine_ShortName);
            description = CSTRING(Medical_Treatment_Epinephrine_Description);
        };
        class ACE_PAK: ACE_Medical_Treatment_Base {
            logicalOrder = 5;
            displayName = CSTRING(Medical_Treatment_PAK_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_PAK_ShortName);
            description = CSTRING(Medical_Treatment_PAK_Description);
        };
        class ACE_Splint: ACE_Medical_Treatment_Base {
            logicalOrder = 6;
            displayName = CSTRING(Medical_Treatment_Splint_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_Splint_ShortName);
            description = CSTRING(Medical_Treatment_Splint_Description);
        };
        class ACE_SurgicalKit: ACE_Medical_Treatment_Base {
            logicalOrder = 7;
            displayName = CSTRING(Medical_Treatment_SurgicalKit_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_SurgicalKit_ShortName);
            description = CSTRING(Medical_Treatment_SurgicalKit_Description);
        };
        class ACE_Tourniquet: ACE_Medical_Treatment_Base {
            logicalOrder = 8;
            displayName = CSTRING(Medical_Treatment_CAT_DisplayName);
            displayNameShort = CSTRING(Medical_Treatment_CAT_ShortName);
            description = CSTRING(Medical_Treatment_CAT_Description);
        };
    };
};
