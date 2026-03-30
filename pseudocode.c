array[x] = array_input;

search_term = search term input

mid_value = x/2; //this will need to be an integer

while (search_term != array[mid_value])
{
	if (search_term < array[mid_value]) {
		mid_value = (mid_value)/2;
	} else {
		mid_value = mid_value + (x - mid_value)/2;
	}

}

return mid_value;
