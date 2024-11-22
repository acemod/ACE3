#define GLUE(g1,g2) g1##g2
#define TAG(name,col) class TRIPLES(ACE,name,col) { \
        displayName = CSTRING(name); \
        requiredItem = QUOTE(GLUE(ACE_Spraypaint,col)); \
        textures[] = {QPATHTOF(UI\tags\col\name.paa)}; \
        icon = QPATHTOF(UI\tags\col\name.paa); \
    }

class ACE_Tags {
    class ACE_XBlack {
        displayName = CSTRING(x);
        requiredItem = "ACE_SpraypaintBlack";
        textures[] = {QPATHTOF(UI\tags\black\0.paa), QPATHTOF(UI\tags\black\1.paa), QPATHTOF(UI\tags\black\2.paa)};
        icon = QPATHTOF(UI\tags\black\0.paa);
    };
    class ACE_XRed {
        displayName = CSTRING(x);
        requiredItem = "ACE_SpraypaintRed";
        textures[] = {QPATHTOF(UI\tags\red\0.paa), QPATHTOF(UI\tags\red\1.paa), QPATHTOF(UI\tags\red\2.paa)};
        icon = QPATHTOF(UI\tags\red\0.paa);
    };
    class ACE_XGreen {
        displayName = CSTRING(x);
        requiredItem = "ACE_SpraypaintGreen";
        textures[] = {QPATHTOF(UI\tags\green\0.paa), QPATHTOF(UI\tags\green\1.paa), QPATHTOF(UI\tags\green\2.paa)};
        icon = QPATHTOF(UI\tags\green\0.paa);
    };
    class ACE_XBlue {
        displayName = CSTRING(x);
        requiredItem = "ACE_SpraypaintBlue";
        textures[] = {QPATHTOF(UI\tags\blue\0.paa), QPATHTOF(UI\tags\blue\1.paa), QPATHTOF(UI\tags\blue\2.paa)};
        icon = QPATHTOF(UI\tags\blue\0.paa);
    };
    class ACE_XYellow {
        displayName = CSTRING(x);
        requiredItem = "ACE_SpraypaintYellow";
        textures[] = {QPATHTOF(UI\tags\yellow\0.paa), QPATHTOF(UI\tags\yellow\1.paa), QPATHTOF(UI\tags\yellow\2.paa)};
        icon = QPATHTOF(UI\tags\yellow\0.paa);
    };
    class ACE_XWhite {
        displayName = CSTRING(x);
        requiredItem = "ACE_SpraypaintWhite";
        textures[] = {QPATHTOF(UI\tags\white\0.paa), QPATHTOF(UI\tags\white\1.paa), QPATHTOF(UI\tags\white\2.paa)};
        icon = QPATHTOF(UI\tags\white\0.paa);
    };

    TAG(arrow_up,Black);
    TAG(arrow_down,Black);
    TAG(arrow_left,Black);
    TAG(arrow_right,Black);
    TAG(circle,Black);
    TAG(cross,Black);
    TAG(diamond,Black);
    TAG(square,Black);
    TAG(square_filled,Black);
    TAG(triangle,Black);
    TAG(triangle_inverted,Black);

    TAG(arrow_up,Blue);
    TAG(arrow_down,Blue);
    TAG(arrow_left,Blue);
    TAG(arrow_right,Blue);
    TAG(circle,Blue);
    TAG(cross,Blue);
    TAG(diamond,Blue);
    TAG(square,Blue);
    TAG(square_filled,Blue);
    TAG(triangle,Blue);
    TAG(triangle_inverted,Blue);

    TAG(arrow_up,Green);
    TAG(arrow_down,Green);
    TAG(arrow_left,Green);
    TAG(arrow_right,Green);
    TAG(circle,Green);
    TAG(cross,Green);
    TAG(diamond,Green);
    TAG(square,Green);
    TAG(square_filled,Green);
    TAG(triangle,Green);
    TAG(triangle_inverted,Green);

    TAG(arrow_up,Red);
    TAG(arrow_down,Red);
    TAG(arrow_left,Red);
    TAG(arrow_right,Red);
    TAG(circle,Red);
    TAG(cross,Red);
    TAG(diamond,Red);
    TAG(square,Red);
    TAG(square_filled,Red);
    TAG(triangle,Red);
    TAG(triangle_inverted,Red);

    TAG(arrow_up,Yellow);
    TAG(arrow_down,Yellow);
    TAG(arrow_left,Yellow);
    TAG(arrow_right,Yellow);
    TAG(circle,Yellow);
    TAG(cross,Yellow);
    TAG(diamond,Yellow);
    TAG(square,Yellow);
    TAG(square_filled,Yellow);
    TAG(triangle,Yellow);
    TAG(triangle_inverted,Yellow);

    TAG(arrow_up,White);
    TAG(arrow_down,White);
    TAG(arrow_left,White);
    TAG(arrow_right,White);
    TAG(circle,White);
    TAG(cross,White);
    TAG(diamond,White);
    TAG(square,White);
    TAG(square_filled,White);
    TAG(triangle,White);
    TAG(triangle_inverted,White);
};
