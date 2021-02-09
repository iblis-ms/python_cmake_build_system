#include "FactorialFactoryRecursive.hpp"
#include "FactorialRecursive.hpp"


std::shared_ptr<IFactorialInterface> CFactorialFactoryRecursive::create()
{
	return std::make_shared<CFactorialRecursive>();
}
