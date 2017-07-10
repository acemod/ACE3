class ACE_Settings {
    class GVAR(allowNegativeRatingPlayers) {
        category = CSTRING(Category_Rating);
        displayName = CSTRING(RatingSettings_allowRatingPlayers_DisplayName);
        description = CSTRING(RatingSettings_allowRatingPlayers_Description);
        value = 1;
        typeName = "BOOL";
    };
    class GVAR(allowNegativeRatingAi) {
        category = CSTRING(Category_Rating);
        displayName = CSTRING(RatingSettings_allowRatingAi_DisplayName);
        description = CSTRING(RatingSettings_allowRatingAi_Description);
        value = 1;
        typeName = "BOOL";
    };
};
