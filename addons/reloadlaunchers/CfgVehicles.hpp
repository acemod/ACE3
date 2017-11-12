
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
                insertChildren = QUOTE(_this call FUNC(addMissileReloadActions));
            };
        };
    };
};
