module main;
import std;
import a;

int main()
{
    std::cout << "module" << std::endl;
    std::cout << a::add(1, 2) << std::endl;
    return 0;
}
