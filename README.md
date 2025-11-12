# zmcg - Zero Multi Config Git

## Overview

A beginner-friendly tool for managing multiple Git accounts with SSH keys

## What is zmcg?

`zmcg` helps you set up and manage multiple Git accounts (GitHub, GitLab, etc.) on one computer. It automates SSH key generation and configuration, making it super easy - even for beginners!

## Problem It Solves

Setting up multiple Git accounts usually requires:

- Manually generating SSH keys
- Manually editing `~/.ssh/config`
- Manually switching Git configuration between repositories

**zmcg does all of this for you automatically.**

## Quick Start (3 steps)

### Step 1: Create a Profile

```bash
zmcg create
```

Answer the questions:

- Profile name? (e.g., `work`, `personal`)
- Your name? (e.g., `John Doe`)
- Your email? (e.g., `john@company.com`)
- Git platform? (GitHub, GitLab, or custom)

### Step 2: Copy the Public Key

The tool will show your public key. **Copy it.**

### Step 3: Add Key to Your Git Platform

1. Go to GitHub/GitLab
2. Go to Settings → SSH Keys → Add new key
3. Paste the key you copied
4. Save

Done! Now you can use this account.

## Using Profiles in Your Repository

```bash
cd my-project
zmcg switch work
git config user.name  # Shows: John Doe
git config user.email # Shows: john@company.com
```

## Manage Multiple Accounts

Create as many profiles as you need:

```bash
# Work account
zmcg create work john john@company.com github.com

# Personal account
zmcg create personal jane jane@gmail.com github.com

# Client account
zmcg create client bob bob@client.com github.com
```

Then switch between them in any repository:

```bash
cd work-project
zmcg switch work

cd personal-project
zmcg switch personal
```

## All Commands

| Command | What it does |
|---------|------------|
| `zmcg create` | Create new profile (interactive) |
| `zmcg create work john john@company.com github.com` | Create profile directly |
| `zmcg switch work` | Use this profile in current repo |
| `zmcg list` | Show all profiles |
| `zmcg key work` | Show public key again |
| `zmcg help` | Show help |

## Installation

### Option 1: Using install script (recommended)

```bash
git clone https://github.com/yourusername/zmcg.git
cd zmcg/src
chmod +x install.sh
sudo ./install.sh
```

Then use it anywhere:

```bash
zmcg create
```

### Option 2: Manual

```bash
git clone https://github.com/yourusername/zmcg.git
cd zmcg/src
./zmcg create  # Run from directory
```

## How It Works

1. **Generates SSH Key**: Creates a secure RSA 4096-bit key
2. **Configures SSH**: Adds Host entry to `~/.ssh/config`
3. **Saves Profile**: Stores your account info
4. **Shows Public Key**: For you to copy to GitHub/GitLab
5. **Tests Connection**: Makes sure everything works

## Where Stuff Gets Saved

- **SSH Private Key**: `~/.ssh/id_rsa_<profile_name>`
- **SSH Public Key**: `~/.ssh/id_rsa_<profile_name>.pub`
- **SSH Config**: `~/.ssh/config`
- **Profile Info**: `~/.ssh/.zmcg-<profile_name>`

## Common Questions

**Q: Is it safe?**
A: Yes! Uses standard SSH keys with proper permissions (600).

**Q: Can I use this for GitHub, GitLab, Gitea, etc?**
A: Yes! Any Git platform that supports SSH.

**Q: Can I create more profiles later?**
A: Yes! Just run `zmcg create` again.

**Q: How do I delete a profile?**
A: Delete these files:

```bash
rm ~/.ssh/id_rsa_<profile_name>
rm ~/.ssh/id_rsa_<profile_name>.pub
rm ~/.ssh/.zmcg-<profile_name>
```

Then manually remove the Host entry from `~/.ssh/config`.

**Q: How do I verify the setup?**
A: After adding the public key to your Git platform:

```bash
ssh -T git@work     # Should show success message
```

## Requirements

- macOS or Linux
- Git installed
- OpenSSH (usually pre-installed)
- Bash shell

## Support

If you have issues:

1. Check that Git is installed: `git --version`
2. Check that SSH works: `ssh -T git@github.com`
3. Make sure you added the public key to your Git platform
4. Read the full example in `example-usage.md`

## License

MIT License

---

**Made simple for beginners, powerful for everyone.** 🚀
