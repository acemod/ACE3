class CfgVehicles {
    class All;
    class LaserTarget: All {
        // @TODO: Changing the model and simulation hides it, but THEN IT DOESNT SPAWN WTF!?
        // model = "\A3\Weapons_F\empty.p3d";

        class EventHandlers {
            class ADDON {
                init = QUOTE(_this call FUNC(handleLaserTargetCreation));
            };
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_ToggleMarkerLaser {
                    displayName = CSTRING(laserMarkToggle);
                    condition = QUOTE('Laserdesignator' in weapons ACE_player);
                    statement = QUOTE( ARR_1(ACE_player) call FUNC(toggleMarkerHand));
                    showDisabled = 0;
                    exceptions[] = {"isNotSwimming"};
                };
            };
        };
    };
};
