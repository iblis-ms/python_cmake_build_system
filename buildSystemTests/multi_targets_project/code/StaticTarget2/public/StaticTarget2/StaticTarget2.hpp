#ifndef STATIC_TARGET_2_HPP_
#define STATIC_TARGET_2_HPP_

#include <iostream>
#include <InterfaceTarget4/InterfaceTarget4.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>

struct CStaticTarget2 : IInterfaceTarget4
{

	virtual void fun_interface4() override;

	IInterfaceTarget2& getInterfaceTarget2();
};

#endif // STATIC_TARGET_2_HPP_
