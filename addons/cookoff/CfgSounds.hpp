#define VOLUME 2
#define PITCH 1

#define SHOTSOUND(type,dist,N,maxDistance)\
class GVAR(TRIPLES(type,dist,N)) {\
    sound[] = {QPATHTOF(sounds\type\DOUBLES(dist,N).wss), VOLUME, PITCH, maxDistance};\
    titles[] = {};\
}

#define SHOTSOUNDCLASS(type,dist,maxDistance)\
SHOTSOUND(type,dist,1,maxDistance);\
SHOTSOUND(type,dist,2,maxDistance);\
SHOTSOUND(type,dist,3,maxDistance)

#define SHOTSOUNDCLASSTYPE(type,maxDistance)\
SHOTSOUNDCLASS(type,close,maxDistance);\
SHOTSOUNDCLASS(type,mid,maxDistance);\
SHOTSOUNDCLASS(type,far,maxDistance)

// Allows other mods to change sounds for cook-off
class CfgSounds {
    // These macros set up the sounds for the various classes
    SHOTSOUNDCLASSTYPE(shotbullet,1250);
    SHOTSOUNDCLASSTYPE(shotrocket,1600);
    SHOTSOUNDCLASSTYPE(shotshell,1300);

    // Missiles use the same sounds as rockets
    class GVAR(shotmissile_close_1): GVAR(shotrocket_close_1) {};
    class GVAR(shotmissile_close_2): GVAR(shotrocket_close_2) {};
    class GVAR(shotmissile_close_3): GVAR(shotrocket_close_3) {};
    class GVAR(shotmissile_mid_1): GVAR(shotrocket_mid_1) {};
    class GVAR(shotmissile_mid_2): GVAR(shotrocket_mid_2) {};
    class GVAR(shotmissile_mid_3): GVAR(shotrocket_mid_3) {};
    class GVAR(shotmissile_far_1): GVAR(shotrocket_far_1) {};
    class GVAR(shotmissile_far_2): GVAR(shotrocket_far_2) {};
    class GVAR(shotmissile_far_3): GVAR(shotrocket_far_3) {};

    // Submunitions have the same sound as bullets, but a higher maxDistance
    class GVAR(shotsubmunitions_close_1): GVAR(shotbullet_close_1) {
        sound[] = {QPATHTOF(sounds\shotbullet\close_1.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_close_2): GVAR(shotbullet_close_2) {
        sound[] = {QPATHTOF(sounds\shotbullet\close_2.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_close_3): GVAR(shotbullet_close_3) {
        sound[] = {QPATHTOF(sounds\shotbullet\close_3.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_mid_1): GVAR(shotbullet_mid_1) {
        sound[] = {QPATHTOF(sounds\shotbullet\mid_1.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_mid_2): GVAR(shotbullet_mid_2) {
        sound[] = {QPATHTOF(sounds\shotbullet\mid_2.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_mid_3): GVAR(shotbullet_mid_3) {
        sound[] = {QPATHTOF(sounds\shotbullet\mid_3.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_far_1): GVAR(shotbullet_far_1) {
        sound[] = {QPATHTOF(sounds\shotbullet\far_1.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_far_2): GVAR(shotbullet_far_2) {
        sound[] = {QPATHTOF(sounds\shotbullet\far_2.wss), VOLUME, PITCH, 1600};
    };
    class GVAR(shotsubmunitions_far_3): GVAR(shotbullet_far_3) {
        sound[] = {QPATHTOF(sounds\shotbullet\far_3.wss), VOLUME, PITCH, 1600};
    };
};
