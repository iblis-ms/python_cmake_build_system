#ifndef STATIC_TARGET_1_HPP_
#define STATIC_TARGET_1_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

struct CStaticTarget1 : IInterfaceTarget3
{

	virtual void fun_interface3() override;

	IInterfaceTarget2& getInterfaceTarget2();
};

#endif // STATIC_TARGET_1_HPP_
