#ifndef INTEFACE_TARGET_3_HPP_
#define INTEFACE_TARGET_3_HPP_

#include <iostream>

struct IInterfaceTarget3
{
	IInterfaceTarget3()
	{
		std::cout<<"IInterfaceTarget3\n";
	}

	virtual ~IInterfaceTarget3() = default;

	virtual void fun_interface3() = 0;
};

#endif // INTEFACE_TARGET_3_HPP_
