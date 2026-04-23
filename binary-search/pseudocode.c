array = &search_array[0];
size = sizeOf(search_array);
term = searchTerm;

low_index = 0;
high_index = size - 1;
mid_index = 0;

while (term != array[mid_index])
{
	mid_index = int[low_index + (high_index - low_index)/2];
	if (term < array[mid_value]) {
		high_index = mid_index - 1;
	} else {
		low_index = mid_index + 1;
	}
}

return mid_index;
