#include "OpenWound.h"
#include <sstream>

ace::medical::injuries::OpenWound::OpenWound(double anID, double aBodyPart, double bloodloss) : classID(anID), bodyPart(aBodyPart), bloodlossRate(bloodloss)
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
