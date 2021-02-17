#ifndef SHARED_TARGET_1_HPP_
#define SHARED_TARGET_1_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

struct CSharedTarget1 : IInterfaceTarget3
{

	virtual void fun_interface3() override;

	IInterfaceTarget2& getInterfaceTarget2();
};

#endif // SHARED_TARGET_1_HPP_
