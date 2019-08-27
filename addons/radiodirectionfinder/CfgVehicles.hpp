class CBA_Extended_EventHandlers;

class CfgVehicles {
    // Backpack device
    class Bag_Base;
    class GVAR(backpack): Bag_Base {
        scope = 2;
        displayName = "PRD-13 Radio Direction Finder";
        author = "PabstMirror";
        model = "z\ace\addons\radiodirectionfinder\data\ace_antennaBackpack";
        maximumLoad = 50;
        mass = 100;
    };

    // Device:
    class Items_base_F;
    class ACE_transmitter_base: Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        author = ECSTRING(common,aceteam);
        model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
        scope = 1;
    };
    class ACE_transmitter_406MHz: ACE_transmitter_base {
        displayName = "Transmitter 406MHz";
        GVAR(freq) = 406;
        GVAR(power) = 5000;
    };

    // Self interactions
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) {
                    //Opens the dialog
                    // displayName = CSTRING(configure);
                    displayName = "open";
                    condition = QUOTE(_player call FUNC(displayCondition));
                    statement = QUOTE([DISPLAY_MODE_DIALOG] call FUNC(toggleDisplayMode));
                    // icon = QPATHTOF(UI\icon_android.paa);
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    class GVAR(show) {
                        //Opens the mini map
                        // displayName = CSTRING(show);
                        displayName = "Show";
                        condition = QUOTE(GVAR(currentShowMode) != DISPLAY_MODE_DISPLAY);
                        statement = QUOTE([DISPLAY_MODE_DISPLAY] call FUNC(toggleDisplayMode));
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                    class GVAR(close) {
                        // displayName = CSTRING(closeUnit);
                        displayName = "Close";
                        condition = QUOTE(GVAR(currentShowMode) != DISPLAY_MODE_CLOSED);
                        statement = QUOTE([DISPLAY_MODE_CLOSED] call FUNC(toggleDisplayMode));
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                };
            };
        };
    };
};
