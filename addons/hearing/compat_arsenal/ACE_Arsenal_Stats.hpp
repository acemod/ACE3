class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_hearingProtection: statBase {
        scope = 2;
        priority = 2;
        stats[] = {QGVAR(protection), QGVAR(hasEHP)};
        displayName = CSTRING(statHearingProtection);
        showBar = 1;
        condition = QUOTE([ARR_2(_this select 0,_this select 1)] call EFUNC(arsenal,statCondition_existsAny));
        barStatement = QUOTE([ARR_2(_this select 0,_this select 1)] call FUNC(statBarStatement_hearingProtection));
        showText = 1;
        textStatement = QUOTE(_this select 1 call FUNC(statTextStatement_hearingProtection));
        tabs[] = {{6, 7}, {}};
    };
    class ACE_volumeMuffling: statBase {
        scope = 2;
        priority = 1.75;
        stats[] = {QGVAR(lowerVolume)};
        displayName = CSTRING(statHearingLowerVolume);
        showBar = 1;
        condition = QUOTE([ARR_2(_this select 0,_this select 1)] call EFUNC(arsenal,statCondition_existsAll));
        barStatement = QUOTE([ARR_3((_this select 0) select 0,_this select 1,[ARR_3([ARR_2(0,1)],[ARR_2(0.01,1)],false)])] call EFUNC(arsenal,statBarStatement_default));
        tabs[] = {{6, 7}, {}};
    };
};
