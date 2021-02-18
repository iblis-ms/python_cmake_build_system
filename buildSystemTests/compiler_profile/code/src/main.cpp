#include <iostream>

/**
 * @brief Get the name of compiler
 * 
 * @return const char* name of compiler
 */
const char* getCompiler()
{
#if defined(__clang__)
	return "clang++";
#elif defined(__GNUC__) || defined(__GNUG__)
	return "g++";
#elif defined(_MSC_VER)
	return "cl";
#else
	return "Unknown compiler";
#endif
}

/**
 * @brief Get the information if the build was Release or Debug.
 * 
 * @return const char* build profile.
 */
const char* getProfile()
{
#if ((ADD_TARGET_RELEASE == 1) && (!defined(ADD_TARGET_DEBUG)))
	return "Release";
#elif ((ADD_TARGET_DEBUG == 1) && (!defined(ADD_TARGET_RELEASE)))
	return "Debug";
#else
	return "Unknown profile";
#endif 
}

/**
 * @brief Get C++ standard
 * 
 * @return const char* C++ standard.
 */
const char* getCppStd()
{

#if __cplusplus == 199711L
	return "C++98";
#elif __cplusplus == 201103L
	return "C++11";
#elif __cplusplus == 201402L
	return "C++14";
#elif __cplusplus == 201703L
	return "C++17";
#elif __cplusplus > 201703L
	return "C++20";
#else
	return "Unknown standard";
#endif
}

int main()
{
	std::cout << __cplusplus << std::endl;
	std::cout<<getCompiler()<<" "<<getProfile()<<" "<<getCppStd()<<std::endl;
    return 0;
}
