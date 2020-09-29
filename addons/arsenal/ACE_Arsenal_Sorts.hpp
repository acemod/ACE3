class GVAR(sorts) {
    class sortBase {
        scope = 1;
        displayName = "";
        tabs[] = {{}, {}};
        statement = "";
    };

    class ACE_alphabetically: sortBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_sort_alphabet";
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}, {0,1,2,3,4,5,6,7}};
        statement = QUOTE({});
    };

    class ACE_mod: sortBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_sort_mod";
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17}, {0,1,2,3,4,5,6,7}};
        statement = QUOTE(_this call FUNC(sortStatement_mod));
    };

    class ACE_mass: sortBase {
        scope = 2;
        displayName = CSTRING(sortByWeightText);
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}, {0,1,2,3,4,5,6,7}};
        statement = QUOTE(_this call FUNC(sortStatement_mass));
    };

    class ACE_load: sortBase {
        scope = 2;
        displayName = CSTRING(sortByLoadText);
        tabs[] = {{3,4,5}, {}};
        statement = QUOTE(getContainerMaxLoad configName _this);
    };

    class ACE_accuracy: sortBase {
        scope = 2;
        displayName = CSTRING(sortByAccuracyText);
        tabs[] = {{0,1}, {}};
        statement = QUOTE(_this call FUNC(sortStatement_accuracy));
    };

    class ACE_rateOfFire: sortBase {
        scope = 2;
        displayName = CSTRING(sortByRateOfFireText);
        tabs[] = {{0,1}, {}};
        statement = QUOTE(_this call FUNC(sortStatement_rateOfFire));
    };

    class ACE_scopeMag: sortBase {
        scope = 2;
        displayName = CSTRING(sortByMagnificationText);
        tabs[] = {{}, {0}};
        statement = QUOTE(_this call FUNC(sortStatement_scopeMag));
    };

    class ACE_magCount: sortBase {
        scope = 2;
        displayName = CSTRING(sortByMagCountText);
        tabs[] = {{}, {4}};
        statement = QUOTE(_this call FUNC(sortStatement_magCount));
    };
};
