# mμbox

my (arch) linux system tools and templates.

[preview video](https://youtu.be/jaYG5cBICaU)

## files

| | |
|-|-|
| [`.varifs`](.varifs) | one theme to rule them all |
| [`vagrantfile`](vagrantfile) | for testing in vm |

## tools

| | |
|-|-|
| [`alkit`](alkit) | setup system from template(s) ~ _bash pacman rsync diff ./varifs_ |
| [`varifs`](varifs) | mirror a dir and resolve variables on file read ~ _python python-fuse_ |
| [`themor`](themor) | edit and preview varifs variables ~ _qt5-base qt5-declarative_ |

## templates

| | |
|-|-|
| [`audio`](audio/readme.md) | pipewire is awesome |
| [`base`](base/readme.md) | boring but important stuff |
| [`browser`](browser/readme.md) | insane how many options web browser have |
| [`console`](console/readme.md) | of course i want my colors in console |
| [`desktop`](desktop/readme.md) | some day i'll make my own |
| [`editor`](editor/readme.md) | blah blah |
| [`terminal`](terminal/readme.md) | yada yada |
| [`user`](user/readme.md) | default user |

## tips

- `alias vagrant="HOME=$PWD/.home vagrant"` to not spam your home
