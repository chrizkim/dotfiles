function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
	set_color $fish_color_cwd
	echo -n [(date +%H:%M:%S)] (prompt_pwd)

	set_color $fish_color_param
	printf '%s' (__fish_git_prompt)

	if not test $last_status -eq 0
	  set_color $fish_color_error
    echo -n " [$last_status]"
	end

	set_color normal
	echo -n '> '
end
