arg_list = argv();
rank = arg_list{1,1};
sample = arg_list{2, 1};

sample_out = fileread(strcat("input_sample_", sample, "/sample_data.txt"));
rank_call = strcat("This is rank_", rank, ", recieving the following input: \n");
output = strcat(rank_call, sample_out);
fprintf(output)
