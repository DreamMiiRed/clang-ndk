#include <string>
#include <iostream>
// #include <filesystem>
// namespace fs = std::filesystem;


int main(int argc, char* argv[])
{
    std::cout << "cpy " << argv[1] << " " << argv[2] << std::endl;
    // std::string path = "output";
    // for (const auto & entry : fs::directory_iterator(path))
    //     std::cout << entry.path() << std::endl;
}
