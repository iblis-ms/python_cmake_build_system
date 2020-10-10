#ifndef LIB_HPP_
#define LIB_HPP_

#include <cstdint>
#include <boost/smart_ptr/shared_ptr.hpp>

class CLib
{
public:

	boost::shared_ptr<int> create(uint32_t aInput);

};

#endif // LIB_HPP_