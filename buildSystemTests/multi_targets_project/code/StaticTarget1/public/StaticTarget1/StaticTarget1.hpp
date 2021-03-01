#ifndef STATIC_TARGET_1_HPP_
#define STATIC_TARGET_1_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

/**
 * @brief Shared target 1 public class
 * 
 */
struct CStaticTarget1 : IInterfaceTarget3
{
	/**
	 * @brief Function 3.
	 * 
	 */
	virtual void fun_interface3() override;

	/**
	 * @brief Get the Interface Target2 object
	 * 
	 * @return IInterfaceTarget2& 
	 */
	IInterfaceTarget2& getInterfaceTarget2();
};

#endif // STATIC_TARGET_1_HPP_
