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
        displayName = CSTRING(filterARifleText);
        tabs[] = {{0}, {}};
        statement = QUOTE([ARR_2(_this, 'arifle')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeSRifle: filterBase {
        scope = 2;
        displayName = CSTRING(filterSRifleText);
        tabs[] = {{0}, {}};
        statement = QUOTE([ARR_2(_this, 'srifle')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeMG: filterBase {
        scope = 2;
        displayName = CSTRING(filterMGText);
        tabs[] = {{0}, {}};
        statement = QUOTE([ARR_2(_this, 'mg')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeHGun: filterBase {
        scope = 2;
        displayName = CSTRING(filterHGunText);
        tabs[] = {{1}, {}};
        statement = QUOTE([ARR_2(_this, 'hgun')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeMissile: filterBase {
        scope = 2;
        displayName = CSTRING(filterMissileText);
        tabs[] = {{2}, {}};
        statement = QUOTE([ARR_2(_this, 'missile')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeRocket: filterBase {
        scope = 2;
        displayName = CSTRING(filterRocketText);
        tabs[] = {{2}, {}};
        statement = QUOTE([ARR_2(_this, 'rocket')] call FUNC(filterStatement_weaponType));
    };

    class ACE_weaponTypeOther: filterBase {
        scope = 2;
        displayName = CSTRING(filterOtherText);
        tabs[] = {{0,1,2}, {}};
        statement = QUOTE([ARR_2(_this, 'other')] call FUNC(filterStatement_weaponType));
    };

    class ACE_backpackTypeBag: filterBase {
        scope = 2;
        displayName = CSTRING(filterBagText);
        tabs[] = {{5}, {}};
        statement = QUOTE([ARR_2(_this, 'bag')] call FUNC(filterStatement_backpackType));
    };

    class ACE_backpackTypeDeployable: filterBase {
        scope = 2;
        displayName = CSTRING(filterDeployableText);
        tabs[] = {{5}, {}};
        statement = QUOTE([ARR_2(_this, 'deployable')] call FUNC(filterStatement_backpackType));
    };

    class ACE_backpackTypeOther: filterBase {
        scope = 2;
        displayName = CSTRING(filterOtherText);
        tabs[] = {{5}, {}};
        statement = QUOTE([ARR_2(_this, 'other')] call FUNC(filterStatement_backpackType));
    };
};
