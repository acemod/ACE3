
class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class GVAR(ReloadLauncher) {
                displayName = "RELOAD LAUNCHERS";
                selection = "launcher";
                distance = 4;
                condition = "";
                insertChildren = QUOTE(_this call FUNC(addMissileReloadActions));
            };
        };
    };
};
