class CfgVehicles {
    class B_MBT_01_base_F;
    class B_MBT_01_cannon_F: B_MBT_01_base_F { // Merkel
        class ace_viewports {
            class SLD_backLeftUpper {
                type = "screen";
                camLocation[] = {0,0,0.05};
                maxDistance = 5;
                camAttach[] = {0,0};
                screenLocation[] = {-0.925,-3.43459,-1.07};
                roles[]={"cargo"};
            };
        };
    };
    class B_MBT_01_TUSK_F: B_MBT_01_cannon_F { // Merkel TUSK
        class ace_viewports {
            class SLD_backLeftUpper {
                type = "screen";
                camLocation[] = {0,0,0.05};
                maxDistance = 5;
                camAttach[] = {0,0};
                screenLocation[] = {-0.925,-4.65511,-1.07};
                roles[]={"cargo"};
            };
        };
    };
};
