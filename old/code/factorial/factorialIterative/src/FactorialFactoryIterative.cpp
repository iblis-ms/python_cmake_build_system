#include "FactorialFactoryIterative.hpp"
#include "FactorialIterative.hpp"


std::shared_ptr<IFactorialInterface> CFactorialFactoryIterative::create()
{
	return std::make_shared<CFactorialIterative>();
}