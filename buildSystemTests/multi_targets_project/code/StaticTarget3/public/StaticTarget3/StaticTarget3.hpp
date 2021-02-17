#ifndef STATIC_TARGET_3_HPP_
#define STATIC_TARGET_3_HPP_

#include <iostream>
#include <InterfaceTarget3/InterfaceTarget3.hpp>
#include <InterfaceTarget2/InterfaceTarget2.hpp>
#include <InterfaceTarget4/InterfaceTarget4.hpp>
#include <StaticTarget1/StaticTarget1.hpp>
#include <StaticTarget2/StaticTarget2.hpp>

struct CStaticTarget3 : IInterfaceTarget3, IInterfaceTarget4
{

	virtual void fun_interface3() override;

	virtual void fun_interface4() override;

	IInterfaceTarget2& getInterfaceTarget2();

	CStaticTarget1& getStaticTarget1();

	CStaticTarget2& getStaticTarget2();

};

#endif // STATIC_TARGET_3_HPP_
