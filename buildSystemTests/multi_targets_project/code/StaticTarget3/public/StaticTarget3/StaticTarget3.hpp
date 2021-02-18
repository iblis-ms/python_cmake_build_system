#ifndef STATIC_TARGET_3_HPP_
#define STATIC_TARGET_3_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>
#include <InterfaceTarget4/InterfaceTarget4.hpp>
#include <StaticTarget1/StaticTarget1.hpp>
#include <StaticTarget2/StaticTarget2.hpp>

/**
 * @brief Shared target 3 public class
 * 
 */
struct CStaticTarget3 : IInterfaceTarget3, IInterfaceTarget4
{
	/**
	 * @brief Function 3.
	 * 
	 */
	virtual void fun_interface3() override;

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

	/**
	 * @brief Get the Static Target1 object
	 * 
	 * @return CStaticTarget1& 
	 */
	CStaticTarget1& getStaticTarget1();

	/**
	 * @brief Get the Static Target2 object
	 * 
	 * @return CStaticTarget2& 
	 */
	CStaticTarget2& getStaticTarget2();

};

#endif // STATIC_TARGET_3_HPP_
