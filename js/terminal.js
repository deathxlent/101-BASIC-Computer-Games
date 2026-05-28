class BasicTerminal {
    constructor(options = {}) {
        this.outputElement = options.outputElement || null;
        this.inputElement = options.inputElement || null;
        this.inputCallback = null;
        this.waitingForInput = false;
        this.gameTitle = options.gameTitle || 'BASIC GAME';
        this.cursorVisible = true;
        
        this.init();
    }

    init() {
        if (this.inputElement) {
            this.inputElement.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' && this.waitingForInput) {
                    const value = this.inputElement.value;
                    this.inputElement.value = '';
                    this.handleInput(value);
                }
            });
        }
    }

    print(text = '') {
        if (!this.outputElement) return;
        
        const line = document.createElement('div');
        line.className = 'terminal-output';
        line.innerHTML = text.toString()
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/\n/g, '<br>')
            .replace(/ /g, '&nbsp;');
        
        this.outputElement.appendChild(line);
        this.scrollToBottom();
    }

    printSystem(text) {
        if (!this.outputElement) return;
        
        const line = document.createElement('div');
        line.className = 'terminal-output system-msg';
        line.textContent = text;
        this.outputElement.appendChild(line);
        this.scrollToBottom();
    }

    printError(text) {
        if (!this.outputElement) return;
        
        const line = document.createElement('div');
        line.className = 'terminal-output error-msg';
        line.textContent = text;
        this.outputElement.appendChild(line);
        this.scrollToBottom();
    }

    clear() {
        if (this.outputElement) {
            this.outputElement.innerHTML = '';
        }
    }

    async input(prompt = '') {
        return new Promise((resolve) => {
            this.waitingForInput = true;
            this.inputCallback = resolve;
            
            if (prompt) {
                this.print(prompt);
            }
            
            if (this.inputElement) {
                this.inputElement.disabled = false;
                this.inputElement.focus();
            }
        });
    }

    handleInput(value) {
        if (!this.waitingForInput || !this.inputCallback) return;
        
        this.printHistory(value);
        
        this.waitingForInput = false;
        if (this.inputElement) {
            this.inputElement.disabled = true;
        }
        
        const callback = this.inputCallback;
        this.inputCallback = null;
        callback(value);
    }

    printHistory(value) {
        if (!this.outputElement) return;
        
        const line = document.createElement('div');
        line.className = 'terminal-output input-history';
        line.innerHTML = `<span style="color: #00ffff;">? </span>${value}`;
        this.outputElement.appendChild(line);
        this.scrollToBottom();
    }

    scrollToBottom() {
        if (this.outputElement) {
            const parent = this.outputElement.parentElement;
            if (parent) {
                parent.scrollTop = parent.scrollHeight;
            }
        }
    }

    tab(num = 1) {
        return '&nbsp;'.repeat(num * 4);
    }

    space(num = 1) {
        return '&nbsp;'.repeat(num);
    }

    rnd(seed = 0) {
        return Math.random();
    }

    int(n) {
        return Math.floor(n);
    }

    log(n) {
        return Math.log(n);
    }

    sqr(n) {
        return Math.sqrt(n);
    }

    abs(n) {
        return Math.abs(n);
    }

    cos(n) {
        return Math.cos(n);
    }

    sin(n) {
        return Math.sin(n);
    }

    left(str, n) {
        return str.substring(0, n);
    }

    right(str, n) {
        return str.substring(str.length - n);
    }

    mid(str, start, length) {
        return str.substring(start - 1, start - 1 + (length || str.length));
    }

    len(str) {
        return str.length;
    }

    chr(n) {
        return String.fromCharCode(n);
    }

    asc(c) {
        return c.charCodeAt(0);
    }

    async delay(ms) {
        return new Promise(resolve => setTimeout(resolve, ms));
    }

    pause(ms = 500) {
        return this.delay(ms);
    }
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = BasicTerminal;
}
