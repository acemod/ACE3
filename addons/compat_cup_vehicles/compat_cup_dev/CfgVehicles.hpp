class CfgVehicles {
    class Helicopter_Base_H;
    class CUP_CH53E_base: Helicopter_Base_H {
        class UserActions {
            delete RampClose;
            class Ramp_Close {
                condition = QUOTE(this animationPhase 'ramp_bottom' >= 0.56 && player == driver this && !(this getVariable [ARR_2(QUOTE(QEGVAR(fastroping,doorsLocked)),false)]));
            };
        };
    };
};
