class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(ActionPlace);
                    condition = QUOTE(_player call FUNC(canPlace));
                    insertChildren = QUOTE(_this call FUNC(addActions));
                    icon = QPATHTOF(ui\icons\white_place_icon.paa);
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
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.82,0.82,0.82,1,co)"};
    };
    class GVAR(black): GVAR(white) {
        displayName = CSTRING(black);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.18,0.18,0.18,1,co)"};
    };
    class GVAR(red): GVAR(white) {
        displayName = CSTRING(red);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.647,0.141,0.161,1,co)"};
    };
    class GVAR(green): GVAR(white) {
        displayName = CSTRING(green);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.063,0.588,0.063,1,co)"};
    };
    class GVAR(blue): GVAR(white) {
        displayName = CSTRING(blue);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.161,0.349,0.58,1,co)"};
    };
    class GVAR(yellow): GVAR(white) {
        displayName = CSTRING(yellow);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.776,0.729,0.129,1,co)"};
    };
    class GVAR(orange): GVAR(white) {
        displayName = CSTRING(orange);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.678,0.349,0.153,1,co)"};
    };
    class GVAR(purple): GVAR(white) {
        displayName = CSTRING(purple);
        hiddenSelectionsTextures[] = {"#(argb,8,8,3)color(0.373,0.141,0.647,1,co)"};
    };
};
