#include "InjuryType.h"
#include "DamageType.h"

using namespace ace::medical;

injuries::InjuryType::InjuryType(signed int anId, const std::string& aClassname, std::vector<std::string>& allowedSelections, double theBloodLoss, double thePain, double minimumDamage, double maximumDamage, std::vector<std::string>& possibleCauses, std::string& aDisplayname)
    : ID(anId), className(aClassname), selections(allowedSelections), bloodLoss(theBloodLoss), pain(thePain), minDamage(minimumDamage), maxDamage(maximumDamage), causes(possibleCauses), displayName(aDisplayname)
{
}


injuries::InjuryType::~InjuryType()
{
}
