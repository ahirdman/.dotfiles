#!/usr/bin/env bash
# bootstrap-ha.sh — One-time setup for Home Assistant dev environment
# Run this on the HA Pi after SSH'ing in: ./bootstrap-ha.sh

set -euo pipefail

DATA_DIR="/data"
BIN_DIR="$DATA_DIR/bin"
DOTFILES_DIR="$DATA_DIR/.dotfiles"
REPO="git@github.com:ahirdman/.dotfiles.git"

echo "=== HA Dev Environment Bootstrap ==="
echo ""

# -----------------------------------------------
# 1. Create persistent bin directory
# -----------------------------------------------
echo "[1/8] Creating persistent bin directory..."
mkdir -p "$BIN_DIR"

# -----------------------------------------------
# 2. Install oh-my-posh
# -----------------------------------------------
echo "[2/8] Installing oh-my-posh..."
if [ -f "$BIN_DIR/oh-my-posh" ]; then
  echo "  -> Already installed, skipping."
else
  curl -sSfL https://ohmyposh.dev/install.sh | bash -s -- -d "$BIN_DIR"
fi

# -----------------------------------------------
# 3. Install zoxide
# -----------------------------------------------
echo "[3/8] Installing zoxide..."
if [ -f "$BIN_DIR/zoxide" ]; then
  echo "  -> Already installed, skipping."
else
  curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh -s -- --bin-dir "$BIN_DIR"
fi

