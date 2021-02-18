#ifndef SHARED_TARGET_2_PRIVATE_HPP_
#define SHARED_TARGET_2_PRIVATE_HPP_

#include <iostream>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

/**
 * @brief Shared target 2 private class
 * 
 */
struct CSharedTarget2Private : IInterfaceTarget2
{
	/**
	 * @brief Function 2.
	 * 
	 */
	virtual void fun_interface2() override
	{
		std::cout<<"fun_interface2 from CSharedTarget2Private\n";
	}

	/**
	 * @brief Function 1.
	 * 
	 */
	virtual void fun_interface1() override
	{
		std::cout<<"fun_interface1 from CSharedTarget2Private\n";
	}
};

#endif // SHARED_TARGET_2_PRIVATE_HPP_
