class CfgVehicles {
	class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            #include "ACE_Medical_SelfActions.hpp"
        };
        class ACE_Actions {
            #include "ACE_Medical_Actions.hpp"
        };
    };
};
