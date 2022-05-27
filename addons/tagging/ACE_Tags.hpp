#define GLUE(g1,g2) g1##g2
#define TAG(name,col) class TRIPLES(ACE,name,col) { \
        displayName = CSTRING(name); \
        requiredItem = QUOTE(GLUE(ACE_Spraypaint,col)); \
        textures[] = {QPATHTOF(UI\tags\col\name.paa)}; \
        icon = QPATHTOF(UI\tags\col\name.paa); \
    } \

class ACE_Tags {
    class ACE_XBlack {
        displayName = CSTRING(XBlack);
        requiredItem = "ACE_SpraypaintBlack";
        textures[] = {QPATHTOF(UI\tags\black\0.paa), QPATHTOF(UI\tags\black\1.paa), QPATHTOF(UI\tags\black\2.paa)};
        icon = QPATHTOF(UI\tags\black\0.paa);
    };
    class ACE_XRed {
        displayName = CSTRING(XRed);
        requiredItem = "ACE_SpraypaintRed";
        textures[] = {QPATHTOF(UI\tags\red\0.paa), QPATHTOF(UI\tags\red\1.paa), QPATHTOF(UI\tags\red\2.paa)};
        icon = QPATHTOF(UI\tags\red\0.paa);
    };
    class ACE_XGreen {
        displayName = CSTRING(XGreen);
        requiredItem = "ACE_SpraypaintGreen";
        textures[] = {QPATHTOF(UI\tags\green\0.paa), QPATHTOF(UI\tags\green\1.paa), QPATHTOF(UI\tags\green\2.paa)};
        icon = QPATHTOF(UI\tags\green\0.paa);
    };
    class ACE_XBlue {
        displayName = CSTRING(XBlue);
        requiredItem = "ACE_SpraypaintBlue";
        textures[] = {QPATHTOF(UI\tags\blue\0.paa), QPATHTOF(UI\tags\blue\1.paa), QPATHTOF(UI\tags\blue\2.paa)};
        icon = QPATHTOF(UI\tags\blue\0.paa);
    };

    TAG(arrow_up,Black);
    TAG(arrow_down,Black);
    TAG(arrow_left,Black);
    TAG(arrow_right,Black);
    TAG(circle,Black);
    TAG(cross,Black);
    TAG(diamond,Black);
    TAG(square,Black);
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
    TAG(triangle,Red);
    TAG(triangle_inverted,Red);
};
