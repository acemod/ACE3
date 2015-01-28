#define MACRO_CUTWIRE \
  class ACE_Wirecutter_cut { \
    displayName = "$STR_ACE_CutFence"; \
    distance = 4; \
    condition = QUOTE('ToolKit' in items _player && {alive _target}); \
    statement = QUOTE([ARR_2(5, _target)] call FUNC(cutDownFence)); \
    showDisabled = 1; \
    priority = 2.1; \
    icon = QUOTE(PATHTOF(ui\wirecutter_ca.paa)); \
  };

#define MACRO_CUTWIRE_LONG \
  class ACE_Wirecutter_cut { \
    displayName = "$STR_ACE_CutFence"; \
    distance = 4; \
    condition = QUOTE('ToolKit' in items _player && {alive _target}); \
    statement = QUOTE([ARR_2(5, _target)] call FUNC(cutDownFence)); \
    showDisabled = 1; \
    priority = 2.1; \
    icon = QUOTE(PATHTOF(ui\wirecutter_ca.paa)); \
  };

class CfgVehicles {

  class Wall_F;
  class Land_Net_Fence_4m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_Net_Fence_8m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE_LONG
    };
  };
  class Land_Net_FenceD_8m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_New_WiredFence_5m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_New_WiredFence_10m_Dam_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_New_WiredFence_10m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE_LONG
    };
  };
  class Land_Pipe_fence_4m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_Pipe_fence_4mNoLC_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_SportGround_fence_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_Wired_Fence_4m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_Wired_Fence_4mD_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
  class Land_Wired_Fence_8m_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE_LONG
    };
  };
  class Land_Wired_Fence_8mD_F: Wall_F {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };

  class NonStrategic;
  class Land_Razorwire_F: NonStrategic {
    class ACE_Actions {
      MACRO_CUTWIRE
    };
  };
};
