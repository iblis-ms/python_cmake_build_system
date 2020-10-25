#include <gtest/gtest.h>

#include "FactorialFactoryIterative.hpp"
#include "FactorialIterative.hpp"
#include <memory>

TEST(IterativeTest, create)
{
	CFactorialFactoryIterative factory;
	const std::shared_ptr<IFactorialInterface> ptr = factory.create();
	const std::shared_ptr<CFactorialIterative> castedPtr = std::dynamic_pointer_cast<CFactorialIterative>(ptr);

	ASSERT_TRUE(static_cast<bool>(castedPtr));
}