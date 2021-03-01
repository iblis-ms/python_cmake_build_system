#ifndef STATIC_TARGET_2_PRIVATE_HPP_
#define STATIC_TARGET_2_PRIVATE_HPP_

#include <iostream>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

/**
 * @brief Static target 2 private class
 * 
 */
struct CStaticTarget2Private : IInterfaceTarget2
{
	/**
	 * @brief Function 2.
	 * 
	 */
	virtual void fun_interface2() override
	{
		std::cout<<"fun_interface2 from CStaticTarget2Private\n";
	}

	/**
	 * @brief Function 1.
	 * 
	 */
	virtual void fun_interface1() override
	{
		std::cout<<"fun_interface1 from CStaticTarget2Private\n";
	}
};

#endif // STATIC_TARGET_2_PRIVATE_HPP_
