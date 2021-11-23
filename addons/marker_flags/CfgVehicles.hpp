class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ADDON {
                    displayName = CSTRING(actionPlace);
                    condition = QUOTE(_player call FUNC(canPlace));
                    insertChildren = QUOTE(_this call FUNC(addActions));
                    statement = "";
                    exceptions[] = {};
                    showDisabled = 0;
                    priority = 1;
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
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(1,1,1,1.0,CO)"};
    };
    class GVAR(black): GVAR(white) {
        displayName = CSTRING(black);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(0,0,0,1.0,CO)"};
    };
    class GVAR(red): GVAR(white) {
        displayName = CSTRING(red);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(1,0,0,1.0,CO)"};
    };
    class GVAR(green): GVAR(white) {
        displayName = CSTRING(green);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(0,1,0,1.0,CO)"};
    };
    class GVAR(blue): GVAR(white) {
        displayName = CSTRING(blue);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(0,0,1,1.0,CO)"};
    };
    class GVAR(yellow): GVAR(white) {
        displayName = CSTRING(yellow);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(1,1,0,1.0,CO)"};
    };
    class GVAR(orange): GVAR(white) {
        displayName = CSTRING(orange);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(1,0.5,0,1.0,CO)"};
    };
    class GVAR(purple): GVAR(white) {
        displayName = CSTRING(purple);
        hiddenselectionstextures[] = {"#(argb,8,8,3)color(0.5,0,0.5,1.0,CO)"};
    };
};
