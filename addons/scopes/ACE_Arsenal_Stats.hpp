class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_scopeHorizontalLimits: statBase {
        scope = 2;
        priority = 3;
        stats[] = {"ACE_ScopeAdjust_Horizontal", "ACE_ScopeAdjust_HorizontalIncrement"};
        displayName = CSTRING(statHorizontalLimits);
        showText = 1;
        textStatement = QUOTE(params[ARR_2('_stat','_config')]; private _limits = getArray (_config >> _stat select 0); format [ARR_4('%1 / %2 MIL (∆ %3 MIL)', _limits select 0, _limits select 1, getNumber (_config >> _stat select 1))]);
        condition = QUOTE(params[ARR_2('_stat', '_config')]; !((getArray (_config >> _stat select 0)) isEqualTo []));
        tabs[] = {{}, {0}};
    };
    class ACE_scopeVerticalLimits: ACE_scopeHorizontalLimits {
        stats[] = {"ACE_ScopeAdjust_Vertical", "ACE_ScopeAdjust_VerticalIncrement"};
        priority = 2;
        displayName = CSTRING(statVerticalLimits);
    };
};
