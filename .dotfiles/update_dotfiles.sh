#!/bin/bash

# Define the dotfiles command
DOTFILES_CMD="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

update_all_dotfiles() {
    echo "Checking status of all dotfiles..."
    $DOTFILES_CMD status

    # Show a detailed diff of all changes
    echo "Showing all changes in dotfiles..."
    $DOTFILES_CMD diff

    read -p "Do you want to stage all these changes? (y/n) " answer
    if [[ $answer = y ]] ; then
        # Stage all changes
        $DOTFILES_CMD add -u
        echo "All changes staged."

        # Show staged changes
        echo "Here are the changes staged for commit:"
        $DOTFILES_CMD diff --cached

        read -p "Enter a commit message: " message
        $DOTFILES_CMD commit -m "$message"
        echo "Changes committed."

        echo "Pushing changes to remote repository..."
        $DOTFILES_CMD push

        echo "All dotfiles updated successfully!"
    else
        # Offer to stage individual files
        echo "Would you like to stage individual files instead?"
        read -p "Enter y for yes, any other key to cancel: " individual
        if [[ $individual = y ]] ; then
            while true; do
                $DOTFILES_CMD status
                read -p "Enter the file path to stage (or 'done' to finish): " file
                if [[ $file = "done" ]] ; then
                    break
                fi
                $DOTFILES_CMD add "$file"
                echo "File staged: $file"
            done

            if [[ $($DOTFILES_CMD diff --cached --quiet; echo $?) -eq 1 ]] ; then
                read -p "Enter a commit message: " message
                $DOTFILES_CMD commit -m "$message"
                echo "Changes committed."

                echo "Pushing changes to remote repository..."
                $DOTFILES_CMD push

                echo "Selected dotfiles updated successfully!"
            else
                echo "No changes were staged. Update cancelled."
            fi
        else
            echo "Update cancelled."
        fi
    fi
}

# Run the function
update_all_dotfiles
