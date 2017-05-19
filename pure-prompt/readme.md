# Purer

> Pretty one-line ZSH prompt based on [@sindresorhus](https://github.)'s [Pure](https://github.com/sindresorhus/pure)

![purer](https://cloud.githubusercontent.com/assets/583202/25418314/c3a29bfa-2a18-11e7-8a6f-4c0960ccadfc.png)

## Install

Can be installed with `npm` or [manually](https://github.com/sindresorhus/pure/blob/master/readme.md#manually). Requires Git 2.0.0+ and ZSH 5.2+.

```sh
$ npm install --global purer-prompt
```

Initialize the prompt system (if not so already) and choose `pure`:

```sh
# .zshrc
autoload -U promptinit; promptinit
prompt purer
```

See [Pure's readme](https://github.com/sindresorhus/pure/blob/master/readme.md#install) for more detailed instructions.

## Customization

Purer supports customization using [Pure's environment variables](https://github.com/sindresorhus/pure#options), plus:

### `PURE_PROMPT_SYMBOL_COLOR`

Defines the prompt symbol color. The default value is `magenta`.

## License

Purer MIT © [David Furnes](http://dfurnes.com) <br/>
Pure MIT © [Sindre Sorhus](http://sindresorhus.com)
