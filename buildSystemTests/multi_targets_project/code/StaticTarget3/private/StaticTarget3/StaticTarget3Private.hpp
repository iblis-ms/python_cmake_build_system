#ifndef STATIC_TARGET_3_PRIVATE_HPP_
#define STATIC_TARGET_3_PRIVATE_HPP_

#include <iostream>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

/**
 * @brief Static target 3 private class
 * 
 */
struct CStaticTarget3Private : IInterfaceTarget2
{
	/**
	 * @brief Function 2.
	 * 
	 */
	virtual void fun_interface2() override
	{
		std::cout<<"fun_interface2 from CStaticTarget3Private\n";
	}

	/**
	 * @brief Function 1.
	 * 
	 */
	virtual void fun_interface1() override
	{
		std::cout<<"fun_interface1 from CStaticTarget3Private\n";
	}
};

#endif // STATIC_TARGET_3_PRIVATE_HPP_
