#define SOUND(var1,dur)\
class GVAR(DOUBLES(var1,dur))\
{\
    name = Q(var1 dur);\
    sound[] = { QPATHTOF(data\DOUBLES(var1,dur)##.ogg), 1, 1, 100 };\
    titles[] = { 0, "" };\
    forceTitles = 0;\
    titlesStructured = 0;\
};


class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version
    SOUND(fabric,06)
    SOUND(fabric,07)
    SOUND(fabric,16)
    SOUND(fabric,20)
    SOUND(fabric,25)
    
    SOUND(helmet_visor,05)
};