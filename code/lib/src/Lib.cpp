#include "Lib.hpp"
#include <boost/smart_ptr/make_shared.hpp>

boost::shared_ptr<int> CLib::create(uint32_t aInput)
{
	boost::shared_ptr<int> ptr = boost::make_shared<int>(0);
	return ptr;

}