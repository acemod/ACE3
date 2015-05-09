class ACE_Settings {
    class GVAR(Enabled) {
        value = 2;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_VehicleDamage";
        description = "$STR_ACE_VehicleDamage_Desc";
        values[] = {"Off", "Player Only", "Player and AI"};
    };
    
    class GVAR(level) {
        value = 0;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_ACE_VehicleDamage_level";
        description = "$STR_ACE_VehicleDamage_level_Desc";
        values[] = { "Realistic", "Video Game", "Rambo" };
    };
    
    class GVAR(advancedMaterials) {
        value = 1;
        typeName = "BOOL";
        displayName = "$STR_ACE_VehicleDamage_advancedMaterials";
        description = "$STR_ACE_VehicleDamage_advancedMaterials_Desc";
    };
    
    class GVAR(advancedHitpoints) {
        value = 1;
        typeName = "BOOL";
        displayName = "$STR_ACE_VehicleDamage_advancedHitpoints";
        description = "$STR_ACE_VehicleDamage_advancedHitpoints_Desc";
    };
    
    class GVAR(enableCookoff) {
        value = 1;
        typeName = "BOOL";
        displayName = "$STR_ACE_VehicleDamage_enableCookoff";
        description = "$STR_ACE_VehicleDamage_enableCookoff_Desc";
    };
    
    class GVAR(enableCrewKills) {
        value = 1;
        typeName = "BOOL";
        displayName = "$STR_ACE_VehicleDamage_enableCrewKills";
        description = "$STR_ACE_VehicleDamage_enableCrewKills_Desc";
    };
    
    class GVAR(persistDamage) {
        value = 1;
        typeName = "BOOL";
        displayName = "$STR_ACE_VehicleDamage_persistDamage";
        description = "$STR_ACE_VehicleDamage_persistDamage_Desc";
    };
    
    class GVAR(reactiveArmor) {
        value = 1;
        typeName = "BOOL";
        displayName = "$STR_ACE_VehicleDamage_reactiveArmor";
        description = "$STR_ACE_VehicleDamage_reactiveArmor_Desc";
    };
};