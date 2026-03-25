# gitcl wrapper - git clone alternative with auto cd
# Wraps the gitcl binary script to automatically cd into cloned directory

gitcl() {
    local output
    local target_dir

    # Call the gitcl script and capture output
    output=$(/Users/akarsh/.akarsh/bin/gitcl "$@" 2>&1)
    local exit_code=$?

    # Print the output
    echo "$output"

    # If successful (exit code 0), extract and cd to the directory
    # The script outputs the directory path as the last line on success
    if [[ $exit_code -eq 0 ]] && [[ ! "$1" =~ ^(-h|--help)$ ]]; then
        target_dir=$(echo "$output" | tail -1)
        if [[ -d "$target_dir" ]]; then
            cd "$target_dir"
        fi
    fi

    return $exit_code
}
