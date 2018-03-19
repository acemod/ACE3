class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_hearingProtection: statBase {
        scope = 2;
        priority = 2;
        stats[] = {QGVAR(protection)};
        displayName= CSTRING(statHearingProtection);
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(0, 1)], [ARR_2(0.01, 1)], false)])] call EFUNC(arsenal,statBarStatement_default));
        tabs[] = {{6}, {}};
    };
    class ACE_volumeMuffling: statBase {
        scope = 2;
        priority = 1;
        stats[] = {QGVAR(lowerVolume)};
        displayName= CSTRING(statHearingLowerVolume);
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(0, 1)], [ARR_2(0.01, 1)], false)])] call EFUNC(arsenal,statBarStatement_default));
        tabs[] = {{6}, {}};
    };
};
