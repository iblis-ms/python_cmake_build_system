#ifndef INTEFACE_TARGET_4_HPP_
#define INTEFACE_TARGET_4_HPP_

#include <iostream>

/**
 * @brief Inteface target 4.
 * 
 */
struct IInterfaceTarget4
{
	/**
	 * @brief Construct a new IInterfaceTarget4 object
	 * 
	 */
	IInterfaceTarget4()
	{
		std::cout<<"IInterfaceTarget4\n";
	}

	/**
	 * @brief Destroy the IInterfaceTarget4 object
	 * 
	 */
	virtual ~IInterfaceTarget4() = default;

	/**
	 * @brief Function.
	 * 
	 */
	virtual void fun_interface4() = 0;
};

#endif // INTEFACE_TARGET_4_HPP_
