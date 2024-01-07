class EGVAR(arsenal,stats) {
    class statBase;
    class ACE_allowSwapBarrel: statBase {
        scope = 2;
        priority = -1;
        stats[] = {QGVAR(allowSwapBarrel)};
        displayName = CSTRING(statBarrelType);
        showText = 1;
        textStatement = QUOTE(call FUNC(statTextStatement_allowSwapBarrel));
        tabs[] = {{0,1}, {}};
    };
    class ACE_boltType: statBase {
        scope = 2;
        priority = -1.1;
        stats[] = {QGVAR(closedBolt)};
        displayName = CSTRING(statBoltType);
        showText = 1;
        textStatement = QUOTE(call FUNC(statTextStatement_boltType));
        tabs[] = {{0,1}, {}};
    };
};
