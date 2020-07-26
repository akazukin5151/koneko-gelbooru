from pathlib import Path

from blessed import Terminal

__version__ = '0.10.0'
KONEKODIR = Path('cache').expanduser()
TERM = Terminal()
