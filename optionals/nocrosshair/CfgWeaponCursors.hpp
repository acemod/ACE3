#define EMPTY_TEXTURE(weapon) \
    class weapon: default { \
        texture = ""; \
    }

class CfgWeaponCursors {
    class default;
    EMPTY_TEXTURE(arifle);
    EMPTY_TEXTURE(mg);
    EMPTY_TEXTURE(srifle);
    EMPTY_TEXTURE(smg);
    EMPTY_TEXTURE(hgun);
    EMPTY_TEXTURE(sgun);
    EMPTY_TEXTURE(gl);
    EMPTY_TEXTURE(throw);
    EMPTY_TEXTURE(put);
    EMPTY_TEXTURE(missile);
    EMPTY_TEXTURE(rocket);
    EMPTY_TEXTURE(bomb);
    EMPTY_TEXTURE(cannon);
    EMPTY_TEXTURE(mortar);
    EMPTY_TEXTURE(coil);
    EMPTY_TEXTURE(laserdesignator);
    // if these classes have empty texture the crosshair appears
    // EMPTY_TEXTURE(cursorAim);
    // EMPTY_TEXTURE(cursorAimOn);
};
