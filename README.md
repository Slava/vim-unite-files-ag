A plugin extending Unite.vim. Requires `ag` to be in the path to quickly put a
list of all files in nested folders into the filter buffer of Unite.

Limits the output by first 20000 lines.

Available options:

```
g:unite_ag_command			*g:unite_ag_command*
	Specifies an alternative command to use for subshelling to ag.

        The default value is 'ag'.

g:unite_ag_flags			*g:unite_ag_flags*
	Specifies an string of flags to use with ag.

        The default value is '-l -G'.
```

