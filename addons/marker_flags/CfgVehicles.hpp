class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(ActionPlace);
                    condition = QUOTE(_player call FUNC(canPlace));
                    insertChildren = QUOTE(_this call FUNC(addActions));
                };
            };
        };
    };

    class FlagMarker_01_F;
    class GVAR(white): FlagMarker_01_F {
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(white);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(1,1,1,1,co)"};
    };
    class GVAR(black): GVAR(white) {
        displayName = CSTRING(black);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0,0,0,1,co)"};
    };
    class GVAR(red): GVAR(white) {
        displayName = CSTRING(red);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(1,0,0,1,co)"};
    };
    class GVAR(green): GVAR(white) {
        displayName = CSTRING(green);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0,1,0,1,co)"};
    };
    class GVAR(blue): GVAR(white) {
        displayName = CSTRING(blue);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0,0,1,1,co)"};
    };
    class GVAR(yellow): GVAR(white) {
        displayName = CSTRING(yellow);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(1,1,0,1,co)"};
    };
    class GVAR(orange): GVAR(white) {
        displayName = CSTRING(orange);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(1,0.5,0,1,co)"};
    };
    class GVAR(purple): GVAR(white) {
        displayName = CSTRING(purple);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.5,0,0.5,1,co)"};
    };
};
