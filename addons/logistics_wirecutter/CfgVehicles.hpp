class CfgVehicles {
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_wirecutter,4);
        };
    };

    class Wall_F;
    class NonStrategic;

    class Land_Net_Fence_4m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Net_Fence_8m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Net_FenceD_8m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_New_WiredFence_5m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_New_WiredFence_10m_Dam_F: Wall_F { GVAR(isFence) = 1; };
    class Land_New_WiredFence_10m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Pipe_fence_4m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Pipe_fence_4mNoLC_F: Wall_F { GVAR(isFence) = 1; };
    class Land_SportGround_fence_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Wired_Fence_4m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Wired_Fence_4mD_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Wired_Fence_8m_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Wired_Fence_8mD_F: Wall_F { GVAR(isFence) = 1; };
    class Land_Razorwire_F: NonStrategic { GVAR(isFence) = 1; };
};
