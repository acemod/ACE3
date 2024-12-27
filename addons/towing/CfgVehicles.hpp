#define CONCAT(a,b) a##b
#define TOW_ACTION(length) \
    class GVAR(CONCAT(startTow,length)) {\
        displayName = CSTRING(CONCAT(start,length));\
        condition = QUOTE([ARR_2(_player,'CONCAT(ACE_rope,length)')] call DEFUNC(common,hasItem));\
        statement = QUOTE([ARR_3(_player,_target,'CONCAT(ACE_rope,length)')] call DFUNC(startTow));\
        exceptions[] = { INTERACTION_EXCEPTIONS };\
    }
#define TOW_ACTIONS \
    class ACE_Actions {\
        class ACE_MainActions {\
            class ADDON {\
                displayName = CSTRING(displayName);\
                distance = TOW_ACTION_DISTANCE;\
                condition = QUOTE(alive _target && {_target call DFUNC(isSuitableSimulation)});\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
                insertChildren = QUOTE(_target call DFUNC(getDetachActions));\
                TOW_ACTION(3);\
                TOW_ACTION(6);\
                TOW_ACTION(12);\
                TOW_ACTION(15);\
                TOW_ACTION(18);\
                TOW_ACTION(27);\
                TOW_ACTION(36);\
            };\
        };\
    }

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        TOW_ACTIONS;
    };

    class Tank: LandVehicle {
        TOW_ACTIONS;
    };

    class Ship;
    class Ship_F: Ship {
        TOW_ACTIONS;
    };

    class ThingX;
    class GVAR(helper): ThingX {
        displayName = "helper"; // not publicly visible, no stringtable needed
        scope = 1;
        scopeCurator = 1;
        model = "\A3\Weapons_f\empty";
        destrType = "DestructNo";
    };
    class GVAR(hook): GVAR(helper) {
        displayName = "hook";
        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(detach);
                statement = QUOTE([ARR_2(_player,_target)] call DFUNC(detachRope));
                distance = TOW_ACTION_DISTANCE;
            };
        };
    };
};
