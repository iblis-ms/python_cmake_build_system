#include <cstdio>
#include <cstdlib>
#include <iostream>


int main(int argc, char** argv) {
        {
        int a;
        int c = 2*a;
        std::cout<<c<<std::endl;
    }
    {
        int a[20];
        int b = a[20];
    }
    {
        int* ptr = new int;
        *ptr = 1;
        std::cout<<*ptr<<std::endl;
    }
    {
        int* ptr = new int[2];
        int index;
        std::cout<<ptr[index]<<std::endl;
        ptr[index] = 10;
        std::cout<<ptr[index]<<std::endl;
        delete ptr;
    }
    {
        int* ptr = (int*)malloc(sizeof(int));
        delete ptr;
    }
    {
        FILE * pFile;
        pFile = fopen ("myfile.txt","w");
        if (pFile!=NULL)
        {
            fputs ("fopen example",pFile);
        }
    }

  return 0;
}