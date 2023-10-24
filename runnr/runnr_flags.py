class runnr_flags:
    s_file_name : str
    s_extension : str
    s_custom_output_file_name : str
    s_extra_param_list : str
    s_extra_args_list : str
    l_file_names : list

    b_run_after_compilatiion : bool
    b_custom_output_name : bool
    b_debug_mode : bool
    b_extra_param : bool
    b_extra_args : bool
    b_multiple_files : bool
    def __init__(self):
        self.b_run_after_compilatiion = True
        self.b_custom_output_name = False
        self.b_debug_mode = False
        self.b_extra_param = False
        self.b_extra_args = False
        self.b_multiple_files=False