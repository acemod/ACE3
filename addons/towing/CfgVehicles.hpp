#define TOW_ACTION \
class ACE_Actions {\
    class ACE_MainActions {\
        class ADDON {\
            displayName = CSTRING(displayName);\
            distance = TOW_ACTION_DISTANCE;\
            condition = QUOTE([ARR_2(_target, 0)] call FUNC(isSuitableSimulation));\
            statement = "";\
            exceptions[] = { INTERACTION_EXCEPTIONS };\
            showDisabled = 0;\
            icon = "";\
            class GVAR(startTow) {\
                displayName = CSTRING(start);\
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canStartTow));\
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
        };\
    };\
}

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        TOW_ACTION;
    };

    class Tank: LandVehicle {
        TOW_ACTION;
    };

    class ThingX;
    class GVAR(hook): ThingX {
        displayName = "hook"; // not publicly visible, no stringtable needed
        scope = 1;
        scopeCurator = 1;
        model = "\a3\Structures_F_Orange\VR\Helpers\Sign_sphere10cm_Geometry_F.p3d";
        destrType = "DestructNo";

        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(detach);
				condition = "true";
                statement = QUOTE(private _parent = _target getVariable [ARR_2(QQGVAR(parent), objNull)]; private _child = _target getVariable [ARR_2(QQGVAR(child), objNull)]; [ARR_2(_parent,_child)] call FUNC(detach));
                distance = 2;
            };
        };
    };
};
