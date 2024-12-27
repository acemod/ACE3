class EGVAR(missileguidance,AttackProfiles) {
    class GVAR(directAttack) {
        name = CSTRING(directAttack);
        functionName = QFUNC(attackProfile);
    };
    class GVAR(overflyTopAttack): GVAR(directAttack) {
        name = CSTRING(overflyTopAttack);
    };
};
class EGVAR(missileguidance,SeekerTypes) {
    class GVAR(seeker) {
        functionName = QFUNC(seeker);
    };
};
class EGVAR(missileguidance,NavigationTypes) {
    class GVAR(PLOS) {
        functionName = QFUNC(navigation);
        onFired = QFUNC(navigation_onFired);
    };
};
