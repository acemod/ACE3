class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(Gestures);
                condition = QUOTE((canStand _target) && {GVAR(showOnInteractionMenu) == 2});
                statement = "";
                exceptions[] = {"isNotSwimming"};
                showDisabled = 1;
                priority = 3.5;
                icon = QPATHTOF(UI\gestures_ca.paa);

                class GVAR(Advance) {
                    displayName = CSTRING(Advance);
                    condition = QUOTE(true);
                    statement = QUOTE([ARR_2(_target,'gestureAdvance')] call EFUNC(common,doGesture));
                    //exceptions[] = {"isNotSwimming"}; // Does not work underwaterexceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.9;
                };
                class GVAR(Go) {
                    displayName = CSTRING(Go);
                    condition = QUOTE(true);
                    statement = QUOTE([ARR_2(_target,selectRandom [ARR_2('gestureGo','gestureGoB')])] call EFUNC(common,doGesture));
                    //exceptions[] = {"isNotSwimming"}; // Does not work underwater
                    showDisabled = 1;
                    priority = 1.8;
                };
                class GVAR(Follow) {
                    displayName = CSTRING(Follow);
                    condition = QUOTE(true);
                    statement = QUOTE([ARR_2(_target,'gestureFollow')] call EFUNC(common,doGesture));
                    //exceptions[] = {"isNotSwimming"}; // Does not work underwater
                    showDisabled = 1;
                    priority = 1.7;
                };
                class GVAR(Up) {
                    displayName = CSTRING(Up);
                    condition = QUOTE(true);
                    statement = QUOTE([ARR_2(_target,'gestureUp')] call EFUNC(common,doGesture));
                    //exceptions[] = {"isNotSwimming"}; // Does not work underwater
                    showDisabled = 1;
                    priority = 1.5;
                };
                class GVAR(CeaseFire) {
                    displayName = CSTRING(CeaseFire);
                    condition = QUOTE(true);
                    statement = QUOTE([ARR_2(_target,'gestureCeaseFire')] call EFUNC(common,doGesture));
                    //exceptions[] = {"isNotSwimming"}; // Does not work underwater
                    showDisabled = 1;
                    priority = 1.3;
                };
                class GVAR(Stop) {
                    displayName = CSTRING(Stop);
                    condition = QUOTE(true);
                    statement = QUOTE([ARR_2(_target,'gestureFreeze')] call EFUNC(common,doGesture)); // BI animation - is actually "stop" in all stances but prone
                    //exceptions[] = {"isNotSwimming"}; // Does not work underwater
                    showDisabled = 1;
                    priority = 1.2;
                };
                class GVAR(Forward) {
                    displayName = CSTRING(Forward);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(forward)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.9;
                };
                class GVAR(Regroup) {
                    displayName = CSTRING(Regroup);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(regroup)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.8;
                };
                class GVAR(Freeze) {
                    displayName = CSTRING(Freeze);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(freeze)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.7;
                };
                class GVAR(Cover) {
                    displayName = CSTRING(Cover);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(cover)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.6;
                };
                class GVAR(Point) {
                    displayName = CSTRING(Point);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(point)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.5;
                };
                class GVAR(Engage) {
                    displayName = CSTRING(Engage);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(engage)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.4;
                };
                class GVAR(Hold) {
                    displayName = CSTRING(Hold);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(hold)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.3;
                };
                class GVAR(Warning) {
                    displayName = CSTRING(Warning);
                    condition = QUOTE(true);
                    statement = QUOTE(QUOTE(QGVAR(warning)) call FUNC(playSignal));
                    exceptions[] = {"isNotSwimming"};
                    showDisabled = 1;
                    priority = 1.2;
                };
            };
        };
    };
};
