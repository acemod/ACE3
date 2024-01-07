class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_boltType: statBase {
        scope = 2;
        priority = 2;
        stats[] = {"boltType"};
        displayName = CSTRING(statBoltType);
        showText = 1;
        textStatement = QUOTE(call FUNC(statTextStatement_boltType));
        tabs[] = {{0,1}, {}};
    };
};
