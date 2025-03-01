## Basic Commands

| Command | Description |
|---------|-------------|
| `git clone <URL>` | Clone a repository to local machine |
| `git config -l` | Show all Git configuration |
| `git config --global -l` | Show global Git configuration |
| `git config --local -l` | Show repository-specific configuration |
| `git config --[global\|local] user.name "NAME"` | Set username globally or locally |
| `git config --[global\|local] user.email "EMAIL"` | Set email globally or locally |

## Managing Multiple Identities

1. **Generate SSH Keys:**
   ```sh
   # Create SSH keys for each identity
   ssh-keygen -t ed25519 -C "work@example.com" -f ~/.ssh/id_ed25519_work
   ssh-keygen -t ed25519 -C "personal@example.com" -f ~/.ssh/id_ed25519_personal
   ```

2. **Configure SSH:**
   ```sh
   # Edit SSH config
   nvim ~/.ssh/config
   ```
   ```
   Host github.com-work
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_work
       AddKeysToAgent yes

   Host github.com-personal
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_personal
       AddKeysToAgent yes
   ```

3. **Configure Git:**
   ```sh
   # Edit global Git config
   nvim ~/.gitconfig
   ```
   ```
   [includeIf "gitdir:~/work/"]
       path = ~/.gitconfig-work

   [includeIf "gitdir:~/personal/"]
       path = ~/.gitconfig-personal
   ```

4. **Set Up Identity Configs:**
   ```sh
   # Work identity
   nvim ~/.gitconfig-work
   ```
   ```
   [user]
       name = Work Name
       email = work@example.com
   ```

   ```sh
   # Personal identity
   nvim ~/.gitconfig-personal
   ```
   ```
   [user]
       name = Personal Name
       email = personal@example.com
   ```

## Examples

1. **Create Directory Structure:**
   ```sh
   # Set up workspace directories
   mkdir -p ~/work ~/personal
   ```

2. **Clone Repositories:**
   ```sh
   # Clone using work identity to work directory
   git clone git@github.com-work:organization/project.git ~/work/project

   # Clone using personal identity to personal directory
   git clone git@github.com-personal:username/repo.git ~/personal/repo
   ```

3. **Verify Configurations:**
   ```sh
   # Check work project configuration
   cd ~/work/project
   git config user.name
   git config user.email
   # Output:
   # Work Name
   # work@example.com

   # Check personal project configuration
   cd ~/personal/repo
   git config user.name
   git config user.email
   # Output:
   # Personal Name
   # personal@example.com
   ```
