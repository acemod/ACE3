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

    TAG(arrow_up,black);
    TAG(arrow_down,black);
    TAG(arrow_left,black);
    TAG(arrow_right,black);
    TAG(circle,black);
    TAG(cross,black);
    TAG(diamond,black);
    TAG(square,black);
    TAG(square_filled,black);
    TAG(triangle,black);
    TAG(triangle_inverted,black);

    TAG(arrow_up,blue);
    TAG(arrow_down,blue);
    TAG(arrow_left,blue);
    TAG(arrow_right,blue);
    TAG(circle,blue);
    TAG(cross,blue);
    TAG(diamond,blue);
    TAG(square,blue);
    TAG(square_filled,blue);
    TAG(triangle,blue);
    TAG(triangle_inverted,blue);

    TAG(arrow_up,green);
    TAG(arrow_down,green);
    TAG(arrow_left,green);
    TAG(arrow_right,green);
    TAG(circle,green);
    TAG(cross,green);
    TAG(diamond,green);
    TAG(square,green);
    TAG(square_filled,green);
    TAG(triangle,green);
    TAG(triangle_inverted,green);

    TAG(arrow_up,red);
    TAG(arrow_down,red);
    TAG(arrow_left,red);
    TAG(arrow_right,red);
    TAG(circle,red);
    TAG(cross,red);
    TAG(diamond,red);
    TAG(square,red);
    TAG(square_filled,red);
    TAG(triangle,red);
    TAG(triangle_inverted,red);

    TAG(arrow_up,yellow);
    TAG(arrow_down,yellow);
    TAG(arrow_left,yellow);
    TAG(arrow_right,yellow);
    TAG(circle,yellow);
    TAG(cross,yellow);
    TAG(diamond,yellow);
    TAG(square,yellow);
    TAG(square_filled,yellow);
    TAG(triangle,yellow);
    TAG(triangle_inverted,yellow);

    TAG(arrow_up,white);
    TAG(arrow_down,white);
    TAG(arrow_left,white);
    TAG(arrow_right,white);
    TAG(circle,white);
    TAG(cross,white);
    TAG(diamond,white);
    TAG(square,white);
    TAG(square_filled,white);
    TAG(triangle,white);
    TAG(triangle_inverted,white);
};
