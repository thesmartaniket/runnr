class runnr_flags:
    s_file_name : str
    s_extension : str
    s_custom_output_file_name : str
    s_extra_param : str
    s_extra_args : str

    b_run_after_compilatiion : bool
    b_debug_mode : bool

    def __init__(self):
        self.b_run_after_compilatiion = True
        self.b_debug_mode = False

        self.s_file_name : str = ''
        self.s_extension : str = ''
        self.s_custom_output_file_name : str = ''
        self.s_extra_param : str = ''
        self.s_extra_args : str = ''