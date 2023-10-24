class GVAR(filters) {
    class filterBase {
        scope = 1;
        displayName = "";
        tabs[] = {{}, {}};
        statement = "";
        condition = QUOTE(true);
    };

    class ACE_weaponTypeARifle: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeARifle";
        tabs[] = {{0}, {}};
        statement = QUOTE([ARR_2(_this, 'arifle')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeSRifle: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeSRifle";
        tabs[] = {{0}, {}};
        statement = QUOTE([ARR_2(_this, 'srifle')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeMG: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeMG";
        tabs[] = {{0}, {}};
        statement = QUOTE([ARR_2(_this, 'mg')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeHGun: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeHGun";
        tabs[] = {{1}, {}};
        statement = QUOTE([ARR_2(_this, 'hgun')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeMissile: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeMissile";
        tabs[] = {{2}, {}};
        statement = QUOTE([ARR_2(_this, 'missile')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeRocket: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeRocket";
        tabs[] = {{2}, {}};
        statement = QUOTE([ARR_2(_this, 'rocket')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeOther: filterBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_filter_weaponTypeOther";
        tabs[] = {{0,1,2}, {}};
        statement = QUOTE([ARR_2(_this, 'other')] call FUNC(filterStatement_weaponType));
    };
};
