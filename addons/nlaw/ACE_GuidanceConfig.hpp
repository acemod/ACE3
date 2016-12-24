class EGVAR(missileguidance,AttackProfiles) {
    class GVAR(directAttack) {
        functionName = QFUNC(attackProfile);
    };
    class GVAR(overflyTopAttack): GVAR(directAttack) {};
};
class EGVAR(missileguidance,SeekerTypes) {
    class GVAR(seeker) {
        functionName = QFUNC(seeker);
    };
};
