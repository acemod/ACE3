class GVAR(stats) {
    class statBase {
        scope = 1;
        priority = 0;
        stats[] = {};
        displayName = "";
        showBar = 0;
        showText = 0;
        barStatement = "";
        textStatement = "";
        condition = "true";
        tabs[] = {{}, {}};
    };
    class ACE_bananaPotassium: statBase {
        scope = 2;
        displayName= CSTRING(statPotassium);
        showBar = 1;
        barStatement = "1";
        condition = QUOTE((configName (_this select 1)) == 'ACE_Banana');
        tabs[] = {{}, {7}};
    };
    class ACE_mass: statBase {
        scope = 2;
        displayName= "$STR_a3_rscdisplayarsenal_stat_weight";
        showText = 1;
        textStatement = QUOTE([ARR_2(_this select 0, _this select 1)] call FUNC(statTextStatement_mass));
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}, {0,1,2,3,4,5,6,7}};
    };
    class ACE_rateOfFire: statBase {
        scope = 2;
        priority = 5;
        stats[] = {"reloadTime"};
        displayName= "$STR_a3_rscdisplayarsenal_stat_rof";
        showBar = 1;
        showText = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_2([ARR_2(-1.4, 0.31)], [ARR_2(1, 0.01)])])] call FUNC(statBarStatement_rateOfFIre));
        textStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_2([ARR_2(-1.4, 0.31)], false)])] call FUNC(statTextStatement_rateOfFire));
        tabs[] = {{0,1}, {}};
    };
    class ACE_accuracy: statBase {
        scope = 2;
        priority = 4;
        stats[] = {"dispersion"};
        displayName = "$STR_a3_rscdisplayarsenal_stat_dispersion";
        showBar = 1;
        showText = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(-4, -1.7)], [ARR_2(1, 0.01)], true)])] call FUNC(statBarStatement_accuracy));
        textStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_2([ARR_2(-4, -1.7)], false)])] call FUNC(statTextStatement_accuracy));
        tabs[] = {{0,1}, {}};
    };
    class ACE_maxZeroing: statBase {
        scope = 2;
        priority = 3;
        stats[] = {"maxZeroing"};
        displayName = "$STR_a3_rscdisplayarsenal_stat_range";
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(0, 2500)], [ARR_2(0.01, 1)], false)])] call FUNC(statBarStatement_default));
        tabs[] = {{0,1,2}, {}};
    };
    class ACE_impact: statBase {
        scope = 2;
        priority = 2;
        stats[] = {"hit", "initSpeed"};
        displayName = "$STR_a3_rscdisplayarsenal_stat_impact";
        showBar = 1;
        barStatement = QUOTE([ARR_3(_this select 0, _this select 1, [ARR_3([ARR_2(0, 3.2)], [ARR_2(-1, 1100)], 2006)])] call FUNC(statBarStatement_impact));
        tabs[] = {{0,1,2}, {}};
    };
    class ACE_scopeMagnification: statBase {
        scope = 2;
        priority = 2;
        displayName = CSTRING(statMagnification);
        showText = 1;
        textStatement = QUOTE(call FUNC(statTextStatement_scopeMag));
        tabs[] = {{}, {0}};
    };
    class ACE_scopeVisionMode: statBase {
        scope = 2;
        priority = 1;
        displayName = CSTRING(statVisionMode);
        showText = 1;
        textStatement = QUOTE(call FUNC(statTextStatement_scopeVisionMode));
        tabs[] = {{}, {0}};
    };
    class ACE_ballisticProtection: statBase {
        scope = 2;
        priority = 5;
        stats[] = {"passthrough"};
        displayName = "$STR_a3_rscdisplayarsenal_stat_passthrough";
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(0, 0.63)], [ARR_2(0.01, 1)], false)])] call FUNC(statBarStatement_default));
        tabs[] = {{3,4,6}, {}};
    };
    class ACE_explosiveResistance: statBase {
        scope = 2;
        priority = 4;
        stats[] = {"armor"};
        displayName = "$STR_a3_rscdisplayarsenal_stat_armor";
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(0, 0.80)], [ARR_2(0.01, 1)], false)])] call FUNC(statBarStatement_default));
        tabs[] = {{3,4,6}, {}};
    };
    class ACE_load: statBase {
        scope = 2;
        priority = 3;
        stats[] = {"maximumLoad"};
        displayName = "$STR_a3_rscdisplayarsenal_stat_load";
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(0, 500)], [ARR_2(0.01, 1)], false)])] call FUNC(statBarStatement_default));
        tabs[] = {{3,4,5}, {}};
    };
    class ACE_smokeChemTTL: statBase {
        scope =  2;
        priority = 3;
        stats[] = {"ammo"};
        displayName = CSTRING(statTTL);
        showText = 1;
        textStatement= QUOTE(call FUNC(statTextStatement_smokeChemTTL));
        condition = QUOTE((configName (_this select 1)) isKindOf [ARR_2('smokeShell', configFile >> 'CfgMagazines')]);
        tabs[] = {{}, {5}};
    };
};
