#include "memory.h"
#include <stdlib.h>

int		main()
{
	int i;
	char *addr;

	i = 0;
	while (i < 1024)
	{
		addr = (char *)malloc(1024);
		addr[0] = 42;
		i++;
	}
	//show_alloc_map();
	// my_free(addr);

	return (0);
}
