class GVAR(sorts) {
    class sortBase {
        scope = 1;
        displayName = "";
        tabs[] = {{}, {}};
        statement = "";
    };

    // Special case in sortPanel
    class ACE_alphabetically: sortBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_sort_alphabet";
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}, {0,1,2,3,4,5,6,7}};
        statement = QUOTE(getText (_this >> 'displayName'));
    };

    class ACE_mod: sortBase {
        scope = 2;
        displayName = "$STR_a3_rscdisplayarsenal_sort_mod";
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}, {0,1,2,3,4,5,6,7}};
        statement = QUOTE(getText (_this >> 'dlc'));
    };

    class ACE_mass: sortBase {
        scope = 2;
        displayName = "Sort by weight";
        tabs[] = {{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14}, {}};
        statement = QUOTE(_this call FUNC(sortStatement_mass));
    };

    class ACE_load: sortBase {
        scope = 2;
        displayName = "Sort by load";
        tabs[] = {{3,4,5}, {}};
        statement = QUOTE(getContainerMaxLoad configName _this);
    };

    class ACE_rateOfFire: sortBase {
        scope = 2;
        displayName = "Sort by rate of fire";
        tabs[] = {{0,1,2}, {}};
        statement = QUOTE(_this call FUNC(sortStatement_rateOfFire));
    };
};
