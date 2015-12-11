class CfgVehicles {

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ADDON {
                displayName = CSTRING(Gestures);
                condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                statement = "";
                showDisabled = 1;
                priority = 3.5;
                icon = PATHTOF(UI\gestures_ca.paa);
                
                class GVAR(Advance) {
                    displayName = CSTRING(BIgestureAdvance);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureAdvance';);
                    showDisabled = 1;
                    priority = 1.9;
                };
                class GVAR(Go) {
                    displayName = CSTRING(BIgestureGo);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_2('gestureGo','gestureGoB')] select floor random 2););
                    showDisabled = 1;
                    priority = 1.8;
                };
                class GVAR(Follow) {
                    displayName = CSTRING(BIgestureFollow);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureFollow';);
                    showDisabled = 1;
                    priority = 1.7;
                };
                class GVAR(Up) {
                    displayName = CSTRING(BIgestureUp);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureUp';);
                    showDisabled = 1;
                    priority = 1.5;
                };
                class GVAR(CeaseFire) {
                    displayName = CSTRING(BIgestureCeaseFire);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureCeaseFire';);
                    showDisabled = 1;
                    priority = 1.3;
                };
                class GVAR(Freeze) {
                    displayName = CSTRING(BIgestureFreeze);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureFreeze';);
                    showDisabled = 1;
                    priority = 1.2;
                };
                class GVAR(Forward) {
                    displayName = CSTRING(forward);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(forward)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.9;
                };
                class GVAR(Regroup) {
                    displayName = CSTRING(regroup);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(regroup)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.8;
                };
                class GVAR(Stop) {
                    displayName = CSTRING(stop);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(stop)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.7;
                };
                class GVAR(Cover) {
                    displayName = CSTRING(cover);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(cover)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.6;
                };
                class GVAR(Point) {
                    displayName = CSTRING(point);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(point)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.5;
                };
                class GVAR(Engage) {
                    displayName = CSTRING(engage);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(engage)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.4;
                };
                class GVAR(Hold) {
                    displayName = CSTRING(hold);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(hold)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.3;
                };
                class GVAR(Warning) {
                    displayName = CSTRING(warning);
                    condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                    statement = QUOTE(QUOTE(QGVAR(warning)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.2;
                };
                /*
                class class GVAR(Yes) {
                    displayName = ECSTRING(common,Yes);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_2('gestureYes','gestureNod')] select floor random 2););
                    showDisabled = 1;
                    priority = 1.1;
                    hotkey = "8";
                };

                class class GVAR(No) {
                    displayName = ECSTRING(common,No);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow 'gestureNo';);
                    showDisabled = 1;
                    priority = 1.0;
                    hotkey = "9";
                };

                class class GVAR(Hi) {
                    displayName = CSTRING(Gestures_Hi);
                    condition = QUOTE(canStand _target);
                    statement = QUOTE(_target playActionNow ([ARR_3('gestureHi','gestureHiB','gestureHiC')] select floor random 3););
                    showDisabled = 1;
                    priority = 0.9;
                    hotkey = "0";
                };
                */

            };

        };
    };
};
