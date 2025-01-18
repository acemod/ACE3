class CBA_Extended_EventHandlers;

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(ActionCategory);
                    insertChildren = QUOTE(call FUNC(getActions));
                    icon = QPATHTOF(data\icons\place\white_place_icon.paa);
                    exceptions[] = {"isNotSwimming", "isNotOnLadder"};

                    class GVAR(furlFlag) {
                        displayName = CSTRING(Furl);
                        condition = QUOTE(_player call FUNC(isCarryingFlag));
                        exceptions[] = {"isNotSwimming", "isNotOnLadder"};
                        statement = QUOTE(_player call FUNC(furlFlag));
                        icon = QPATHTOF(data\icons\carry\white_furl_icon.paa);
                    };
                };
            };
        };
    };

    class FlagChecked_F;
    class GVAR(carrier_white): FlagChecked_F {
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);

        displayName = CSTRING(White);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_white.jpg);

        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {}; // Required for ACE_Actions
            init = QUOTE([_this select 0] call FUNC(setFlagTexture));
        };

        class ACE_Actions {
            class GVAR(pickup) {
                displayName = CSTRING(Pickup);
                icon = QPATHTOF(data\icons\place\white_pickup_icon.paa);
                position = "[0, -0.45, 0.75]";
                distance = 2.0;
                condition = QUOTE((typeOf _target) in GVAR(carrierItemMapping));
                statement = QUOTE([ARR_3(_player,(GVAR(carrierItemMapping) get (typeOf _target)),_target)] call FUNC(pickupFlag));
                modifierFunction = QUOTE(call FUNC(modifyPickupAction));
                exceptions[] = {"isNotSwimming", "isNotOnLadder"};
            };
        };
    };
    class GVAR(carrier_red): GVAR(carrier_white) {
        displayName = CSTRING(Red);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_red.jpg);
    };
    class GVAR(carrier_blue): GVAR(carrier_white) {
        displayName = CSTRING(Blue);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_blue.jpg);
    };
    class GVAR(carrier_green): GVAR(carrier_white) {
        displayName = CSTRING(Green);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_green.jpg);
    };
    class GVAR(carrier_yellow): GVAR(carrier_white) {
        displayName = CSTRING(Yellow);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_yellow.jpg);
    };
    class GVAR(carrier_orange): GVAR(carrier_white) {
        displayName = CSTRING(Orange);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_orange.jpg);
    };
    class GVAR(carrier_purple): GVAR(carrier_white) {
        displayName = CSTRING(Purple);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_purple.jpg);
    };
    class GVAR(carrier_black): GVAR(carrier_white) {
        displayName = CSTRING(Black);
        editorPreview = QPATHTOF(data\editorpreviews\ace_flags_carrier_black.jpg);
    };
};
