#ifndef INTEFACE_TARGET_4_HPP_
#define INTEFACE_TARGET_4_HPP_

#include <iostream>

struct IInterfaceTarget4
{

	IInterfaceTarget4()
	{
		std::cout<<"IInterfaceTarget4\n";
	}

	virtual ~IInterfaceTarget4() = default;

	virtual void fun_interface4() = 0;
};

#endif // INTEFACE_TARGET_4_HPP_
