// weird ass concatenation syntax. PBO Project complains otherwise...
#define CONCAT(a,b) a####b
#define CREATE_SCREAM(no)\
class GVAR(DOUBLES(scream,no)) { \
    name = QUOTE(GVAR(CONCAT(scream,no)));\
    sound[] = {QUOTE(PATHTOF(CONCAT(sounds\scream,no).ogg)), db + 8, 1};\
    titles[] = {}; \
}
    
class CfgSounds {
    CREATE_SCREAM(1);
    CREATE_SCREAM(2);
    CREATE_SCREAM(3);
    CREATE_SCREAM(4);
    CREATE_SCREAM(5);
    CREATE_SCREAM(6);
    CREATE_SCREAM(7);
    CREATE_SCREAM(8);
    CREATE_SCREAM(9);
    CREATE_SCREAM(10);
    CREATE_SCREAM(11);
    CREATE_SCREAM(12);
    CREATE_SCREAM(13);
    CREATE_SCREAM(14);
    CREATE_SCREAM(15);
};