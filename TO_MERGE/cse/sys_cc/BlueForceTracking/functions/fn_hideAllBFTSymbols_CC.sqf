if (isnil "CSE_EXISTING_BFTRACKERS_CC") then {
	CSE_EXISTING_BFTRACKERS_CC = [];
};
{
	_x setMarkerAlphaLocal 0.0;
}foreach CSE_EXISTING_BFTRACKERS_CC;