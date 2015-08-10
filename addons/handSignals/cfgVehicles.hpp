class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_extraGestures {
                displayName = CSTRING(DISPLAYNAME);
                condition = QUOTE(canStand _target && GVAR(ReloadMutex));
                showDisabled = 1;
                priority = 3.4;
                icon = QUOTE(PATHTOF(UI\gestures_plus_ca.paa));
                hotkey = "B";
                class ACE_Gesture_Forward {
                    displayName = CSTRING(FORWARD);
                    statement = QUOTE(QUOTE(QGVAR(FORWARD)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.9;
                    hotkey = "1";
                };

                class ACE_Gesture_Regroup {
                    displayName = CSTRING(REGROUP);
                    statement = QUOTE(QUOTE(QGVAR(REGROUP)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.8;
                    hotkey = "2";
                };

                class ACE_Gesture_Stop {
                    displayName = CSTRING(STOP);
                    statement = QUOTE(QUOTE(QGVAR(STOP)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.7;
                    hotkey = "3";
                };

                class ACE_Gesture_Cover {
                    displayName = CSTRING(COVERS);
                    statement = QUOTE(QUOTE(QGVAR(COVERS)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.6;
                    hotkey = "4";
                };

                class ACE_Gesture_Point {
                    displayName = CSTRING(POINT);
                    statement = QUOTE(QUOTE(QGVAR(POINT)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.5;
                    hotkey = "5";
                };

                class ACE_Gesture_Engage {
                    displayName = CSTRING(ENGAGE);
                    statement = QUOTE(QUOTE(QGVAR(ENGAGE)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.4;
                    hotkey = "5";
                };

                class ACE_Gesture_Hold {
                    displayName = CSTRING(HOLD);
                    statement = QUOTE(QUOTE(QGVAR(HOLD)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.3;
                    hotkey = "6";
                };

                class ACE_Gesture_Warning {
                    displayName = CSTRING(WARNING);
                    statement = QUOTE(QUOTE(QGVAR(WARNING)) call FUNC(playSignal));
                    showDisabled = 1;
                    priority = 1.2;
                    hotkey = "7";
                };
            };
        };
    };
};
