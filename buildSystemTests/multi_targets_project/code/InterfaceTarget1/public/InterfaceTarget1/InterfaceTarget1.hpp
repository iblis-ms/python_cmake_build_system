#ifndef INTEFACE_TARGET_1_HPP_
#define INTEFACE_TARGET_1_HPP_

#include <iostream>

/**
 * @brief Inteface target 1.
 * 
 */
struct IInterfaceTarget1
{
	/**
	 * @brief Construct a new IInterfaceTarget1 object.
	 * 
	 */
	IInterfaceTarget1()
	{
		std::cout<<"IInterfaceTarget1\n";
	}
	
	/**
	 * @brief Destroy the IInterfaceTarget1 object
	 * 
	 */
	virtual ~IInterfaceTarget1() = default;

	/**
	 * @brief Function.
	 * 
	 */
	virtual void fun_interface1() = 0;
};

#endif // INTEFACE_TARGET_1_HPP_
