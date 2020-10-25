#ifndef FACTORIAL_FACTORY_RECURSIVE_HPP_
#define FACTORIAL_FACTORY_RECURSIVE_HPP_

#include <filesystem>
#include <memory>

#include "FactorialFactoryInterface.hpp"

class CFactorialFactoryRecursive : public IFactorialFactoryInterface
{
public:
	virtual ~CFactorialFactoryRecursive() = default;

	virtual std::shared_ptr<IFactorialInterface> create();
};

#endif // FACTORIAL_FACTORY_RECURSIVE_HPP_
