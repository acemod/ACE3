#include "OpenWound.h"
#include <sstream>

ace::medical::injuries::OpenWound::OpenWound(int anID, int aClassID, int aBodyPartId, double aPercentage, double aBl, double painAmount) :
    woundID(anID), classID(aClassID), bodyPart(aBodyPartId), percentage(aPercentage), bloodlossRate(aBl), pain(painAmount)
{
}

ace::medical::injuries::OpenWound::~OpenWound()
{
}

std::string ace::medical::injuries::OpenWound::AsString()
{
    std::stringstream stream;
    stream << "[" << woundID << "," << classID << "," << bodyPart << "," << 1 << "," << bloodlossRate << "]";
    return stream.str();
}