# -----------------------------------------------
# 4. Install Ghostty terminfo
# -----------------------------------------------
echo "[4/8] Installing Ghostty terminfo..."
infocmp xterm-ghostty >/dev/null 2>&1 && echo "  -> Already installed, skipping." || {
  cat <<'TERMINFO' | tic -x -
xterm-ghostty|ghostty|Ghostty,
	am, bce, ccc, hs, km, mc5i, mir, msgr, npc, xenl, AX, Su, Tc, XT,
	colors#256, cols#80, it#8, lines#24, pairs#32767,
	acsc=++\,\,--..00``aaffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyyzz{{||}}~~,
	bel=^G, blink=\E[5m, bold=\E[1m, cbt=\E[Z, civis=\E[?25l,
	clear=\E[H\E[2J, cnorm=\E[?12l\E[?25h, cr=\r,
	csr=\E[%i%p1%d;%p2%dr, cub=\E[%p1%dD, cub1=^H,
	cud=\E[%p1%dB, cud1=\n, cuf=\E[%p1%dC, cuf1=\E[C,
	cup=\E[%i%p1%d;%p2%dH, cuu=\E[%p1%dA, cuu1=\E[A,
	cvvis=\E[?12;25h, dch=\E[%p1%dP, dch1=\E[P, dim=\E[2m,
	dl=\E[%p1%dM, dl1=\E[M, dsl=\E]2;\E\\, ech=\E[%p1%dX,
	ed=\E[J, el=\E[K, el1=\E[1K, flash=\E[?5h$<100/>\E[?5l,
	fsl=^G, home=\E[H, hpa=\E[%i%p1%dG, ht=^I, hts=\EH,
	ich=\E[%p1%d@, il=\E[%p1%dL, il1=\E[L, ind=\n,
	indn=\E[%p1%dS, initc=\E]4;%p1%d;rgb\:%p2%{255}%*%{1000}%/%2.2X/%p3%{255}%*%{1000}%/%2.2X/%p4%{255}%*%{1000}%/%2.2X\E\\,
	invis=\E[8m, is2=\E[!p\E[?3;4l\E[4l\E>, kDC=\E[3;2~,
	kEND=\E[1;2F, kHOM=\E[1;2H, kIC=\E[2;2~, kLFT=\E[1;2D,
	kNXT=\E[6;2~, kPRV=\E[5;2~, kRIT=\E[1;2C, ka1=\E[1~,
	ka3=\E[5~, kbs=^?, kc1=\E[4~, kc3=\E[6~, kcbt=\E[Z,
	kcub1=\EOD, kcud1=\EOB, kcuf1=\EOC, kcuu1=\EOA,
	kdch1=\E[3~, kend=\EOF, kent=\EOM, kf1=\EOP, kf10=\E[21~,
	kf11=\E[23~, kf12=\E[24~, kf13=\E[1;2P, kf14=\E[1;2Q,
	kf15=\E[1;2R, kf16=\E[1;2S, kf17=\E[15;2~, kf18=\E[17;2~,
	kf19=\E[18;2~, kf2=\EOQ, kf20=\E[19;2~, kf21=\E[20;2~,
	kf22=\E[21;2~, kf23=\E[23;2~, kf24=\E[24;2~,
	kf25=\E[1;5P, kf26=\E[1;5Q, kf27=\E[1;5R, kf28=\E[1;5S,
	kf29=\E[15;5~, kf3=\EOR, kf30=\E[17;5~, kf31=\E[18;5~,
	kf32=\E[19;5~, kf33=\E[20;5~, kf34=\E[21;5~,
	kf35=\E[23;5~, kf36=\E[24;5~, kf37=\E[1;6P, kf38=\E[1;6Q,
	kf39=\E[1;6R, kf4=\EOS, kf40=\E[1;6S, kf41=\E[15;6~,
	kf42=\E[17;6~, kf43=\E[18;6~, kf44=\E[19;6~,
	kf45=\E[20;6~, kf46=\E[21;6~, kf47=\E[23;6~,
	kf48=\E[24;6~, kf49=\E[1;3P, kf5=\E[15~, kf50=\E[1;3Q,
	kf51=\E[1;3R, kf52=\E[1;3S, kf53=\E[15;3~,
	kf54=\E[17;3~, kf55=\E[18;3~, kf56=\E[19;3~,
	kf57=\E[20;3~, kf58=\E[21;3~, kf59=\E[23;3~, kf6=\E[17~,
	kf60=\E[24;3~, kf61=\E[1;4P, kf62=\E[1;4Q, kf63=\E[1;4R,
	kf7=\E[18~, kf8=\E[19~, kf9=\E[20~, khome=\EOH,
	kind=\E[1;2B, kmous=\E[<, knp=\E[6~, kpp=\E[5~,
	kri=\E[1;2A, mc0=\E[i, mc4=\E[4i, mc5=\E[5i, meml=\El,
	memu=\Em, mgc=\E[?69l, oc=\E]104\E\\, op=\E[39;49m,
	rc=\E8, rep=%p1%c\E[%p2%{1}%-%db, rev=\E[7m,
	ri=\EM, rin=\E[%p1%dT, ritm=\E[23m, rmacs=\E(B,
	rmam=\E[?7l, rmcup=\E[?1049l\E[23;0;0t, rmir=\E[4l,
	rmkx=\E[?1l\E>, rmm=\E[?1034l, rmso=\E[27m, rmul=\E[24m,
	rs1=\Ec\E]104\E\\,
	rs2=\E[!p\E[?3;4l\E[4l\E>, sc=\E7,
	setab=\E[%?%p1%{8}%<%t4%p1%d%e%p1%{16}%<%t10%p1%{8}%-%d%e48;5;%p1%d%;m,
	setaf=\E[%?%p1%{8}%<%t3%p1%d%e%p1%{16}%<%t9%p1%{8}%-%d%e38;5;%p1%d%;m,
	sgr=%?%p9%t\E(0%e\E(B%;\E[0%?%p6%t;1%;%?%p5%t;2%;%?%p2%t;4%;%?%p1%p3%|%t;7%;%?%p4%t;5%;%?%p7%t;8%;m,
	sgr0=\E(B\E[m, sitm=\E[3m, smacs=\E(0, smam=\E[?7h,
	smcup=\E[?1049h\E[22;0;0t, smir=\E[4h, smkx=\E[?1h\E=,
	smm=\E[?1034h, smso=\E[7m, smul=\E[4m,
	smulx=\E[4:%p1%dm, tbc=\E[3g, tsl=\E]2;,
	u6=\E[%i%d;%dR, u7=\E[6n, u8=\E[?%[;0123456789]c,
	u9=\E[c, vpa=\E[%i%p1%dd,
	Smol=\E[53m, Rmol=\E[55m,
	Smulx=\E[4:%p1%dm,
	Se=\E[2 q, Ss=\E[%p1%d q,
	Cs=\E]12;%p1%s\E\\, Cr=\E]112\E\\,
	setrgbf=\E[38;2;%p1%d;%p2%d;%p3%dm,
	setrgbb=\E[48;2;%p1%d;%p2%d;%p3%dm,
TERMINFO
  echo "  -> Installed."
}

# -----------------------------------------------
# 5. Authenticate with GitHub via gh CLI
# -----------------------------------------------
echo "[5/8] Authenticating with GitHub..."
if gh auth status >/dev/null 2>&1; then
  echo "  -> Already authenticated, skipping."
else
  echo "  -> Follow the prompts to authenticate."
  echo "  -> Choose: SSH protocol, generate a new SSH key, no passphrase"
  gh auth login -h github.com -p ssh
fi

# -----------------------------------------------
# 6. Clone dotfiles
# -----------------------------------------------
echo "[6/8] Cloning dotfiles..."
if [ -d "$DOTFILES_DIR" ]; then
  echo "  -> $DOTFILES_DIR already exists, pulling latest."
  git -C "$DOTFILES_DIR" pull
else
  git clone "$REPO" "$DOTFILES_DIR"
fi

# -----------------------------------------------
# 7. Stow dotfiles
# -----------------------------------------------
echo "[7/8] Stowing dotfiles..."

# Backup any existing files that would conflict
[ -f "$HOME/.zprofile" ] && mv "$HOME/.zprofile" "$HOME/.zprofile.bak" 2>/dev/null || true
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$HOME/.zshrc.bak" 2>/dev/null || true
[ -f "$HOME/.zshenv" ] && mv "$HOME/.zshenv" "$HOME/.zshenv.bak" 2>/dev/null || true

# Stow dotfiles, ignoring .ssh (managed by gh/add-on on Pi)
# and .config/gh (managed by gh auth on Pi)
cd "$DOTFILES_DIR" && stow -t "$HOME" --ignore='\.ssh' --ignore='\.config/gh' .

# -----------------------------------------------
# 8. Install tmux & neovim plugins
# -----------------------------------------------
echo "[8/8] Installing tmux & neovim plugins..."

# TPM
if [ -d "$HOME/.config/tmux/plugins/tpm" ]; then
  echo "  -> TPM already installed."
else
  git clone https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"
fi
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins" || true

# Neovim plugins
echo "  -> Installing neovim plugins (this may take a minute)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

echo ""
echo "=== Bootstrap complete! ==="
echo ""
echo "Run 'exec zsh' to reload your shell."
echo "Or disconnect and reconnect: ssh ha"
