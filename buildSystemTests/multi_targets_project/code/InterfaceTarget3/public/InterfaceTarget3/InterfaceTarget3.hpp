#ifndef INTEFACE_TARGET_3_HPP_
#define INTEFACE_TARGET_3_HPP_

#include <iostream>

/**
 * @brief Inteface target 3.
 * 
 */
struct IInterfaceTarget3
{
	/**
	 * @brief Construct a new IInterfaceTarget3 object
	 * 
	 */
	IInterfaceTarget3()
	{
		std::cout<<"IInterfaceTarget3\n";
	}

	/**
	 * @brief Destroy the IInterfaceTarget3 object
	 * 
	 */
	virtual ~IInterfaceTarget3() = default;

	/**
	 * @brief Function.
	 * 
	 */
	virtual void fun_interface3() = 0;
};

#endif // INTEFACE_TARGET_3_HPP_
