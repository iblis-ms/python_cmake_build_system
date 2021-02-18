#ifndef SHARED_TARGET_1_HPP_
#define SHARED_TARGET_1_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

/**
 * @brief Shared target 1 public class
 * 
 */
struct CSharedTarget1 : IInterfaceTarget3
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

#endif // SHARED_TARGET_1_HPP_
