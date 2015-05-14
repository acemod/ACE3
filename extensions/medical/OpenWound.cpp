#include "OpenWound.h"
#include <sstream>

ace::medical::injuries::OpenWound::OpenWound(int aClassID, int aBodyPartId, double aPercentage, double aBl, double painAmount) :
    classID(aClassID), bodyPart(aBodyPartId), percentage(aPercentage), bloodlossRate(aBl), pain(painAmount)
{
}

ace::medical::injuries::OpenWound::~OpenWound()
{
}

std::string ace::medical::injuries::OpenWound::AsString()
{
    std::stringstream stream;
    stream << classID << "," << bodyPart << "," << 1 << "," << bloodlossRate;
    return stream.str();
}
