#include "MyClass.hpp"
#include <iostream>

void CMyClass::fun()
{
    std::cout<<"THIS IS simple_exec\n";
#ifdef THIS_IS_DEFINE
	std::cout<<"THIS_IS_DEFINE_VALUE: "<<THIS_IS_DEFINE_VALUE<<std::endl;
#endif // THIS_IS_DEFINE
}
