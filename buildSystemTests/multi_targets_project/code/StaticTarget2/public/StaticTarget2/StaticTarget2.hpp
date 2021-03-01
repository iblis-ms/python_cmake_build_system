#ifndef STATIC_TARGET_2_HPP_
#define STATIC_TARGET_2_HPP_

#include <iostream>
#include <InterfaceTarget4/InterfaceTarget4.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

/**
 * @brief Shared target 2 public class
 * 
 */
struct CStaticTarget2 : IInterfaceTarget4
{
	/**
	 * @brief Function 4.
	 * 
	 */
	virtual void fun_interface4() override;

	/**
	 * @brief Get the Interface Target2 object
	 * 
	 * @return IInterfaceTarget2& 
	 */
	IInterfaceTarget2& getInterfaceTarget2();
};

#endif // STATIC_TARGET_2_HPP_
