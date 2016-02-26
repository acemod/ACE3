class ACE_Settings {
    class GVAR(zeusAscension) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(zeusBird) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(remoteWind) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(radioOrdnance) {
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(revealMines) {
        typeName = "SCALAR";
        value = 0;
        values[] = {"$STR_A3_OPTIONS_DISABLED", CSTRING(revealMines_partial), CSTRING(revealMines_full)};
    };
    class GVAR(autoAddObjects) {
        displayName = CSTRING(AddObjectsToCurator);
        description = CSTRING(AddObjectsToCurator_desc);
        value = 0;
        typeName = "BOOL";
    };

    class GVAR(aiSkill_set) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: Master Enable";
        typeName = "BOOL";
        value = 0;
    };
    class GVAR(aiSkill_general) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: general,commanding,courage";
        typeName = "SCALAR";
        value = 0.5;
    };
    class GVAR(aiSkill_aimingAccuracy) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: aimingAccuracy";
        typeName = "SCALAR";
        value = 0.5;
    };
    class GVAR(aiSkill_weaponHandling) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: aimingShake,aimingSpeed,reloadSpeed";
        typeName = "SCALAR";
        value = 0.5;
    };
    class GVAR(aiSkill_spotting) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: spotDistance,spotTime";
        typeName = "SCALAR";
        value = 0.5;
    };
    class GVAR(aiSkill_COVER) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: AI Seek Cover";
        typeName = "BOOL";
        value = 1;
    };
    class GVAR(aiSkill_AUTOCOMBAT) {
        category = QUOTE(PREFIX);
        displayName = "Global AI Set Skill: Ai Switch To Combat Mode";
        typeName = "BOOL";
        value = 1;
    };
};
