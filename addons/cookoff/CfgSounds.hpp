#define SHOTSOUND(type,dist,N) \
class GVAR(TRIPLES(type,dist,N)) { \
    name = QGVAR(TRIPLES(type,dist,N)); \
    sound[] = {QPATHTOF(sounds\type\DOUBLES(dist,N).wss), 0.56, 1, 3000}; \
    titles[] = {}; \
}

#define SHOTSOUNDCLASS(type,dist) \
SHOTSOUND(type,dist,1);\
SHOTSOUND(type,dist,2);\
SHOTSOUND(type,dist,3)

#define SHOTSOUNDCLASSTYPE(type) \
SHOTSOUNDCLASS(type,close);\
SHOTSOUNDCLASS(type,mid);\
SHOTSOUNDCLASS(type,far)

class CfgSounds {

    SHOTSOUNDCLASSTYPE(shotbullet);
    SHOTSOUNDCLASSTYPE(shotrocket);
    SHOTSOUNDCLASSTYPE(shotshell);

    class GVAR(shotmissile_close_1): GVAR(shotrocket_close_1) {};
    class GVAR(shotmissile_close_2): GVAR(shotrocket_close_2) {};
    class GVAR(shotmissile_close_3): GVAR(shotrocket_close_3) {};
    class GVAR(shotmissile_mid_1): GVAR(shotrocket_mid_1) {};
    class GVAR(shotmissile_mid_2): GVAR(shotrocket_mid_2) {};
    class GVAR(shotmissile_mid_3): GVAR(shotrocket_mid_3) {};
    class GVAR(shotmissile_far_1): GVAR(shotrocket_far_1) {};
    class GVAR(shotmissile_far_2): GVAR(shotrocket_far_2) {};
    class GVAR(shotmissile_far_3): GVAR(shotrocket_far_3) {};

    class GVAR(shotsubmunitions_close_1): GVAR(shotbullet_close_1) {};
    class GVAR(shotsubmunitions_close_2): GVAR(shotbullet_close_2) {};
    class GVAR(shotsubmunitions_close_3): GVAR(shotbullet_close_3) {};
    class GVAR(shotsubmunitions_mid_1): GVAR(shotbullet_far_1) {};
    class GVAR(shotsubmunitions_mid_2): GVAR(shotbullet_mid_2) {};
    class GVAR(shotsubmunitions_mid_3): GVAR(shotbullet_mid_3) {};
    class GVAR(shotsubmunitions_far_1): GVAR(shotbullet_far_1) {};
    class GVAR(shotsubmunitions_far_2): GVAR(shotbullet_far_2) {};
    class GVAR(shotsubmunitions_far_3): GVAR(shotbullet_far_3) {};
};
