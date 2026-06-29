class CBA_Extended_EventHandlers;

class CfgVehicles {
    // Backpack device
    class Bag_Base;
    class GVAR(backpack): Bag_Base {
        scope = 2;
        displayName = CSTRING(backpack_displayName);
        author = ECSTRING(common,aceteam);
        model = QPATHTOF(data\ace_antennaBackpack);
        maximumLoad = 50;
        mass = 100;
    };

    // Device:
    class Items_base_F;
    class ACE_transmitter_base: Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {}; // enable XEH
        };
        author = ECSTRING(common,aceteam);
        model = "\A3\Structures_F\Items\Tools\MultiMeter_F.p3d";
        scope = 1;
    };
    class ACE_transmitter_406MHz: ACE_transmitter_base {
        displayName = CSTRING(locatorBeacon406);
        GVAR(freq) = 406;
        GVAR(power) = 5000;
    };

    // Self interactions
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(open) { // Opens the interactive dialog
                    displayName = CSTRING(openRDF);
                    condition = QUOTE(_player call FUNC(displayCondition));
                    // open with execNextFrame to prevent problems with interaction menu closing dialog
                    statement = QUOTE([ARR_2(FUNC(toggleDisplayMode),[DISPLAY_MODE_DIALOG])] call CBA_fnc_execNextFrame);
                    // icon = QPATHTOF(UI\icon_android.paa);
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    class GVAR(show) { // Opens the display
                        displayName = "$STR_DISP_SHOW";
                        condition = QUOTE(GVAR(currentShowMode) != DISPLAY_MODE_DISPLAY);
                        statement = QUOTE([DISPLAY_MODE_DISPLAY] call FUNC(toggleDisplayMode));
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                    class GVAR(hide) {
                        displayName = "$STR_DISP_HIDE";
                        condition = QUOTE(GVAR(currentShowMode) != DISPLAY_MODE_CLOSED);
                        statement = QUOTE([DISPLAY_MODE_CLOSED] call FUNC(toggleDisplayMode));
                        exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                    };
                };
            };
        };
    };
};
