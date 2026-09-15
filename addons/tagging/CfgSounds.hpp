#define SOUNDEFFECT(NAME,VOLUME)\
class GVAR(NAME) {\
    sound[] = { QUOTE(PATHTO_R(sounds\NAME.ogg)), VOLUME, 1, 25 };\
    titles[] = {};\
}

class CfgSounds {
    SOUNDEFFECT(spray,5);
    SOUNDEFFECT(spray01,5);
    SOUNDEFFECT(spray02,5);

    SOUNDEFFECT(chalk01,5);
    SOUNDEFFECT(chalk02,5);
    SOUNDEFFECT(chalk03,5);
    SOUNDEFFECT(chalk04,5);
    SOUNDEFFECT(chalk05,5);
    SOUNDEFFECT(chalk06,5);
};
