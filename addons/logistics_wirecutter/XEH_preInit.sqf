#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
    GVAR(replacements) = createHashMapFromArray [
        ["gameprooffence_01_l_5m_f.p3d", [["Land_GameProofFence_01_l_d_F", [0, 0, 0], 0]]],
        ["indfnc_3_f.p3d", [["Land_IndFnc_3_D_F", [0.039, -0.221, 0], 0]]],
        ["indfnc_3_hole_f.p3d", [["Land_IndFnc_3_D_F", [0.042, -0.252, 0], 0]]],
        ["indfnc_9_f.p3d", [["Land_IndFnc_3_F", [-3, -0.06, 0], 0], ["Land_IndFnc_3_D_F", [0.039, -0.281, 0], 0], ["Land_IndFnc_3_F", [3, -0.06, 0], 0]]],
        ["indfnc_corner_f.p3d", [["Land_IndFnc_3_D_F", [0.116, -0.223, 0], 0]]],
        ["mil_wiredfence_f.p3d", [["Land_Mil_WiredFenceD_F", [0, 0, 0], 0]]],
        ["net_fence_8m_f.p3d", [["Land_Net_FenceD_8m_F", [0, 0.1, 0], 0]]],
        ["netfence_01_m_4m_f.p3d", [["Land_NetFence_01_m_d_F", [0, 0, 0], 0]]],
        ["netfence_01_m_8m_f.p3d", [["Land_NetFence_01_m_4m_F", [-2, 0, 0], 0], ["Land_NetFence_01_m_d_F", [2, 0, 0], 0]]],
        ["netfence_03_m_3m_corner_f.p3d", [["Land_NetFence_03_m_3m_d_F", [0.104, -0.183, 0], 0]]],
        ["netfence_03_m_3m_f.p3d", [["Land_NetFence_03_m_3m_d_F", [0.042, -0.236, 0], 0]]],
        ["netfence_03_m_3m_hole_f.p3d", [["Land_NetFence_03_m_3m_d_F", [0.045, -0.273, 0], 0]]],
        ["netfence_03_m_9m_f.p3d", [["Land_NetFence_03_m_3m_F", [-3.006, -0.073, 0], 0], ["Land_NetFence_03_m_3m_d_F", [0.038, -0.309, 0], 0], ["Land_NetFence_03_m_3m_F", [2.995, -0.073, 0], 0]]],
        ["plasticnetfence_01_long_f.p3d", [["Land_PlasticNetFence_01_long_d_F", [0, 0, -0.1], 0]]],
        ["wired_fence_4m_f.p3d", [["Land_Wired_Fence_4mD_F", [0, 0, 0], 0]]],
        ["wired_fence_8m_f.p3d", [["Land_Wired_Fence_4m_F", [-2, 0, 0], 0], ["Land_Wired_Fence_4mD_F", [3, 0, 0], 0]]],
        ["wiredfence_01_16m_f.p3d", [["Land_WiredFence_01_4m_F", [-6, 0, 0], 0], ["Land_WiredFence_01_8m_d_F", [0.34, -0.1, 0], 0]]],
        ["wiredfence_01_4m_f.p3d", [["Land_WiredFence_01_pole_F", [-2, 0, 0], 150]]],
        ["wiredfence_01_8m_f.p3d", [["Land_WiredFence_01_4m_F", [-2, 0, 0], 0], ["Land_WiredFence_01_pole_F", [0, 0, 0], 0]]]
    ];
};

ADDON = true;
