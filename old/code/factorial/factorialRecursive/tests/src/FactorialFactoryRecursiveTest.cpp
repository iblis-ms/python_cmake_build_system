#include <gtest/gtest.h>
#include <memory>
#include "FactorialFactoryRecursive.hpp"
#include "FactorialRecursive.hpp"

TEST(RecursiveTest, create)
{
	CFactorialFactoryRecursive factory;
	const std::shared_ptr<IFactorialInterface> ptr = factory.create();
	const std::shared_ptr<CFactorialRecursive> castedPtr = std::dynamic_pointer_cast<CFactorialRecursive>(ptr);

	ASSERT_TRUE(static_cast<bool>(castedPtr));
}
