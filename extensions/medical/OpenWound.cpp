#include "OpenWound.h"
#include <sstream>

using namespace ace::medical;

injuries::OpenWound::OpenWound(unsigned int anID, unsigned int aBodyPart, unsigned int bloodloss) : classID(anID), bodyPart(aBodyPart), bloodlossRate(bloodloss)
{
}

injuries::OpenWound::~OpenWound()
{
}

std::string injuries::OpenWound::AsString()
{
    std::stringstream stream;
    stream << classID << "," << bodyPart << "," << 1 << "," << bloodlossRate;
    return stream.str();
}
