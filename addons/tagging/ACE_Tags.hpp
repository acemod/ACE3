#define TAG(name,col) class TRIPLES(ACE,name,col) { \
        displayName = CSTRING(DOUBLES(name,col)); \
        requiredItem = QUOTE(ACE_Spraypaint##col); \
        textures[] = {QPATHTOF(UI\tags\col\name.paa)}; \
        icon = QPATHTOF(UI\icons\iconTagging##col.paa); \
    } \

class ACE_Tags {
    class ACE_XBlack {
        displayName = CSTRING(XBlack);
        requiredItem = "ACE_SpraypaintBlack";
        textures[] = {QPATHTOF(UI\tags\black\0.paa), QPATHTOF(UI\tags\black\1.paa), QPATHTOF(UI\tags\black\2.paa)};
        icon = QPATHTOF(UI\icons\iconTaggingBlack.paa);
    };
    class ACE_XRed {
        displayName = CSTRING(XRed);
        requiredItem = "ACE_SpraypaintRed";
        textures[] = {QPATHTOF(UI\tags\red\0.paa), QPATHTOF(UI\tags\red\1.paa), QPATHTOF(UI\tags\red\2.paa)};
        icon = QPATHTOF(UI\icons\iconTaggingRed.paa);
    };
    class ACE_XGreen {
        displayName = CSTRING(XGreen);
        requiredItem = "ACE_SpraypaintGreen";
        textures[] = {QPATHTOF(UI\tags\green\0.paa), QPATHTOF(UI\tags\green\1.paa), QPATHTOF(UI\tags\green\2.paa)};
        icon = QPATHTOF(UI\icons\iconTaggingGreen.paa);
    };
    class ACE_XBlue {
        displayName = CSTRING(XBlue);
        requiredItem = "ACE_SpraypaintBlue";
        textures[] = {QPATHTOF(UI\tags\blue\0.paa), QPATHTOF(UI\tags\blue\1.paa), QPATHTOF(UI\tags\blue\2.paa)};
        icon = QPATHTOF(UI\icons\iconTaggingBlue.paa);
    };

    TAG(ar_u,Black);
    TAG(ar_d,Black);
    TAG(ar_l,Black);
    TAG(ar_r,Black);
    TAG(circ,Black);
    TAG(cross,Black);
    TAG(diam,Black);
    TAG(square,Black);
    TAG(tri,Black);
    TAG(tri_inv,Black);

    TAG(ar_u,Blue);
    TAG(ar_d,Blue);
    TAG(ar_l,Blue);
    TAG(ar_r,Blue);
    TAG(circ,Blue);
    TAG(cross,Blue);
    TAG(diam,Blue);
    TAG(square,Blue);
    TAG(tri,Blue);
    TAG(tri_inv,Blue);
    
    TAG(ar_u,Green);
    TAG(ar_d,Green);
    TAG(ar_l,Green);
    TAG(ar_r,Green);
    TAG(circ,Green);
    TAG(cross,Green);
    TAG(diam,Green);
    TAG(square,Green);
    TAG(tri,Green);
    TAG(tri_inv,Green);

    TAG(ar_u,Red);
    TAG(ar_d,Red);
    TAG(ar_l,Red);
    TAG(ar_r,Red);
    TAG(circ,Red);
    TAG(cross,Red);
    TAG(diam,Red);
    TAG(square,Red);
    TAG(tri,Red);
    TAG(tri_inv,Red);
};
