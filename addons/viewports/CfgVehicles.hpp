class CfgVehicles {
    class B_MBT_01_base_F;
    class B_MBT_01_cannon_F: B_MBT_01_base_F { // Merkel
        class ADDON {
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
        class ADDON {
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



    class Wheeled_APC_F;
    class Tank_F;

     // 80 and 80A p3ds both use same modelPos
    #if __has_include("\CUP\WheeledVehicles\CUP_WheeledVehicles_BTR80\CUP_BTR_80.p3d")
    class CUP_BTR80_Common_Base: Wheeled_APC_F {
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.734863, 0.143927, -0.291199};
                camAttach = 45;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_1 {
                camLocation[] = {0.950684, -0.00122738, -0.344391};
                camAttach = 90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_2 {
                camLocation[] = {0.932129, -0.729811, -0.319};
                camAttach = 90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_3 {
                camLocation[] = {-0.963379, -0.749183, -0.351501};
                camAttach = -90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_4 {
                camLocation[] = {-0.973145, 0.0148516, -0.364868};
                camAttach = -90;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_5 {
                camLocation[] = {-0.73584, 0.119176, -0.291229};
                camAttach = -45;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
        };
    };
    #endif

    #if __has_include("\CUP\WheeledVehicles\CUP_WheeledVehicles_BTR90\CUP_btr90.p3d")
    class CUP_BTR90_Base: Wheeled_APC_F {
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.533417, 2.4613, -0.309951};
                camAttach = 0;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_1 {
                camLocation[] = {0.877106, 2.38684, -0.306068};
                camAttach = 30;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_2 {
                camLocation[] = {1.04312, 0.0909424, -0.281996};
                camAttach = 60;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_3 {
                type = "";
                camLocation[] = {1.03799, -0.928223, -0.282196};
                camAttach = 80;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_4 {
                type = "";
                camLocation[] = {-0.90097, -0.913086, -0.282192};
                camAttach = -80;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
            class view_5 {
                type = "";
                camLocation[] = {-0.939301, 0.109985, -0.281992};
                camAttach = -60;
                compartments[]={"Compartment1"};
                roles[]={"cargo"};
            };
        };
    };
    class CUP_BTR90_HQ_Base: CUP_BTR90_base { delete ace_viewports; }; // no cargo seats
    #endif

  
    #if __has_include("\CUP\TrackedVehicles\CUP_TrackedVehicles_Bradley\CUP_M2A2.p3d")
    class CUP_M2Bradley_Base: Tank_F {
        class ace_viewports {
            class view_0 {
                camLocation[] = {0.987915, -0.324707, -0.0673385};
                camAttach = 70;
                roles[]={"cargo"};
            };
            class view_1 {
                camLocation[] = {0.90979, -0.970215, -0.043139};
                camAttach = 120;
                roles[]={"cargo"};
            };
            class view_2 {
                camLocation[] = {0.328003, -1.87402, -0.0408039};
                camAttach = 160;
                roles[]={"cargo"};
            };
            class view_3 {
                camLocation[] = {-0.357178, -1.89063, -0.0480237};
                camAttach = 175;
                roles[]={"cargo"};
            };
            class view_4 {
                camLocation[] = {-0.752075, -1.87061, -0.0522318};
                camAttach = 190;
                roles[]={"cargo"};
            };
            class view_5 {
                camLocation[] = {-0.936401, -0.0942383, -0.107764};
                camAttach = -75;
                roles[]={"cargo"};
            };
            class SLD { // suppose to only be only on A3, but the A2s have the screen on the model?
                screenLocation[] = {0.729126,-0.191597,-0.573349};
                maxDistance = 5;
                type = "screen";
                camLocation[] = {0,0,0.05};
                camAttach[] = {0,0};
                roles[]={"cargo"};
            };
        };
    };
    #endif
};
