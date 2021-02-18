#ifndef INTEFACE_TARGET_2_HPP_
#define INTEFACE_TARGET_2_HPP_

#include <iostream>
#include <InterfaceTarget1/InterfaceTarget1.hpp>

/**
 * @brief Inteface target 2.
 * 
 */
struct IInterfaceTarget2 : IInterfaceTarget1
{
	/**
	 * @brief Construct a new IInterfaceTarget2 object
	 * 
	 */
	IInterfaceTarget2()
	{
		std::cout<<"IInterfaceTarget2\n";
	}

	/**
	 * @brief Destroy the IInterfaceTarget2 object
	 * 
	 */
	virtual ~IInterfaceTarget2() = default;

	/**
	 * @brief Function.
	 * 
	 */
	virtual void fun_interface2() = 0;
};

#endif // INTEFACE_TARGET_2_HPP_
