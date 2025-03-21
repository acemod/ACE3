class CfgVehicles {
    class All;
    class LaserTarget: All {
        // @TODO: Changing the model and simulation hides it, but THEN IT DOESNT SPAWN WTF!?
        // model = "\A3\Weapons_F\empty.p3d";

        class EventHandlers {
            class ADDON {
                init = QUOTE(call FUNC(handleLaserTargetCreation));
            };
        };
    };
    class ACE_Module;
    class GVAR(testLaser): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = "[DEV] Laser Source (DOWN)";
        function = QFUNC(laserModule);
        scope = 2;
        isGlobal = 1;
    };
};
