git_diff_with_prev_commit() {
    #Show diff of the specified commit with its previous commit id 
    git diff "$1^!"
}
