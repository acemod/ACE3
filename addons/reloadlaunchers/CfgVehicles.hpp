class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class GVAR(ReloadLauncher) {
                displayName = CSTRING(LoadLauncher);
                selection = "launcher";
                distance = 4;
                condition = "";
                exceptions[] = {"isNotInside", "isNotSwimming"};
                insertChildren = QUOTE(call FUNC(addMissileReloadActions));
            };
            class GVAR(passLauncher) { // mutually exclusive conditions, so will never overlap
                displayName = CSTRING(passLauncher);
                selection = "launcher"; // target doesn't have a launcher, but the point is on their back where it should be
                distance = 4;
                condition = QUOTE(call FUNC(passLauncherCondition));
                statement = QUOTE(call FUNC(passLauncherStart));
                exceptions[] = {"isNotInside", "isNotSwimming"};
            };
        };
    };
};
