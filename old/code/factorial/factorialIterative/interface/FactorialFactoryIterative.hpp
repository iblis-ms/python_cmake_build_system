#ifndef FACTORIAL_FACTORY_ITERATIVE_HPP_
#define FACTORIAL_FACTORY_ITERATIVE_HPP_

#include <filesystem>
#include <memory>

#include "FactorialFactoryInterface.hpp"

class CFactorialFactoryIterative : public IFactorialFactoryInterface
{
public:
	virtual ~CFactorialFactoryIterative() = default;

	virtual std::shared_ptr<IFactorialInterface> create();
};

#endif // FACTORIAL_FACTORY_ITERATIVE_HPP_