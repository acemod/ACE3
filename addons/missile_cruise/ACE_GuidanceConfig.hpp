class EGVAR(missileguidance,SeekerTypes) {
    class Waypoint {
        name = "";
        visualName = "";
        description = "";

        onFired = QFUNC(seeker_onFired);
        functionName = QFUNC(seeker);
    };
};

class EGVAR(missileguidance,NavigationTypes) {
    class Waypoint {
        functionName = QFUNC(navigation);
        onFired = QFUNC(navigation_onFired);
    };
};

