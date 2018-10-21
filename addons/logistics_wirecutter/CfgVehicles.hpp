class CfgVehicles {
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_wirecutter,4);
        };
    };

    class Wall_F;
    class NonStrategic;
    class Land_Net_Fence_4m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Net_Fence_8m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_New_WiredFence_5m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_New_WiredFence_10m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_SportGround_fence_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Wired_Fence_4m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Wired_Fence_8m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_SportGround_fence_noLC_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Mil_WiredFence_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_IndFnc_Corner_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_IndFnc_9_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_IndFnc_3_Hole_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_IndFnc_3_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Razorwire_F: NonStrategic {
        GVAR(isFence) = 1;
    };
    class Land_PlasticNetFence_01_short_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_PlasticNetFence_01_long_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_NetFence_01_m_4m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_NetFence_01_m_8m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_WiredFence_01_4m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_WiredFence_01_8m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_WiredFence_01_16m_F: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Slums01_8m: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_Slums02_4m: Wall_F {
        GVAR(isFence) = 1;
    };
    class Land_BackAlley_01_l_1m_F: Wall_F {
        GVAR(isFence) = 1;
    };
};
