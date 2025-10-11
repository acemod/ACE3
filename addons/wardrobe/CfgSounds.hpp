// Duration in this case is 10th of secounds. so 10 -> 1 sec, 15 -> 1.5sec, ...
#define ENTRY(base,dur)\
    class GVAR(DOUBLES(base,dur)) {\
        name = QUOTE(base dur);\
        sound[] = { QPATHTOF(data\sounds\DOUBLES(base,dur).ogg), 1, 1, 100 };\
        titles[] = { 0, "" };\
        forceTitles = 0;\
        titlesStructured = 0;\
    }

class CfgSounds {
    sounds[] = {};
    ENTRY(fabric,06);
    ENTRY(fabric,07);
    ENTRY(fabric,16);
    ENTRY(fabric,20);
    ENTRY(fabric,25);

    ENTRY(helmet_visor,05);
};
