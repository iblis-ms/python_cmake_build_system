#ifndef FACTORIAL_FACTORY_INTERFACE_HPP_
#define FACTORIAL_FACTORY_INTERFACE_HPP_

#include <filesystem>
#include <memory>

#include "FactorialInterface.hpp"

class IFactorialFactoryInterface
{
public:
	virtual ~IFactorialFactoryInterface() = default;

	virtual std::shared_ptr<IFactorialInterface> create() = 0;
};

#endif // FACTORIAL_FACTORY_INTERFACE_HPP_