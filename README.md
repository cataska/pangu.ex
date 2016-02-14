# pangu.ex

Paranoid text spacing for good readability, to automatically insert whitespace between CJK (Chinese, Japanese, Korean) and half-width characters (alphabetical letters, numerical digits and symbols).

- `pangu.go <https://github.com/vinta/pangu>`_ (Go)
- `pangu.java <https://github.com/vinta/pangu.java>`_ (Java)
- `pangu.js <https://github.com/vinta/pangu.js>`_ (JavaScript, both Node.js and Browser)
- `pangu.objective-c <https://github.com/Cee/pangu.objective-c>`_ (Objective-C)
- `pangu.php <https://github.com/Kunr/pangu.php>`_ (PHP)
- `pangu.py <https://github.com/vinta/pangu.py>`_ (Python)
- `pangu.rb <https://github.com/dlackty/pangu.rb>`_ (Ruby)

## Usage

```elixir
require Pangu
Pangu.spacing("Sephiroth見他這等神情,也是悚然一驚:不知我這Ultimate Destructive Magic是否對付得了?")
# output: Sephiroth 見他這等神情, 也是悚然一驚: 不知我這 Ultimate Destructive Magic 是否對付得了?
```

## License

Released under the [MIT License](http://opensource.org/licenses/MIT).
