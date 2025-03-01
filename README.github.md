## Basic Commands

| Command | Description |
|---|---|
| `git clone <URL>` | Clone a repository from a remote URL. |
| `git config -l` | List all Git configuration settings. |
| `git config --global user.name "Your Name"` | Set your global Git username. |
| `git config --global user.email "your.email@example.com"` | Set your global Git email. |

## Managing Multiple Identities for SSH and Git

1. **Generate SSH keys for each identity:**
   ```sh
   ssh-keygen -t ed25519 -C "your.email@example.com" -f ~/.ssh/id_ed25519_identity1
   ssh-keygen -t ed25519 -C "your.other.email@example.com" -f ~/.ssh/id_ed25519_identity2
   ```

2. **Create or update the SSH config file:**
   ```sh
   nvim ~/.ssh/config
   ```

   Add the following content:
   ```
   Host github.com-identity1
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_identity1
       AddKeysToAgent yes

   Host github.com-identity2
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_identity2
       AddKeysToAgent yes
   ```

3. **Set up Git config to include specific configurations based on the repository directory:**
   ```sh
   nvim ~/.gitconfig
   ```

   Add the following content:
   ```
   [includeIf "gitdir:~/identity1/"]
       path = ~/.gitconfig-identity1

   [includeIf "gitdir:~/identity2/"]
       path = ~/.gitconfig-identity2
   ```

4. **Create the specific Git configuration files for each identity:**
   ```sh
   nvim ~/.gitconfig-identity1
   ```

   Add the following content:
   ```
   [user]
       name = Your Name for Identity 1
       email = your.email@example.com
   ```

   ```sh
   nvim ~/.gitconfig-identity2
   ```

   Add the following content:
   ```
   [user]
       name = Your Name for Identity 2
       email = your.other.email@example.com
   ```

## Examples

To use the commands and configurations provided in this document, follow these steps:

1. **Clone a repository:**
   ```sh
   # Create directories for identity1 and identity2
   mkdir -p ~/identity1 ~/identity2

   # Uses SSH identity 'github.com-identity1' and clones to '~/identity1/repo'
   git clone git@github.com-identity1:username/repo.git ~/identity1/repo
   # Uses SSH identity 'github.com-identity2' and clones to '~/identity2/repo'
   git clone git@github.com-identity2:username/repo.git ~/identity2/repo
   ```

2. **View Git configurations for each repository:**
   ```sh
   cd ~/identity1/repo
   git config user.name
   git config user.email
   # Output:
   # user.name=Your Name for Identity 1
   # user.email=your.email@example.com

   cd ~/identity2/repo
   git config user.name
   git config user.email
   # Output:
   # user.name=Your Name for Identity 2
   # user.email=your.other.email@example.com
   ```

## Git Config for This Workspace

To view the Git configuration for this workspace, use the following command:
```sh
git config -l
```

This will display all the Git configuration settings for the current workspace, including user details, SSH settings, and any other configurations that have been set.
