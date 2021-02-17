#ifndef SHARED_TARGET_2_HPP_
#define SHARED_TARGET_2_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

struct CSharedTarget2 : IInterfaceTarget3
{

	virtual void fun_interface3() override;

	IInterfaceTarget2& getInterfaceTarget2();
};

#endif // SHARED_TARGET_2_HPP_
