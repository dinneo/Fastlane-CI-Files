
def increase_build_number(plist_file)
	build_number = number_of_commits
    set_info_plist_value(
      path: plist_file,
      key: 'CFBundleVersion',
      value: "#{build_number}"
    )
    return build_number
end

def current_branch
	branch = sh "branch_name=$(git symbolic-ref -q HEAD); branch_name=${branch_name##refs/heads/};branch_name=${branch_name:-HEAD};echo $branch_name"
	return branch.gsub("\n", '')
end