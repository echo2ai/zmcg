# Example Usage Scenarios

```markdown
# zmcg - Usage Examples

Real-world examples of managing multiple Git accounts with zmcg.

## Scenario 1: Work and Personal Accounts

### Create Work Profile

```bash
zmcg create
```

Answer the prompts:
```
Enter profile name (e.g., work, personal): work
Enter your Git username: John Doe
Enter your Git email: john@company.com
Which Git platform are you using?
  1) GitHub (github.com)
  2) GitLab (gitlab.com)
  3) Other (custom domain)
Enter choice (1-3): 1
```

Output:
```
==> Generating SSH key for john@company.com...
[✓] SSH key generated: /Users/john/.ssh/id_rsa_work
[✓] SSH config added: Host work -> github.com
[✓] Profile info saved: /Users/john/.ssh/.zmcg-work

===============================================================================
COPY THE PUBLIC KEY BELOW AND ADD IT TO YOUR GIT PLATFORM (Github/GitLab/etc)
===============================================================================
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC7... john@company.com
===============================================================================

==> Testing SSH connection...
[✓] SSH test passed for: work

[✓] Profile 'work' setup complete!

==> Next steps:
  1. Copy the public key shown above
  2. Go to github.com and add it to SSH Keys in your account settings
  3. In any Git repository, run: zmcg switch work
  4. Verify: git config user.name && git config user.email
```

### Create Personal Profile

```bash
zmcg create
```

Answer with:
```
Enter profile name (e.g., work, personal): personal
Enter your Git username: Johnny
Enter your Git email: johnny@gmail.com
Choose platform: 1
```

### List All Profiles

```bash
zmcg list
```

Output:
```
[INFO] Your Git profiles:
  - work (john@company.com)
  - personal (johnny@gmail.com)
[INFO] Total profiles: 2
```

## Scenario 2: Using Profiles in Repositories

### Work Repository

```bash
# Clone using the profile name as host
git clone git@work:company/project.git
cd project

# Set this repository to use 'work' profile
zmcg switch work

# Verify configuration
git config user.name
# Output: John Doe
git config user.email
# Output: john@company.com

# Now commits will use this profile's name and email
```

### Personal Repository

```bash
git clone git@personal:johnny/myblog.git
cd myblog

# Switch to personal profile
zmcg switch personal

# Verify
git config user.name
# Output: Johnny
git config user.email
# Output: johnny@gmail.com
```

## Scenario 3: Multiple Platforms

### GitLab Account

```bash
zmcg create gitlab john john@company.com gitlab.com
```

### Custom Git Server

```bash
zmcg create client bob bob@client.com git.client.com
```

## Scenario 4: If You Forget the Public Key

If you need to see the public key again:

```bash
zmcg key work
```

It will display the public key so you can copy and add it to your Git platform.

## SSH Configuration Generated

After running `zmcg create`, your `~/.ssh/config` is automatically updated:

```
# zmcg managed: work
Host work
    HostName github.com
    User git
    IdentityFile /Users/john/.ssh/id_rsa_work
    PreferredAuthentications publickey
    AddKeysToAgent yes
    UseKeychain yes

# zmcg managed: personal
Host personal
    HostName github.com
    User git
    IdentityFile /Users/john/.ssh/id_rsa_personal
    PreferredAuthentications publickey
    AddKeysToAgent yes
    UseKeychain yes
```

## Common Commands

```bash
# Create new profile
zmcg create

# Create profile with all parameters
zmcg create work john john@company.com github.com

# Show all profiles
zmcg list

# Use profile in current repository
zmcg switch work

# Show public key (if you need to add it to Git platform later)
zmcg key work

# Test SSH connection
ssh -T git@work
ssh -T git@personal

# Check current repository configuration
git config user.name
git config user.email
git config --local --list
```

## Troubleshooting

### SSH Test Failed?

This is normal if you haven't added the public key to your Git platform yet.

Steps to fix:
1. Run: `zmcg key <profile>` to see the public key
2. Copy it
3. Go to GitHub/GitLab Settings → SSH Keys → Add new key
4. Paste the key and save
5. Try again: `ssh -T git@<profile>`

### Wrong Profile in Repository?

Switch to the correct one:
```bash
zmcg switch work
```

Verify:
```bash
git config user.email
```

### Need to Check All Profiles?

```bash
zmcg list
```

## Tips

1. **Use descriptive names** - "work", "personal", "client-a" are clear
2. **Always add the public key** - SSH won't work without it
3. **Test after adding key** - `ssh -T git@work`
4. **Each repository can have different profile** - Use `zmcg switch`
5. **Check config before committing** - `git config user.email`

---

**That's it! Managing multiple Git accounts has never been easier.** 🎉



```