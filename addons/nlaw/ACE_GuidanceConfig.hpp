class EGVAR(missileguidance,AttackProfiles) {
    class GVAR(directAttack) {
        name = "Direct Attack";
        functionName = QFUNC(attackProfile);
    };
    class GVAR(overflyTopAttack): GVAR(directAttack) {
        name = "Overfly Top Attack";
    };
};
class EGVAR(missileguidance,SeekerTypes) {
    class GVAR(seeker) {
        functionName = QFUNC(seeker);
    };
};
