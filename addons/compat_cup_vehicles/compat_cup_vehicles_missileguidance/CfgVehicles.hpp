class CfgVehicles {
    class Helicopter_Base_H;
    class CUP_KA50_Base: Helicopter_Base_H {
        class pilotCamera;
    };
    class CUP_KA50_Dynamic_Base: CUP_KA50_Base {
        class pilotCamera: pilotCamera {
            EGVAR(missileguidance,usePilotCameraForTargeting) = 1;
        };
    };
};
