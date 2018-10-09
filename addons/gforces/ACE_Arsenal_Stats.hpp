class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_gReduction: statBase {
        scope = 2;
        priority = 1;
        stats[] = {"ACE_GForceCoef"};
        displayName = CSTRING(statGReduction);
        showBar = 1;
        barStatement = QUOTE([ARR_3((_this select 0) select 0, _this select 1, [ARR_3([ARR_2(1, 0)], [ARR_2(0.01, 1)], false)])] call EFUNC(arsenal,statBarStatement_default));
        condition = QUOTE(getNumber (_this select 1 >> (_this select 0) select 0) > 0);
        tabs[] = {{3}, {}};
    };
};
