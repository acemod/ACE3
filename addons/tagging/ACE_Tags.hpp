#define SPRAY_TAG(NAME,COL)\
class TRIPLES(ACE,NAME,COL) {\
    displayName = CSTRING(NAME);\
    requiredItem = QUOTE(GLUE(ACE_Spraypaint,COL));\
    textures[] = {QPATHTOF(UI\tags\COL\NAME.paa)};\
    icon = QPATHTOF(UI\tags\COL\NAME.paa);\
}

#define CHALK_TAG(NAME,COL)\
class DOUBLES(TRIPLES(ACE,NAME,COL),chalk) {\
    displayName = CSTRING(NAME);\
    requiredItem = QUOTE(GLUE(ACE_Chalk,COL));\
    textures[] = { QPATHTOF(UI\tags\COL\NAME.paa) };\
    icon = QPATHTOF(UI\tags\COL\NAME.paa);\
}

#define SPRAY_TAG_X(COLOR,FOLDER)\
class DOUBLES(ACE,COLOR) {\
    displayName = CSTRING(x);\
    requiredItem = QUOTE(GLUE(ACE_Spraypaint,COLOR));\
    textures[] = { QPATHTOF(UI\tags\FOLDER\0.paa), QPATHTOF(UI\tags\FOLDER\1.paa), QPATHTOF(UI\tags\FOLDER\2.paa) };\
    icon = QPATHTOF(UI\tags\FOLDER\0.paa);\
}

#define CHALK_TAG_X(COLOR,FOLDER)\
class TRIPLES(ACE,COLOR,Chalk) {\
    displayName = CSTRING(x);\
    requiredItem = QUOTE(GLUE(ACE_Chalk,COLOR));\
    textures[] = {QPATHTOF(UI\tags\FOLDER\0.paa), QPATHTOF(UI\tags\FOLDER\1.paa), QPATHTOF(UI\tags\FOLDER\2.paa)};\
    icon = QPATHTOF(UI\tags\FOLDER\0.paa);\
}


#define SPRAY_TAGS(COLOR)\
SPRAY_TAG(arrow_up,COLOR);\
SPRAY_TAG(arrow_down,COLOR);\
SPRAY_TAG(arrow_left,COLOR);\
SPRAY_TAG(arrow_right,COLOR);\
SPRAY_TAG(circle,COLOR);\
SPRAY_TAG(cross,COLOR);\
SPRAY_TAG(diamond,COLOR);\
SPRAY_TAG(square,COLOR);\
SPRAY_TAG(square_filled,COLOR);\
SPRAY_TAG(triangle,COLOR);\
SPRAY_TAG(triangle_inverted,COLOR)

#define CHALK_TAGS(COLOR)\
CHALK_TAG(arrow_up,COLOR);\
CHALK_TAG(arrow_down,COLOR);\
CHALK_TAG(arrow_left,COLOR);\
CHALK_TAG(arrow_right,COLOR);\
CHALK_TAG(circle,COLOR);\
CHALK_TAG(cross,COLOR);\
CHALK_TAG(diamond,COLOR);\
CHALK_TAG(square,COLOR);\
CHALK_TAG(square_filled,COLOR);\
CHALK_TAG(triangle,COLOR);\
CHALK_TAG(triangle_inverted,COLOR)


class ACE_Tags {
    SPRAY_TAG_X(Black,black);
    SPRAY_TAG_X(Blue,blue);
    SPRAY_TAG_X(Green,green);
    SPRAY_TAG_X(Red,red);
    SPRAY_TAG_X(Yellow,yellow);
    SPRAY_TAG_X(White,white);

    SPRAY_TAGS(black);
    SPRAY_TAGS(blue);
    SPRAY_TAGS(green);
    SPRAY_TAGS(red);
    SPRAY_TAGS(yellow);
    SPRAY_TAGS(white);

    CHALK_TAG_X(Black,black);
    CHALK_TAG_X(Blue,blue);
    CHALK_TAG_X(Green,green);
    CHALK_TAG_X(Red,red);
    CHALK_TAG_X(Yellow,yellow);
    CHALK_TAG_X(White,white);

    CHALK_TAGS(black);
    CHALK_TAGS(blue);
    CHALK_TAGS(green);
    CHALK_TAGS(red);
    CHALK_TAGS(yellow);
    CHALK_TAGS(white);
};
