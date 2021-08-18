#define TOW_ACTION \
class ACE_Actions {\
    class ACE_MainActions {\
        class ADDON {\
            displayName = CSTRING(displayName);\
            distance = TOW_ACTION_DISTANCE;\
            condition = QUOTE([ARR_1(_target)] call FUNC(isSuitableSimulation));\
            statement = "";\
            exceptions[] = { INTERACTION_EXCEPTIONS };\
            showDisabled = 0;\
            icon = "";\
            class GVAR(startTow3) {\
                displayName = CSTRING(start3);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope3')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope3')] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
            class GVAR(startTow6) {\
                displayName = CSTRING(start6);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope6')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope6')] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
            class GVAR(startTow12) {\
                displayName = CSTRING(start12);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope12')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope12')] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
            class GVAR(startTow15) {\
                displayName = CSTRING(start15);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope15')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope15')] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
            class GVAR(startTow18) {\
                displayName = CSTRING(start18);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope18')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope18')] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
            class GVAR(startTow27) {\
                displayName = CSTRING(start27);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope27')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope27')] call FUNC(startTow));\
                exceptions[] = { INTERACTION_EXCEPTIONS };\
            };\
            class GVAR(startTow36) {\
                displayName = CSTRING(start36);\
                condition = QUOTE(([ARR_2(_player,_target)] call FUNC(canStartTow)) && [ARR_2(_player, 'ACE_rope36')] call EFUNC(common,hasItem));\
                statement = QUOTE([ARR_3(_player,_target,'ACE_rope36')] call FUNC(startTow));\
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
                statement = QUOTE(private _parent = _target getVariable [ARR_2(QQGVAR(parent), objNull)]; private _child = _target getVariable [ARR_2(QQGVAR(child), objNull)]; [ARR_3(_player,_parent,_child)] call FUNC(detach));
                distance = 2;
            };
        };
    };
};
