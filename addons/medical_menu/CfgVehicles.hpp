
class CfgVehicles {

    class ACE_Module;
    class ACE_moduleMedicalMenuSettings: ACE_Module {
        scope = 1;
        displayName = CSTRING(module_DisplayName);
        icon = QPATHTOEF(medical,UI\Icon_Module_Medical_ca.paa);
        category = "ACE_medical";
        function = QUOTE(DFUNC(module));
        functionPriority = 1;
        isGlobal = 1;
        isSingular = 1;
        isTriggerActivated = 0;
        author = ECSTRING(common,ACETeam);
        class Arguments {
            class allow {
                displayName = CSTRING(allow);
                description = CSTRING(allow_Descr);
                typeName = "NUMBER";
                class values {
                    class disable {
                        name = ECSTRING(common,Disabled);
                        value = 0;
                    };
                    class enable  {
                        name = ECSTRING(common,Enabled);
                        value = 1;
                        default = 1;
                    };
                    class VehiclesOnly  {
                        name = ECSTRING(common,VehiclesOnly);
                        value = 2;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(module_Desc);
            sync[] = {};
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class Medical_Menu {
                displayName = CSTRING(OpenMenu);
                runOnHover = 0;
                exceptions[] = {"isNotInside", "isNotSwimming"};
                condition = QUOTE([ARR_2(ACE_player,_target)] call FUNC(canOpenMenu));
                statement = QUOTE([_target] call DFUNC(openMenu));
                icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
            };
        };

        class ACE_Actions {
            // Create a consolidates medical menu for treatment while boarded
            class ACE_MainActions {
                class Medical_Menu {
                    displayName = CSTRING(OpenMenu);
                    runOnHover = 0;
                    exceptions[] = {"isNotInside", "isNotSwimming"};
                    condition = QUOTE([ARR_2(ACE_player,_target)] call FUNC(canOpenMenu));
                    statement = QUOTE([_target] call DFUNC(openMenu));
                    icon = QPATHTOEF(medical,UI\icons\medical_cross.paa);
                };
            };
        };
    };
};
